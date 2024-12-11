from flask import Blueprint, g, request, abort, jsonify, session
from custom_modules.main_modules import db

trace_search = Blueprint('trace_search', __name__)

@trace_search.route('/api/trace/gacp', methods=['GET'])
def trace_gacp_search():
    gacp_no = request.args.get("no")

    gacp = (g.session
             .query(db.models.GACP_LIST_LOG)
             .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
             .first())

    if gacp is None:
        abort(404)

    farm_id = gacp_no.split("f", 1)[0]
    field_id = gacp_no.split("f", 1)[1].split("t", 1)[0]
    table = request.args.get("table")
    items = []
    if table == "seedling":
        query = (g.session
                  .query(db.models.SEED_REGIS_FORM, db.models.ITEMS, db.models.SUPPLIER, db.models.CULTIVAR_LIST, db.models.units)
                  .filter(db.models.SEED_REGIS_FORM.gacp_no == gacp_no)
                  .filter(db.models.SEED_REGIS_FORM.cultivar_code == db.models.CULTIVAR_LIST.cultivar_code)
                  .filter(db.models.SEED_REGIS_FORM.item_no == db.models.ITEMS.item_no)
                  .filter(db.models.SEED_REGIS_FORM.sup_id == db.models.SUPPLIER.sup_id)
                  .filter(db.models.SEED_REGIS_FORM.is_old == 0)
                  .filter(db.models.units.unit_id == db.models.SEED_REGIS_FORM.seed_qty_unit)
                  .all())
        if query is None:
            abort(404)
        for row, item, sup, cult, unit in query:
            if row.purch_date:
                date = row.purch_date.strftime("%Y/%m/%d")
            else:
                date = None
            items.append(
                {
                    'cultivar_code': cult.cultivar_name,
                    'item_no': item.item_name,
                    'seed_qty': str(format(row.seed_qty, ',.10f').rstrip('0').rstrip('.'))+unit.name,
                    'seed_source': sup.sup_name,
                    'purch_date': date
                }
            )
        return jsonify(items)

    elif table == "cultivate":
        query = (g.session
                  .query(db.models.CULT_WORK_RECORD, db.models.CULT_WORK_LIST)
                  .filter(db.models.CULT_WORK_RECORD.gacp_no == gacp_no)
                  .filter(db.models.CULT_WORK_RECORD.is_old == 0)
                  .filter(db.models.CULT_WORK_RECORD.record_item == db.models.CULT_WORK_LIST.cult_work_code)
                  .all())
        if query is None:
            abort(404)
        for row, list in query:
            if row.record_item % 10 != 0:
                ri_r = row.record_item % 10
                ri_dad = (g.session.query(db.models.CULT_WORK_LIST).filter(
                    db.models.CULT_WORK_LIST.cult_work_code == row.record_item-ri_r).first())
                items.append(
                    {
                        'record_item': ri_dad.cult_work_tw_name+"("+list.cult_work_tw_name+")",
                        'word_date': row.word_date.strftime("%Y/%m/%d"),
                        'memo': row.memo
                    }
                )
            else:
                items.append(
                    {
                        'record_item': list.cult_work_tw_name,
                        'word_date': row.word_date.strftime("%Y/%m/%d"),
                        'memo': row.memo
                    }
                )
        return jsonify(items)
    elif table == "fert":
        query = (g.session
                  .query(db.models.FERT_CONS_RECORD, db.models.FERT_CONS_LIST, db.models.ITEMS, db.models.units)
                  .filter(db.models.FERT_CONS_RECORD.gacp_no == gacp_no)
                  .filter(db.models.FERT_CONS_RECORD.is_old == 0)
                  .filter(db.models.FERT_CONS_RECORD.purchase_id == db.models.FERT_PURCH_RECORD.record_id)
                  .filter(db.models.FERT_PURCH_RECORD.material_code == db.models.ITEMS.item_no)
                  .filter(db.models.FERT_CONS_RECORD.fert_code == db.models.FERT_CONS_LIST.fert_cons_code)
                  .filter(db.models.units.unit_id == 9)  # unit_id 9 is kg
                  .all())
        if query is None:
            abort(404)
        for row, list, item, unit in query:
            items.append(
                {
                    'record_item': list.fert_cons_name,
                    'word_date': row.fert_date.strftime("%Y/%m/%d"),
                    'item_no': item.item_name,
                    'application_qty': format(row.standard_qty, ',.10f').rstrip('0').rstrip('.') + unit.name,
                    'memo': row.memo
                }
            )
        return jsonify(items)
    elif table == "pest":
        query = (g.session
                  .query(db.models.PESTS_DISEASES_RECORD, db.models.ITEMS, db.models.CONTROL_OBJ_LIST, db.models.units)
                  .filter(db.models.PESTS_DISEASES_RECORD.gacp_no == gacp_no)
                  .filter(db.models.PESTS_DISEASES_RECORD.is_old == 0)
                  .filter(db.models.PESTS_DISEASES_RECORD.purchase_id == db.models.PREVE_PURCH_RECORD.record_id)
                  .filter(db.models.PREVE_PURCH_RECORD.material_code == db.models.ITEMS.item_no)
                  .filter(db.models.PESTS_DISEASES_RECORD.control_obj_code == db.models.CONTROL_OBJ_LIST.control_obj_code)
                  .filter(db.models.units.unit_id == 9)  # unit_id 9 is kg
                  .all())
        if query is None:
            abort(404)
        for row, item, list, unit in query:
            items.append(
                {
                    'record_item': list.control_obj_name,
                    'word_date': row.fert_date.strftime("%Y/%m/%d"),
                    'item_no': item.item_name,
                    'application_qty': format(row.standard_qty, ',.10f').rstrip('0').rstrip('.') + unit.name,
                    'dilution_ratio': format(row.dilution_ratio, ',.10f').rstrip('0').rstrip('.'),
                    'preve_method': row.preve_method
                }
            )
        return jsonify(items)
    elif table == "harvest":
        query = (g.session
                  .query(db.models.HARVEST_RECORD, db.models.units, db.models.STORAGE_CODE_LIST, db.models.GRADING_CODE_LIST)
                  .filter(db.models.HARVEST_RECORD.gacp_no == gacp_no)
                  .filter(db.models.HARVEST_RECORD.is_old == 0)
                  .filter(db.models.HARVEST_RECORD.grading_code != 99)
                  .filter(db.models.HARVEST_RECORD.storage_code != 99)
                  .filter(db.models.units.unit_id == 9)  # unit_id 9 is kg
                  .filter(db.models.HARVEST_RECORD.grading_code == db.models.GRADING_CODE_LIST.grading_code)
                  .filter(db.models.HARVEST_RECORD.storage_code == db.models.STORAGE_CODE_LIST.storage_code)
                  .all())
        if query is None:
            abort(404)
        for row, unit, storage, grading in query:
            items.append(
                {
                    'word_date': row.word_date.strftime("%Y/%m/%d"),
                    'harvest_qty': format(row.standard_qty, ',.10f').rstrip('0').rstrip('.') + unit.name,
                    'grading_code': grading.grading_code_name,
                    'storage_code': storage.storage_code_name,
                    'word_memo': row.word_memo,
                    'memo': row.memo
                }
            )
        return jsonify(items)
    elif table == "fert_purchase":
        query = (g.session
                  .query(db.models.FERT_PURCH_RECORD, db.models.ITEMS, db.models.units)
                  .filter(db.models.FERT_PURCH_RECORD.farm_id == farm_id)
                  .filter(db.models.FERT_PURCH_RECORD.region_id == field_id)
                  .filter(db.models.FERT_PURCH_RECORD.is_old == 0)
                  .filter(db.models.FERT_PURCH_RECORD.material_code == db.models.ITEMS.item_no)
                  .filter(db.models.FERT_PURCH_RECORD.qty_unit == db.models.units.unit_id)
                  .all())
        if query is None:
            abort(404)
        for row, item, unit in query:
            items.append(
                {
                    'purch_date': row.purch_date.strftime("%Y/%m/%d"),
                    'material_code': item.item_name,
                    'label': row.label,
                    'price': format(row.price, ',.10f').rstrip('0').rstrip('.'),
                    'qty': str(format(row.qty, ',.10f').rstrip('0').rstrip('.'))+unit.name,
                    'subtotal': format(row.subtotal, ',.10f').rstrip('0').rstrip('.'),
                    'memo': row.memo,
                    'up_file': "<a href='"+row.up_file+"' target='_blank' rel= 'noopener noreferrer'><img src='"+row.up_file+"' style='max-height:100px;'></img></a>"
                }
            )
        return jsonify(items)
    elif table == "prevention_purchase":
        query = (g.session
                  .query(db.models.PREVE_PURCH_RECORD, db.models.ITEMS, db.models.units)
                  .filter(db.models.PREVE_PURCH_RECORD.farm_id == farm_id)
                  .filter(db.models.PREVE_PURCH_RECORD.region_id == field_id)
                  .filter(db.models.PREVE_PURCH_RECORD.is_old == 0)
                  .filter(db.models.PREVE_PURCH_RECORD.material_code == db.models.ITEMS.item_no)
                  .filter(db.models.PREVE_PURCH_RECORD.qty_unit == db.models.units.unit_id)
                  .all())
        if query is None:
            abort(404)
        for row, item, unit in query:
            items.append(
                {
                    'purch_date': row.purch_date.strftime("%Y/%m/%d"),
                    'material_code': item.item_name,
                    'label': row.label,
                    'price': format(row.price, ',.10f').rstrip('0').rstrip('.'),
                    'qty': str(format(row.qty, ',.10f').rstrip('0').rstrip('.'))+unit.name,
                    'subtotal': format(row.subtotal, ',.10f').rstrip('0').rstrip('.'),
                    'memo': row.memo,
                    'up_file': "<a href='"+row.up_file+"' target='_blank' rel= 'noopener noreferrer'><img src='"+row.up_file+"' style='max-height:100px;'></img></a>"
                }
            )
        return jsonify(items)
    elif table == "other_purchase":
        query = (g.session
                  .query(db.models.OTHER_PURCH_RECORD, db.models.ITEMS, db.models.units)
                  .filter(db.models.OTHER_PURCH_RECORD.farm_id == farm_id)
                  .filter(db.models.OTHER_PURCH_RECORD.region_id == field_id)
                  .filter(db.models.OTHER_PURCH_RECORD.is_old == 0)
                  .filter(db.models.OTHER_PURCH_RECORD.material_code == db.models.ITEMS.item_no)
                  .filter(db.models.PREVE_PURCH_RECORD.qty_unit == db.models.units.unit_id)
                  .all())
        if query is None:
            abort(404)
        for row, item, unit in query:
            items.append(
                {
                    'purch_date': row.purch_date.strftime("%Y/%m/%d"),
                    'material_code': item.item_name,
                    'label': row.label,
                    'price': format(row.price, ',.10f').rstrip('0').rstrip('.'),
                    'qty': str(format(row.qty, ',.10f').rstrip('0').rstrip('.'))+unit.name,
                    'subtotal': format(row.subtotal, ',.10f').rstrip('0').rstrip('.'),
                    'memo': row.memo,
                    'up_file': "<a href='"+row.up_file+"' target='_blank' rel= 'noopener noreferrer'><img src='"+row.up_file+"' style='max-height:100px;'></img></a>"
                }
            )
        return jsonify(items)
    elif table == "analysis":
        query = (g.session
                  .query(db.models.OTHER_INSPECTION_INFO)
                  .filter(db.models.OTHER_INSPECTION_INFO.gacp_no == gacp_no)
                  .filter(db.models.OTHER_INSPECTION_INFO.is_old == 0)
                  .all())

        if query is None:
            abort(404)
        for row in query:
            items.append(
                {
                    'up_date': row.up_date.strftime("%Y/%m/%d"),
                    'up_file': "<a href='"+row.up_file+"' target='_blank' rel= 'noopener noreferrer'><img src='"+row.up_file+"' style='max-height:100px;'></img></a>",
                    'memo': row.memo
                }
            )
        return jsonify(items)
    elif table == "other":
        query = (g.session
                  .query(db.models.OTHER_NOTES)
                  .filter(db.models.OTHER_NOTES.gacp_no == gacp_no)
                  .filter(db.models.OTHER_NOTES.is_old == 0)
                  .all())
        if query is None:
            abort(404)
        for row in query:
            items.append(
                {
                    'other_date': row.other_date.strftime("%Y/%m/%d"),
                    'memo': row.memo
                }
            )
        return jsonify(items)
    elif table == "sale":
        query = (g.session
                  .query(db.models.SHIPPMENT_RECORD, db.models.SALES_INFO, db.models.GRADING_CODE_LIST, db.models.units)
                  .filter(db.models.SHIPPMENT_RECORD.gacp_no == gacp_no)
                  .filter(db.models.SHIPPMENT_RECORD.sales_sup_id == db.models.SALES_INFO.sales_sup_id)
                  .filter(db.models.SHIPPMENT_RECORD.item_grading == db.models.GRADING_CODE_LIST.grading_code)
                  .filter(db.models.SHIPPMENT_RECORD.is_old == 0)
                  .filter(db.models.units.unit_id == 9)  # unit_id 9 is kg
                  .all())
        if query is None:
            abort(404)
        for row, info, grade, unit in query:
            items.append(
                {
                    'harvest_no': row.harvest_no,
                    'sales_date': row.sales_date.strftime("%Y/%m/%d"),
                    'sales_sup_id': info.name,
                    'shipment_qty': format(row.shipment_qty, ',.10f').rstrip('0').rstrip('.'),
                    'package_qty': format(row.package_qty, ',.10f').rstrip('0').rstrip('.') + unit.name,
                    'item_grading': grade.grading_code_name,
                    'memo': row.memo
                }
            )
        return jsonify(items)
    else:
        abort(404)
    abort(405)