from flask import Blueprint, g, request, abort, jsonify, redirect
from custom_modules.main_modules import db, utils
from custom_modules.main_modules.custom_render_templates import flask_render_template
from datetime import date
import os
import config

main_trace = Blueprint('main_trace', __name__)

@main_trace.route('/trace', methods=['GET'])
def trace_system():
    gacp_no = request.args.get("no")
    gacp_query = (g.session
                  .query(db.models.GACP_LIST_LOG)
                  .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
                  .first())

    if gacp_query is None:
        abort(404)

    farm_id = gacp_no.split("f", 1)[0]
    field_id = gacp_no.split("f", 1)[1].split("t", 1)[0]

    product_image = gacp_query.image_addr
    purchase_link_name = gacp_query.purchase_link_name
    purchase_link = gacp_query.purchase_link
    SEED_REGIS_FORM = (g.session
                        .query(db.models.SEED_REGIS_FORM)
                        .filter(db.models.SEED_REGIS_FORM.gacp_no == gacp_no)
                        .filter(db.models.SEED_REGIS_FORM.is_old == 0)
                        .order_by(db.models.SEED_REGIS_FORM.seed_qty.desc())
                        .first())
    if SEED_REGIS_FORM is not None:
        CULTIVAR_LIST = (g.session
                          .query(db.models.CULTIVAR_LIST)
                          .filter(db.models.CULTIVAR_LIST.cultivar_code == SEED_REGIS_FORM.cultivar_code)
                          .first())
        seedling = (g.session
                     .query(db.models.ITEMS.item_name, db.models.CULTIVAR_LIST.cultivar_name)
                     .filter(db.models.SEED_REGIS_FORM.gacp_no == gacp_no)
                     .filter(db.models.SEED_REGIS_FORM.is_old == 0)
                     .filter(db.models.SEED_REGIS_FORM.item_no == db.models.ITEMS.item_no)
                     .filter(db.models.SEED_REGIS_FORM.cultivar_code == db.models.CULTIVAR_LIST.cultivar_code)
                     .group_by(db.models.ITEMS.item_name)
                     .order_by(db.models.CULTIVAR_LIST.cultivar_name.asc(), db.models.ITEMS.item_name.asc())
                     .all())
        sups = (g.session
                .query(db.models.SUPPLIER)
                .filter(db.models.SUPPLIER.sup_id == SEED_REGIS_FORM.sup_id)
                .group_by(db.models.SUPPLIER.sup_name)
                .all())
        crop_name = CULTIVAR_LIST.cultivar_name
        seedling_name = [{"name": name, "cultivar": cultivar}
                         for name, cultivar in seedling]
        sup_name = [sup.sup_name for sup in sups]
    else:
        crop_name = ""
        seedling = []
        seedling_name = ""
        sup_name = ""

    FARM_INFO = (g.session
                  .query(db.models.FARM_INFO)
                  .filter(db.models.FARM_INFO.farm_id == farm_id)
                  .first())

    FIELD_INFO = (g.session.query(db.models.FIELD_INFO)
                  .filter(db.models.FIELD_INFO.farm_id == farm_id)
                  .filter(db.models.FIELD_INFO.field_id == field_id)
                  .first())

    INSPECTION_INFO = (g.session
                        .query(db.models.OTHER_INSPECTION_INFO)
                        .filter(db.models.OTHER_INSPECTION_INFO.gacp_no == gacp_no)
                        .filter(db.models.OTHER_INSPECTION_INFO.is_old == 0)
                        .order_by(db.models.OTHER_INSPECTION_INFO.up_date)
                        .all())

    reports = [utils.row2dict(report) for report in INSPECTION_INFO]

    CULT_WORK_RECORD = (g.session
                        .query(db.models.CULT_WORK_RECORD)
                        .filter(db.models.CULT_WORK_RECORD.gacp_no == gacp_no)
                        .filter(db.models.CULT_WORK_RECORD.is_old == 0)
                        .order_by(db.models.CULT_WORK_RECORD.word_date)
                        .all())
    works_record = [utils.row2dict(work) for work in CULT_WORK_RECORD]
    for record in works_record:
        ri_r = record["record_item"] % 10
        if ri_r != 0:
            ri_dad = (g.session
                      .query(db.models.CULT_WORK_LIST)
                      .filter(db.models.CULT_WORK_LIST.cult_work_code == record["record_item"]-ri_r)
                      .first()).cult_work_tw_name
            ri = (g.session
                  .query(db.models.CULT_WORK_LIST)
                  .filter(db.models.CULT_WORK_LIST.cult_work_code == record["record_item"])
                  .first()).cult_work_tw_name

            record["record_item"] = ri_dad+"("+ri+")"
        else:
            record["record_item"] = (g.session
                                     .query(db.models.CULT_WORK_LIST)
                                     .filter(db.models.CULT_WORK_LIST.cult_work_code == record["record_item"])
                                     .first()).cult_work_tw_name

    PESTS_DISEASES_RECORD = (g.session
                              .query(db.models.PESTS_DISEASES_RECORD)
                              .filter(db.models.PESTS_DISEASES_RECORD.gacp_no == gacp_no)
                              .filter(db.models.PESTS_DISEASES_RECORD.is_old == 0)
                              .all())

    pest_records = [utils.row2dict(record) for record in PESTS_DISEASES_RECORD]
    for record in pest_records:
        record["control_obj_code"] = (g.session
                                      .query(db.models.CONTROL_OBJ_LIST)
                                      .filter(db.models.CONTROL_OBJ_LIST.control_obj_code == record["control_obj_code"])
                                      .first()).control_obj_name

        p_record = g.session.query(db.models.PREVE_PURCH_RECORD).filter(
            db.models.PREVE_PURCH_RECORD.record_id == record["purchase_id"]).first()

        record["item_no"] = (g.session
                             .query(db.models.ITEMS)
                             .filter(db.models.ITEMS.item_no == p_record.material_code)
                             .first()).item_name

    CONTROL_OBJ_LIST = (g.session
                         .query(db.models.CONTROL_OBJ_LIST)
                         .all())
    ITEMS = (g.session
              .query(db.models.ITEMS)
              .all())

    control_obj_name = {}
    item_name = {}
    for obj in CONTROL_OBJ_LIST:
        control_obj_name[obj.control_obj_code] = obj.control_obj_name
    for item in ITEMS:
        item_name[item.item_no] = item.item_name

    GRADING_CODE_LIST = (g.session
                          .query(db.models.GRADING_CODE_LIST)
                          .all())
    STORAGE_CODE_LIST = (g.session
                          .query(db.models.STORAGE_CODE_LIST)
                          .all())
    grading_name = {}
    storage_name = {}

    for row in GRADING_CODE_LIST:
        grading_name[row.grading_code] = row.grading_code_name

    for row in STORAGE_CODE_LIST:
        storage_name[row.storage_code] = row.storage_code_name

    POST_HARVEST_RECORD = (g.session
                            .query(db.models.HARVEST_RECORD, db.models.GRADING_CODE_LIST, db.models.STORAGE_CODE_LIST)
                            .filter(db.models.HARVEST_RECORD.gacp_no == gacp_no)
                            .filter(db.models.HARVEST_RECORD.is_old == 0)
                            .filter(db.models.HARVEST_RECORD.grading_code == db.models.GRADING_CODE_LIST.grading_code)
                            .filter(db.models.HARVEST_RECORD.storage_code == db.models.STORAGE_CODE_LIST.storage_code)
                           # 99 is all of produce
                            .filter(db.models.HARVEST_RECORD.grading_code == 99)
                            .filter(db.models.HARVEST_RECORD.storage_code == 99)
                            .order_by(db.models.HARVEST_RECORD.word_date.desc())
                            .all())

    data = {}
    processed = []
    all_counter = 0
    for row, grade, storage in POST_HARVEST_RECORD:

        try:
            if data[grade.grading_code_name+"_"+storage.storage_code_name]:
                data[grade.grading_code_name+"_"+storage.storage_code_name] = (
                    data[grade.grading_code_name+"_"+storage.storage_code_name] + row.standard_qty)
        except:
            data[grade.grading_code_name+"_" +
                 storage.storage_code_name] = row.standard_qty
        all_counter = format(row.standard_qty, ',.10f').rstrip('0').rstrip('.')

    for k, v in data.items():
        key_pair = k.split("_")
        processed.append(
            {"key1": key_pair[0], "key2": key_pair[1], "value": v})

    work_records_with_name = (g.session
                               .query(db.models.CULT_WORK_RECORD, db.models.CULT_WORK_LIST)
                               .filter(db.models.CULT_WORK_RECORD.gacp_no == gacp_no)
                               .filter(db.models.CULT_WORK_RECORD.record_item == db.models.CULT_WORK_LIST.cult_work_code)
                               .filter(db.models.CULT_WORK_RECORD.is_old == 0)
                               .order_by(db.models.CULT_WORK_RECORD.word_date)
                               .all())
    work_images = []
    record_index = 0
    for row, clist in work_records_with_name:
        work_image_dict = {}
        work_image_dict["name"] = clist.cult_work_tw_name
        work_image_dict["index"] = record_index
        work_image_dict["addr"] = row.image_addr
        work_images.append(work_image_dict)
        record_index += 1

    sensors_query = (g.session
                      .query(db.models.field_sensor)
                      .filter(db.models.field_sensor.field == field_id)
                      .all())
    sensors = []
    for row in sensors_query:
        sensors.append(
            {
                "df_name": row.df_name,
                "alias": row.alias
            }
        )

    certificate_query = (g.session
                          .query(db.models.CERTIFICATE_MRAK, db.models.CERTIFICATE_LIST)
                          .filter(db.models.CERTIFICATE_MRAK.farm_id == farm_id)
                          .filter(db.models.CERTIFICATE_MRAK.field_id == field_id)
                          .filter(db.models.CERTIFICATE_MRAK.certificate_list_id == db.models.CERTIFICATE_LIST.certificate_list_id)
                          .filter(db.models.CERTIFICATE_MRAK.effective_date >= date.today())
                          .filter(db.models.CERTIFICATE_MRAK.is_old == 0)
                          .all())

    certificate = []
    for row, li in certificate_query:
        certificate.append(
            {
                "image_addr": row.image_addr,
                "mark_name": li.mark_name,
                "abbreviation": li.abbreviation,
                "mark_image_addr": li.mark_image_addr
            }
        )

    have_ipcam = False
    ipcam_db = db.models.ipcam_img
    ipcam_query = g.session.query(ipcam_db).filter(
        ipcam_db.name == gacp_query.ipcam_name).first()
    if ipcam_query is not None:
        have_ipcam = True

    markets = []
    market_list = db.models.market_list
    markets = [market[0]
               for market in g.session.query(market_list.market_name).all()]

    video_path = './static/photo/ipcam_image/ipcam_time_lapse/'+gacp_no+'.webm'

    if os.path.isfile(video_path):
        video_flag = True
    else:
        video_flag = False

    return flask_render_template('trace.html',
                                 product=product_image,
                                 crop_name=crop_name,
                                 farm_name=FARM_INFO.farm_name,
                                 farm_addr=FARM_INFO.farm_addr,
                                 farm_area=format(FIELD_INFO.standard_area, ',.10f').rstrip('0').rstrip('.'),
                                 seedling_name=seedling_name,
                                 sup_name=sup_name,
                                 reports=reports,
                                 works_record=works_record,
                                 pest_records=pest_records,
                                 processed=processed,
                                 processed_all=all_counter,
                                 work_images=work_images,
                                 purchase_link_name=purchase_link_name,
                                 purchase_link=purchase_link,
                                 sensors=sensors,
                                 certificate=certificate,
                                 cwb_no=gacp_query.cwb_no,
                                 have_ipcam=have_ipcam,
                                 markets=markets,
                                 video_flag=video_flag,
                                 is_taiwan=config.TAIWAN_MODE
                                 )
