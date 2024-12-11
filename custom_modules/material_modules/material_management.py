from flask import Blueprint, g, request, session, abort, jsonify
from custom_modules.main_modules import db, utils
from custom_modules.main_modules.decorators import required_login
from sqlalchemy import func
import json

material_management = Blueprint('material_management', __name__)

@material_management.route('/api/visiblematerial', methods=['GET', 'POST', 'PUT'])
@required_login
def visiblematerial():
    if request.method == 'GET':
        offset = request.args.get("offset")
        limit = request.args.get("limit")
        search = request.args.get("search")
        farm_id = 0

        items = (g.session.query(db.models.ITEMS, db.models.SUPPLIER_TYPE_LIST)
                          .filter(db.models.ITEMS.type_code == db.models.SUPPLIER_TYPE_LIST.type_code)
                          .filter(db.models.ITEMS.type_code != 1)
                          .filter(db.models.ITEMS.item_name.contains(search))
                          .offset(offset)
                          .limit(limit)
                          .all())
        visible_material_list = []

        if session.get("is_superuser") == 0:
            farm_id = session.get("parent")
        else:
            farm_id = session.get("id")

        for item, item_type in items:
            item_adder = (g.session.query(db.models.user).filter(
                db.models.user.username == item.update_user).first())
            visible = (g.session.query(db.models.farm_visible_material)
                                .filter(db.models.farm_visible_material.item_no == item.item_no)
                                .filter(db.models.farm_visible_material.farm_id == farm_id)
                                .first())
            if visible is None:
                state = 0
            else:
                state = visible.visible
            if item_adder.id != 1:  # isn't admin
                if item_adder.parent_id == farm_id:
                    visible_material_list.append(
                        {
                            "state": state,
                            "item_no": item.item_no,
                            "item_name": item.item_name,
                            "type": item_type.type_name,
                            "label": item.label
                        }
                    )
            elif item_adder.id == 1:
                visible_material_list.append(
                    {
                        "state": state,
                        "item_no": item.item_no,
                        "item_name": item.item_name,
                        "type": item_type.type_name,
                        "label": item.label
                    }
                )

            table_response = {
                "total": g.session.query(func.count(db.models.ITEMS.item_no))
                .filter(db.models.ITEMS.type_code == db.models.SUPPLIER_TYPE_LIST.type_code)
                .filter(db.models.ITEMS.type_code != 1)
                .filter(db.models.ITEMS.item_name.contains(search))
                .scalar(),
                "rows": visible_material_list
            }

        return table_response
    elif request.method == 'POST':
        data = json.loads(request.get_data())

        for obj in data:
            if session.get('is_superuser') == 0:
                farm_id = session.get("parent")
            else:
                farm_id = session.get('id')

            visible = (g.session.query(db.models.farm_visible_material)
                                .filter(db.models.farm_visible_material.item_no == obj["item_no"])
                                .filter(db.models.farm_visible_material.farm_id == farm_id)
                                .first())
            if visible is None:
                g.session.add(
                    db.models.farm_visible_material(
                        item_no=obj["item_no"],
                        farm_id=farm_id,
                        visible=int(obj["state"] == True)
                    )
                )
            else:
                (g.session.query(db.models.farm_visible_material)
                 .filter(db.models.farm_visible_material.item_no == obj["item_no"])
                 .filter(db.models.farm_visible_material.farm_id == farm_id)
                 .update(
                    {
                        "visible": int(obj["state"] == True)
                    }
                ))
        g.session.commit()
        return "ok"
    elif request.method == 'PUT':
        if session.get("is_superuser") == 0:
            farm_id = session.get("parent")
        else:
            farm_id = session.get("id")
            
        target = db.models.farm_visible_material
        query = (g.session.query(target).filter(
            target.farm_id == farm_id).update({"visible": 0}))
        g.session.commit()
        return "ok"
    else:
        abort(405)


@material_management.route('/api/visible_material_detail', methods=['GET'])
@required_login
def visible_material_detail():
    material_id = request.args.get("id") or None

    if not material_id:
        abort(404)

    items = db.models.ITEMS
    sup_type = db.models.SUPPLIER_TYPE_LIST
    cult = db.models.CULTIVAR_LIST
    sup = db.models.SUPPLIER
    query_list = [
        "sup_type",
        "organic_material_no",
        "cultivar_id",
        "pest_reg_no",
        "fert_type",
        "reg_file_no",
        "item_name",
        "ingredients",
        "row_material",
        "memo",
        "sup_name",
        "busi_id",
        "user_name",
        "tel_no",
        "sup_addr",
        "email",
        "sup_memo"
    ]
    query = (g.session.query(sup_type.type_name,
                             items.organic_material_no,
                             items.cultivar_id,
                             items.pest_reg_no,
                             items.fert_type,
                             items.reg_file_no,
                             items.item_name,
                             items.ingredients,
                             items.row_material,
                             items.memo,
                             sup.sup_name,
                             sup.busi_id,
                             sup.user_name,
                             sup.tel_no,
                             sup.sup_addr,
                             sup.email,
                             sup.memo
                             )
             .filter(items.item_no == material_id)
             .filter(items.type_code == sup_type.type_code)
             .filter(items.sup_id == sup.sup_id)
             .first())

    datas = []
    for column, column_data in zip(query_list, query):
        if column_data:
            datas.append(
                {
                    "column": column,
                    "data": column_data
                }
            )
    return jsonify(datas)


@material_management.route('/api/material', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_login
def material_api():
    if request.method == 'GET':
        # Read info
        material_query = (g.session.query(db.models.ITEMS).all())
        material_query_restricted = (g.session.query(db.models.ITEMS).filter(
            db.models.ITEMS.type_code >= 2).filter(db.models.ITEMS.type_code <= 4).all())
        material = []
        if session.get("is_superuser") in [1, 2]:
            material = [utils.row2dict(info) for info in material_query]
        elif session.get("is_superuser") == 0:
            for info in material_query_restricted:
                if (info.update_user == "admin") or (utils.get_farmid_by_name(info.update_user) == session.get("parent")):
                    material.append(utils.row2dict(info))
        elif session.get("is_superuser") == 4:
            for info in material_query_restricted:
                if (info.update_user == "admin") or (utils.get_farmid_by_name(info.update_user) == session.get("id")):
                    material.append(utils.row2dict(info))
        else:
            abort(404)

        supplier = {}
        supplier_query = (g.session
                           .query(db.models.SUPPLIER)
                           .all())
        for sup in supplier_query:
            supplier.update(utils.row2dict_extra(sup, "sup_id"))

        sup_type = {}
        sup_type_query = (g.session
                          .query(db.models.SUPPLIER_TYPE_LIST)
                          .all())
        for type in sup_type_query:
            sup_type.update(utils.row2dict_extra(type, "type_code"))

        cultivar_type = {}
        cultivar_query = (g.session
                          .query(db.models.CULTIVAR_LIST)
                          .all())
        for crop in cultivar_query:
            cultivar_type.update(utils.row2dict_extra(crop, "cultivar_id"))

        material_response = [sup_type] + \
            [supplier] + [cultivar_type] + material

        return json.dumps(material_response)

    elif request.method == 'POST':
        if session.get('is_superuser') not in [1, 2]:
            abort(401)
        try:
            item_name = request.json.get('item_name')
            type_code = request.json.get('type_code')
            memo = request.json.get('memo')
            sup_id = request.json.get('sup_id')
            organic_material_no = request.json.get(
                'organic_material_no') or None
            pest_reg_no = request.json.get('pest_reg_no') or None
            fert_type = request.json.get('fert_type') or None
            reg_file_no = request.json.get('reg_file_no') or None
            row_material = request.json.get('row_material') or None
            ingredients = request.json.get('ingredients') or None
            cultivar_id = request.json.get('cultivar_id') or None
            label = (g.session.query(db.models.SUPPLIER).filter(
                db.models.SUPPLIER.sup_id == sup_id).first()).sup_name

            if type_code == 2:
                if fert_type and reg_file_no and row_material and ingredients:
                    pass
                else:
                    abort(405)
            elif type_code == 3:
                if pest_reg_no and ingredients:
                    pass
                else:
                    abort(405)
            elif type_code == 4:
                if row_material:
                    pass
                else:
                    abort(405)
            elif type_code == 1:
                if cultivar_id:
                    pass
                else:
                    abort(405)

            new_item = db.models.ITEMS(item_name=item_name,
                                       type_code=type_code,
                                       memo=memo,
                                       label=label,
                                       sup_id=sup_id,
                                       organic_material_no=organic_material_no,
                                       pest_reg_no=pest_reg_no,
                                       fert_type=fert_type,
                                       reg_file_no=reg_file_no,
                                       row_material=row_material,
                                       ingredients=ingredients,
                                       cultivar_id=cultivar_id,
                                       update_user=session.get("username"))
        except:
            abort(406)

        g.session.add(new_item)
        g.session.commit()

        material_query = (g.session
                           .query(db.models.ITEMS)
                           .all())
        material = [utils.row2dict(info) for info in material_query]

        supplier = {}
        supplier_query = (g.session
                           .query(db.models.SUPPLIER)
                           .all())
        for sup in supplier_query:
            supplier.update(utils.row2dict_extra(sup, "sup_id"))

        sup_type = {}
        sup_type_query = (g.session
                          .query(db.models.SUPPLIER_TYPE_LIST)
                          .all())
        for type in sup_type_query:
            sup_type.update(utils.row2dict_extra(type, "type_code"))

        material_response = [sup_type] + [supplier] + material

        return json.dumps(material_response)
    elif request.method == 'PUT':
        # Update info
        if session.get('is_superuser') not in [1, 2]:
            abort(401)
        item_no = request.json.get('item_no')
        item_name = request.json.get('item_name')
        sup_id = request.json.get('sup_id')
        type_code = request.json.get('type_code')
        material_code = request.json.get('material_code')
        material_no = request.json.get('material_no')
        memo = request.json.get('memo')
        organic_material_no = request.json.get('organic_material_no') or None
        pest_reg_no = request.json.get('pest_reg_no') or None
        fert_type = request.json.get('fert_type') or None
        reg_file_no = request.json.get('reg_file_no') or None
        row_material = request.json.get('row_material') or None
        ingredients = request.json.get('ingredients') or None
        label = (g.session.query(db.models.SUPPLIER).filter(
            db.models.SUPPLIER.sup_id == sup_id).first()).sup_name

        if type_code == 2:
            if fert_type and reg_file_no and row_material and ingredients:
                pass
            else:
                abort(405)
        elif type_code == 3:
            if pest_reg_no and ingredients:
                pass
            else:
                abort(405)
        elif type_code == 4:
            if row_material:
                pass
            else:
                abort(405)
        try:
            request.json["update_user"] = session.get("username")
            request.json["label"] = label
            (g.session
                .query(db.models.ITEMS)
                .filter(db.models.ITEMS.item_no == item_no)
                .update(request.json))
            g.session.commit()
        except:
            abort(406)

        return 'ok'
    elif request.method == 'DELETE':
        # Delete info
        if session.get('is_superuser') != 1:
            abort(401)
        item_no = request.args.get("material_id")
        (g.session
          .query(db.models.ITEMS)
          .filter(db.models.ITEMS.item_no == item_no)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)