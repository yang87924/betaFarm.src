from flask import Blueprint, request, g, session,abort
from custom_modules.main_modules.decorators import required_login
from custom_modules.main_modules import db, utils
import json
import re

material_supplier = Blueprint('material_supplier', __name__)

@material_supplier.route('/ItemSupplier', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_login
def ItemSupplier():
    if request.method == 'GET':
        # Read info
        types_query = (g.session
                       .query(db.models.SUPPLIER_TYPE_LIST)
                       .all())
        types = [utils.row2dict(info) for info in types_query]

        supr = db.models.SUPPLIER
        sups = g.session.query(supr).order_by(supr.sup_id).all()
        sups_restricted = g.session.query(supr).filter(supr.type_code != 1).filter(
            supr.type_code != 8).order_by(supr.sup_id).all()
        sup = []

        if session.get("is_superuser") in [1, 2]:  # admin region
            for info in sups:
                temp_info = utils.row2dict(info)
                temp_info["type_code_name"] = types[temp_info["type_code"]-1]["type_name"]
                sup.append(temp_info)
        elif session.get("is_superuser") == 0:  # field
            for info in sups_restricted:
                if (info.update_user == "admin") or (utils.get_farmid_by_name(info.update_user) == session.get("parent")):
                    temp_info = utils.row2dict(info)
                    temp_info["type_code_name"] = types[temp_info["type_code"]-1]["type_name"]
                    sup.append(temp_info)
        elif session.get("is_superuser") == 4:  # farm
            for info in sups_restricted:
                if (info.update_user == "admin") or (utils.get_farmid_by_name(info.update_user) == session.get("id")):
                    temp_info = utils.row2dict(info)
                    temp_info["type_code_name"] = types[temp_info["type_code"]-1]["type_name"]
                    sup.append(temp_info)

        return json.dumps([{"type_list": types}]+sup)

    elif request.method == 'POST':
        if session.get('is_superuser') not in [1, 2]:
            abort(401)
        try:
            sup_name = request.json.get('sup_name')
            type_code = request.json.get('type_code')
            if session.get('is_superuser') == 0:
                type_code = 9  # field user add
            user_name = request.json.get('user_name') or None
            sup_addr = request.json.get('sup_addr') or None
            wechat_id = request.json.get('wechat_id') or None
            memo = request.json.get('memo')
            update_user = session.get("username")
            tel_no = request.json.get('tel_no')
            email = request.json.get('email') or None
            busi_id = request.json.get('busi_id') or None

            if tel_no is not None:
                if re.match('^\d{7,18}$', tel_no) is not None:
                    pass
                else:
                    abort(406)
            if email is not None:
                if re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
                    pass
                else:
                    abort(406)
            if busi_id is not None:
                if re.match('^\d{8}$', busi_id) is not None:
                    pass
                else:
                    abort(406)

            new_info = db.models.SUPPLIER(
                sup_name=request.json.get('sup_name'),
                busi_id=busi_id,
                type_code=request.json.get('type_code'),
                user_name=request.json.get('user_name'),
                tel_no=tel_no,
                sup_addr=request.json.get('sup_addr'),
                email=email,
                wechat_id=request.json.get('wechat_id'),
                memo=request.json.get('memo'),
                update_user=session.get("username"))
        except:
            abort(406)
        g.session.add(new_info)
        g.session.commit()
        sups = g.session.query(db.models.SUPPLIER).order_by(
            db.models.SUPPLIER.sup_id).all()
        return json.dumps([utils.row2dict(info) for info in sups])
    elif request.method == 'PUT':
        # Update info
        if session.get('is_superuser') not in [1, 2]:
            abort(401)
        id_ = request.json.get('sup_id')
        tel_no = request.json.get('tel_no') or None
        email = request.json.get('email') or None
        busi_id = request.json.get('busi_id') or None
        if tel_no is not None:
            if re.match('^\d{7,18}$', tel_no) is not None:
                pass
            else:
                abort(406)
        if email is not None:
            if re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
                pass
            else:
                abort(406)
        if busi_id is not None:
            if re.match('^\d{8}$', busi_id) is not None:
                pass
            else:
                abort(406)
        try:

            request.json["update_user"] = session.get("username")
            (g.session
              .query(db.models.SUPPLIER)
              .filter(db.models.SUPPLIER.sup_id == id_)
              .update(request.json))
            g.session.commit()
        except:
            abort(406)
        return 'ok'
    elif request.method == 'DELETE':
        # Delete info
        if session.get('is_superuser') not in [1]:
            abort(401)
        id_ = request.args.get('sup_id')
        (g.session
          .query(db.models.SUPPLIER)
          .filter(db.models.SUPPLIER.sup_id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)