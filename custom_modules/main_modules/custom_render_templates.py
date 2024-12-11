from flask import (redirect, session, request, jsonify, g,
                   render_template as flask_render_template)
from custom_modules.main_modules import db, utils

# coded in Naki's novice period, it's long and shitful but can work


def before_login(*args, **argv):
    fields = []
    demo_user = 'demo'
    query = (g.session
              .query(db.models.field.id,
                     db.models.field.name,
                     db.models.field.alias,
                     db.models.field.iframe,
                     db.models.user_access.is_active)
              .select_from(db.models.field)
              .join(db.models.user_access)
              .join(db.models.user)
              .filter(db.models.user.username == demo_user)
              .order_by(db.models.user_access.id)
              .all())
    for id, name, alias, iframe, is_active in query:
        field_data = {
            'id': id,
            'name': name,
            'alias': alias,
            'iframe': iframe.replace('{username}', demo_user),
            'is_active': 1 & is_active,
            'sensors': []
        }
        for sensor in (g.session
                        .query(db.models.field_sensor)
                        .filter(db.models.field_sensor.field == id)
                        .order_by(db.models.field_sensor.id)
                        .all()):
            field_data['sensors'].append(utils.row2dict(sensor))
        fields.append(field_data)

    return flask_render_template(*args,
                                 fields=fields,
                                 username=demo_user,
                                 is_superuser=0,
                                 **argv)


def render_template(*args, **argv):
    fields = []
    query = (g.session
              .query(db.models.field.id,
                     db.models.field.name,
                     db.models.field.alias,
                     db.models.field.iframe,
                     db.models.field.ipcam,
                     db.models.user_access.is_active)
              .select_from(db.models.field)
              .join(db.models.user_access)
              .join(db.models.user)
              .filter(db.models.user.username == session.get('username'))
              .order_by(db.models.user_access.id)
              .all())
    for id, name, alias, iframe, ipcam, is_active in query:
        field_data = {
            'id': id,
            'name': name,
            'alias': alias,
            'iframe': iframe.replace('{username}', session.get('username')),
            'ipcam': ipcam.replace('{username}', session.get('username')),
            'is_active': 1 & is_active,
            'sensors': []
        }
        for sensor in (g.session
                        .query(db.models.field_sensor)
                        .filter(db.models.field_sensor.field == id)
                        .order_by(db.models.field_sensor.id)
                        .all()):
            field_data['sensors'].append(utils.row2dict(sensor))
        fields.append(field_data)

    user = (g.session
             .query(db.models.user)
             .filter(db.models.user.username == session.get('username'))
             .first())

    return flask_render_template(*args,
                                 fields=fields,
                                 username=session.get('username'),
                                 is_superuser=session.get('is_superuser'),
                                 memo=user.memo,
                                 **argv)


def control_template(*args, **argv):

    controller_access = db.models.controller_access
    controller_list = db.models.controller_list

    controller_query = (g.session.query(controller_list)
                                 .filter(controller_access.user_id == session.get('id'))
                                 .filter(controller_access.controller_id == controller_list.controller_id)
                                 .all())

    controller_access_list = []
    for ctrl in controller_query:
        controller_access_list.append(
            {
                "name": ctrl.controller_name,
                "alias": ctrl.controller_alias,
                "mac": ctrl.host_mac
            }
        )

    if controller_query is not None:
        have_m3 = True
    else:
        have_m3 = False

    return flask_render_template(
        *args,
        have_m3=have_m3,
        controller_access_list=controller_access_list,
        username=session.get('username'),
        is_superuser=session.get('is_superuser'),
        **argv
    )


def gacp_template(*args, **argv):
    item_type_query = g.session.query(db.models.SUPPLIER_TYPE_LIST).filter(
        db.models.SUPPLIER_TYPE_LIST.type_code.in_([2,3,4])).all()
    for row in item_type_query:
        item_types = [utils.row2dict(info) for info in item_type_query]

    return flask_render_template(*args,
                                 is_superuser=session.get('is_superuser'),
                                 username=session.get('username'),
                                 cult_items=get_cult_items(),
                                 field_id_active=get_field_id_active(),
                                 item_types=item_types,
                                 user_sup=get_user_seed_sup(),
                                 sales_sup=get_sales_sup(),
                                 granding_list=get_granding_list(),
                                 storage_list=get_storage_list(),
                                 certificate_list=get_certificate_list(),
                                 control_obj_list=get_control_obj_list(),
                                 cult_work_list=get_cult_work_list(),
                                 fert_cons_list=get_fert_cons_list(),
                                 post_harvest_list=get_post_harvest_list(),
                                 fert_materials=get_materials("fert"),
                                 prev_materials=get_materials("prev"),
                                 other_materials=get_materials("other"),
                                 fert_materials_purchased=get_fert_materials_purchased(),
                                 prev_materials_purchased=get_prev_materials_purchased(),
                                 seed_units=get_units("seed"),
                                 material_units=get_units("material"),
                                 weight_units=get_units("weight"),
                                 is_organic_flask=False,
                                 **argv)


def organic_gacp_template(*args, **argv):
    field_id_active_affidavit = []
    field_id_active_query_affidavit = (g.session
                                       .query(db.models.GACP_LIST_LOG.region_id)
                                       .join(db.models.FIELD_INFO, db.models.GACP_LIST_LOG.region_id == db.models.FIELD_INFO.field_id)
                                       .filter(db.models.FIELD_INFO.field_user == session.get('username'))
                                       .filter(db.models.GACP_LIST_LOG.is_organic == 1)
                                       .filter(db.models.GACP_LIST_LOG.organic_affidavit == 0)
                                       .filter(db.models.GACP_LIST_LOG.status == 1)
                                       .order_by(db.models.GACP_LIST_LOG.region_id)
                                       .all())

    for id in field_id_active_query_affidavit:
        field_name = (g.session
                      .query(db.models.field)
                      .filter(db.models.field.id == id.region_id)
                      .first())
        field_id_active_affidavit.append(
            [id.region_id, field_name.name, field_name.alias])

    return flask_render_template(*args,
                                 is_superuser=session.get('is_superuser'),
                                 username=session.get('username'),
                                 field_id_active=get_field_id_active(org=True),
                                 field_id_active_affidavit=field_id_active_affidavit,
                                 cult_items=get_cult_items(),
                                 user_sup=get_user_seed_sup(),
                                 sales_sup=get_sales_sup(),
                                 certificate_list=get_certificate_list(),
                                 cult_work_list=get_cult_work_list(),
                                 fert_cons_list=get_fert_cons_list(),
                                 control_obj_list=get_control_obj_list(),
                                 granding_list=get_granding_list(),
                                 storage_list=get_storage_list(),
                                 post_harvest_list=get_post_harvest_list(),
                                 fert_materials=get_materials("fert"),
                                 prev_materials=get_materials("prev"),
                                 other_materials=get_materials("other"),
                                 fert_materials_purchased=get_fert_materials_purchased(
                                     org=True),
                                 prev_materials_purchased=get_prev_materials_purchased(
                                     org=True),
                                 seed_units=get_units("seed"),
                                 material_units=get_units("material"),
                                 weight_units=get_units("weight"),
                                 is_organic_flask=True,
                                 **argv)


def gacp_search_template(*args, **argv):
    farm_id = []
    field_id = []
    gacp_no = []
    if session.get('is_superuser') == 1:
        farm_id_query = (g.session
                          .query(db.models.GACP_LIST_LOG.farm_id, db.models.FARM_INFO.farm_name)
                          .filter(db.models.GACP_LIST_LOG.farm_id == db.models.FARM_INFO.farm_id)
                          .order_by(db.models.GACP_LIST_LOG.farm_id)
                          .group_by(db.models.GACP_LIST_LOG.farm_id)
                          .all())
        for id, name in farm_id_query:
            farm_id.append([id, name])

        field_id_query = (g.session
                           .query(db.models.GACP_LIST_LOG.region_id)
                           .select_from(db.models.GACP_LIST_LOG)
                           .order_by(db.models.GACP_LIST_LOG.region_id)
                           .all())

        for id in field_id_query:
            field_name = (g.session
                          .query(db.models.field)
                          .filter(db.models.field.id == id.region_id)
                          .first())
            farm = (g.session
                     .query(db.models.FIELD_INFO.farm_id)
                     .filter(db.models.FIELD_INFO.field_id == id.region_id)
                     .first())
            field_id.append([id.region_id, field_name.name,
                             farm.farm_id, field_name.alias])

        gacp_no_query = (g.session
                         .query(db.models.GACP_LIST_LOG.gacp_no)
                         .select_from(db.models.GACP_LIST_LOG)
                         .order_by(db.models.GACP_LIST_LOG.gacp_no)
                         .all())
        for id in gacp_no_query:
            gacp_no.append(id)
    elif session.get('is_superuser') == 4:
        farm_id_query = (g.session
                          .query(db.models.GACP_LIST_LOG.farm_id, db.models.FARM_INFO.farm_name)
                          .filter(db.models.GACP_LIST_LOG.farm_id == db.models.FARM_INFO.farm_id)
                          .filter(db.models.GACP_LIST_LOG.farm_id == session.get("id"))
                          .order_by(db.models.GACP_LIST_LOG.farm_id)
                          .group_by(db.models.GACP_LIST_LOG.farm_id)
                          .all())
        for id, name in farm_id_query:
            farm_id.append([id, name])

        field_id_query = (g.session
                           .query(db.models.GACP_LIST_LOG.region_id)
                           .select_from(db.models.GACP_LIST_LOG)
                           .filter(db.models.GACP_LIST_LOG.farm_id == session.get("id"))
                           .filter(db.models.GACP_LIST_LOG.status == 1)
                           .order_by(db.models.GACP_LIST_LOG.region_id)
                           .all())
        for id in field_id_query:
            field_name = (g.session
                          .query(db.models.field)
                          .filter(db.models.field.id == id.region_id)
                          .first())
            farm = (g.session
                     .query(db.models.FIELD_INFO.farm_id)
                     .filter(db.models.FIELD_INFO.field_id == id.region_id)
                     .first())
            field_id.append([id.region_id, field_name.name,
                             farm.farm_id, field_name.alias])

        gacp_no_query = (g.session
                         .query(db.models.GACP_LIST_LOG.gacp_no)
                         .select_from(db.models.GACP_LIST_LOG)
                         .filter(db.models.GACP_LIST_LOG.farm_id == session.get("id"))
                         .order_by(db.models.GACP_LIST_LOG.gacp_no)
                         .all())
        for id in gacp_no_query:
            gacp_no.append(id)
    elif session.get('is_superuser') == 0:
        farm_id_query = (g.session
                          .query(db.models.user.parent_id, db.models.FARM_INFO.farm_name)
                          .filter(db.models.user.parent_id == db.models.FARM_INFO.farm_id)
                          .filter(db.models.user.id == session.get("id"))
                          .all())
        for id, name in farm_id_query:
            farm_id.append([id, name])

        myself = (g.session
                   .query(db.models.user)
                   .filter(db.models.user.id == session.get("id"))
                   .first())

        field_id_query = (g.session
                           .query(db.models.FIELD_INFO.field_id)
                           .filter(db.models.FIELD_INFO.field_user == session.get("username"))
                           .filter(db.models.FIELD_INFO.farm_id == myself.parent_id)
                           .all())
        for id in field_id_query:
            field_name = (g.session
                          .query(db.models.field)
                          .filter(db.models.field.id == id.field_id)
                          .first())
            farm = (g.session
                     .query(db.models.FIELD_INFO.farm_id)
                     .filter(db.models.FIELD_INFO.field_id == id.field_id)
                     .first())
            field_id.append([id.field_id, field_name.name,
                             farm.farm_id, field_name.alias])

        gacp_no_query = (g.session
                         .query(db.models.GACP_LIST_LOG.gacp_no)
                         .select_from(db.models.GACP_LIST_LOG)
                         .filter(db.models.GACP_LIST_LOG.farm_id == myself.parent_id)
                         .order_by(db.models.GACP_LIST_LOG.gacp_no)
                         .all())
        for id in gacp_no_query:
            gacp_no.append(id)

    return flask_render_template(*args,
                                 is_superuser=session.get('is_superuser'),
                                 username=session.get('username'),
                                 farm_id=farm_id,
                                 field_id=field_id,
                                 gacp_no=gacp_no,
                                 cult_items=get_cult_items(),
                                 user_sup=get_user_seed_sup(),
                                 sales_sup=get_sales_sup(),
                                 cult_work_list=get_cult_work_list(),
                                 fert_cons_list=get_fert_cons_list(),
                                 certificate_list=get_certificate_list(),
                                 control_obj_list=get_control_obj_list(),
                                 storage_list=get_storage_list(),
                                 granding_list=get_granding_list(),
                                 post_harvest_list=get_post_harvest_list(),
                                 fert_materials=get_materials("fert"),
                                 prev_materials=get_materials("prev"),
                                 other_materials=get_materials("other"),
                                 fert_materials_purchased=get_fert_materials_purchased(),
                                 prev_materials_purchased=get_prev_materials_purchased(),
                                 seed_units=get_units("seed"),
                                 material_units=get_units("material"),
                                 weight_units=get_units("weight"),
                                 **argv)


def get_cult_work_list():
    temp_cult_work_list = g.session.query(db.models.CULT_WORK_LIST).order_by(
        db.models.CULT_WORK_LIST.cult_work_code).all()
    cult_work_list = [utils.row2dict(info) for info in temp_cult_work_list]
    return cult_work_list


def get_fert_cons_list():
    temp_fert_cons_list = g.session.query(db.models.FERT_CONS_LIST).order_by(
        db.models.FERT_CONS_LIST.fert_cons_code).all()
    fert_cons_list = [utils.row2dict(info) for info in temp_fert_cons_list]
    return fert_cons_list


def get_control_obj_list():
    temp_control_obj_list = g.session.query(db.models.CONTROL_OBJ_LIST).order_by(
        db.models.CONTROL_OBJ_LIST.control_obj_code).all()
    control_obj_list = [utils.row2dict(info) for info in temp_control_obj_list]
    return control_obj_list


def get_certificate_list():
    temp_certificate_list = g.session.query(db.models.CERTIFICATE_LIST).all()
    certificate_list = [utils.row2dict(row) for row in temp_certificate_list]
    return certificate_list


def get_granding_list():
    temp_granding_list = g.session.query(db.models.GRADING_CODE_LIST).order_by(
        db.models.GRADING_CODE_LIST.grading_code).all()
    granding_list = [utils.row2dict(info) for info in temp_granding_list]
    return granding_list


def get_storage_list():
    temp_storage_list = g.session.query(db.models.STORAGE_CODE_LIST).order_by(
        db.models.STORAGE_CODE_LIST.storage_code).all()
    storage_list = [utils.row2dict(info) for info in temp_storage_list]
    return storage_list


def get_materials(type):
    materials_type_dict = {"fert": 2, "prev": 3, "other": 4}
    materials_type_id = materials_type_dict[type]
    temp_material = (g.session.query(db.models.ITEMS, db.models.farm_visible_material)
                     .filter(db.models.ITEMS.type_code == materials_type_id)
                     .filter(db.models.farm_visible_material.farm_id == session.get("parent"))
                     .filter(db.models.farm_visible_material.item_no == db.models.ITEMS.item_no)
                     .filter(db.models.farm_visible_material.visible == 1)
                     .all())
    materials = [utils.row2dict(info) for info, visi in temp_material]
    return materials


def get_units(type):
    units_type_dict = {"weight": 2, "seed": 5, "material": 6}
    units_type_id = units_type_dict[type]
    units_query = g.session.query(db.models.units).filter(
        db.models.units.type_id == units_type_id).all()
    units = [utils.row2dict(unit) for unit in units_query]
    return units


def get_cult_items():
    cult_items = []
    temp_cultivar_name = ''
    cultivar_counter = 0
    crops_query = (g.session.query(db.models.ITEMS, db.models.CULTIVAR_LIST)
                            .filter(db.models.ITEMS.type_code == 1)
                            .filter(db.models.ITEMS.cultivar_id is not None)
                            .filter(db.models.ITEMS.cultivar_id == db.models.CULTIVAR_LIST.cultivar_id)
                            .order_by(db.models.ITEMS.cultivar_id, db.models.ITEMS.item_name)
                            .all())
    for item, cultivar in crops_query:
        if temp_cultivar_name != cultivar.cultivar_name:
            temp_cultivar_name = cultivar.cultivar_name
            cultivar_counter += 1
            cult_items.append(
                {
                    "name": temp_cultivar_name,
                    "crop": []
                }
            )
        cult_items[cultivar_counter-1]["crop"].append(
            {
                "item_no": item.item_no,
                "item_name": item.item_name
            }
        )
    return cult_items


def get_field_id_active(org=False):

    field_id_active = []
    field_id_active_query = (g.session
                             .query(db.models.GACP_LIST_LOG.region_id)
                             .join(db.models.FIELD_INFO, db.models.GACP_LIST_LOG.region_id == db.models.FIELD_INFO.field_id)
                             .filter(db.models.FIELD_INFO.field_user == session.get('username'))
                             .filter(db.models.GACP_LIST_LOG.status == 1))

    if org:
        field_id_active_query = field_id_active_query.filter(
            db.models.GACP_LIST_LOG.is_organic == 1).filter(db.models.GACP_LIST_LOG.organic_affidavit == 1)
    else:
        field_id_active_query = field_id_active_query.filter(
            db.models.GACP_LIST_LOG.is_organic == 0)

    field_id_active_query = field_id_active_query.order_by(
        db.models.GACP_LIST_LOG.region_id).all()

    for id in field_id_active_query:
        field_name = (g.session
                      .query(db.models.field)
                      .filter(db.models.field.id == id.region_id)
                      .first())
        field_id_active.append(
            [id.region_id, field_name.name, field_name.alias])
    return field_id_active


def get_user_seed_sup():
    temp_user_sup = g.session.query(db.models.SUPPLIER).filter(
        db.models.SUPPLIER.type_code == 9).order_by(db.models.SUPPLIER.sup_id).all()
    user_sup = []
    for row in temp_user_sup:
        sup_updater = (g.session.query(db.models.user)
                                .filter(db.models.user.username == row.update_user)
                                .first())
        if sup_updater.parent_id == session.get("parent"):
            user_sup.append(utils.row2dict(row))
    return user_sup


def get_sales_sup():
    temp_sales_sup = g.session.query(db.models.SALES_INFO).filter(
        db.models.SALES_INFO.update_farm_id == session.get("parent")).order_by(db.models.SALES_INFO.name).all()
    sales_sup = [utils.row2dict(info) for info in temp_sales_sup]
    return sales_sup


def get_fert_materials_purchased(org=False):

    temp_fert_material_purchased = (g.session
                                    .query(db.models.FERT_PURCH_RECORD, db.models.ITEMS)
                                    .filter(db.models.FERT_PURCH_RECORD.material_code == db.models.ITEMS.item_no)
                                    .filter(db.models.FERT_PURCH_RECORD.farm_id == session.get("parent"))
                                    .filter(db.models.FERT_PURCH_RECORD.is_old == 0))

    if org:
        temp_fert_material_purchased = temp_fert_material_purchased.filter(
            db.models.ITEMS.organic_material_no.isnot(None))

    temp_fert_material_purchased = temp_fert_material_purchased.all()

    fert_materials_purchased = []
    for record, item in temp_fert_material_purchased:
        fert_materials_purchased.append(
            {
                "record_id": record.record_id,
                "item_name": item.item_name,
                "lot_number": record.lot_number
            }
        )
    return fert_materials_purchased


def get_prev_materials_purchased(org=False):

    temp_prev_material_purchased = (g.session
                                    .query(db.models.PREVE_PURCH_RECORD, db.models.ITEMS)
                                    .filter(db.models.PREVE_PURCH_RECORD.material_code == db.models.ITEMS.item_no)
                                    .filter(db.models.PREVE_PURCH_RECORD.farm_id == session.get("parent"))
                                    .filter(db.models.PREVE_PURCH_RECORD.is_old == 0))
    if org:
        temp_prev_material_purchased = temp_prev_material_purchased.filter(
            db.models.ITEMS.organic_material_no.isnot(None))

    temp_prev_material_purchased = temp_prev_material_purchased.all()

    prev_materials_purchased = []
    for record, item in temp_prev_material_purchased:
        prev_materials_purchased.append(
            {
                "record_id": record.record_id,
                "item_name": item.item_name,
                "lot_number": record.lot_number
            }
        )
    return prev_materials_purchased


def get_post_harvest_list():
    temp_post_harvest_list = (g.session
                              .query(db.models.HARVEST_RECORD)
                              .join(db.models.FIELD_INFO, db.models.HARVEST_RECORD.region_id == db.models.FIELD_INFO.field_id)
                              .filter(db.models.FIELD_INFO.field_user == session.get("username"))
                              .filter(db.models.HARVEST_RECORD.grading_code != 99)
                              .filter(db.models.HARVEST_RECORD.storage_code != 99)
                              .all())
    post_harvest_list = [utils.row2dict(info)
                         for info in temp_post_harvest_list]
    return post_harvest_list
