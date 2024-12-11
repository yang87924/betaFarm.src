from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user
from custom_modules.gacp_record_modules.allowed_file import allowed_file
import uuid

OTHER_PURCH_RECORD = Blueprint('OTHER_PURCH_RECORD', __name__)

@OTHER_PURCH_RECORD.route('/api/OTHER_PURCH_RECORD', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_OTHER_PURCH_RECORD():
    user_id = session.get('id')
    if not user_id:
        abort(404)

    if request.method == 'POST':

        farm_active = (g.session
                        .query(db.models.FIELD_INFO.farm_id)
                        .filter(db.models.FIELD_INFO.field_user == session.get('username'))
                        .group_by(db.models.FIELD_INFO.farm_id)
                       )
        farm_id = ''
        if farm_active:
            for id in farm_active:
                farm_id += str(id[0])

        try:
            farm_id = farm_id
            region_id = request.form.get('region_id')
            purch_date = request.form.get('purch_date')
            material_code = request.form.get('material_code')
            lot_number = request.form.get('lot_number')
            label = g.session.query(db.models.ITEMS).filter(
                db.models.ITEMS.item_no == material_code).first().label
            price = request.form.get('price')
            qty = request.form.get('qty')
            qty_unit = request.form.get('qty_unit')
            memo = request.form.get('memo')
            up_file = request.files['up_file']
            sup_id = g.session.query(db.models.ITEMS).filter(
                db.models.ITEMS.item_no == material_code).first().sup_id

            if allowed_file(up_file.filename):
                safe_file_name = str(uuid.uuid1())+".jpg"
                up_file_path = './static/photo/PURCHASE_UPLOAD/'+safe_file_name
                up_file.save(up_file_path)

            g.session.add(db.models.OTHER_PURCH_RECORD(
                farm_id=farm_id,
                region_id=region_id,
                purch_date=purch_date,
                material_code=material_code,
                label=label,
                price=price,
                sup_id=sup_id,
                qty=qty,
                subtotal=float(price)*float(qty),
                up_file='../static/photo/PURCHASE_UPLOAD/'+safe_file_name,
                memo=memo,
                lot_number=lot_number,
                qty_unit=qty_unit))
            g.session.commit()

            gacp = g.session.query(db.models.GACP_LIST_LOG).filter(db.models.GACP_LIST_LOG.farm_id == farm_id).filter(
                db.models.GACP_LIST_LOG.region_id == region_id).first()
            gacp_form_log(gacp.gacp_no, farm_id, region_id,
                          "OTHER_PURCH_RECORD", "create")
        except:
            return redirect(url_for('gacp', somethingbad=1))
        else:
            return redirect(url_for("gacp", is_organic=session.get("is_organic")))
    elif request.method == 'PUT':
        if session.get("is_superuser") not in [0, 1]:
            abort(401)
        gacp_no = request.form.get('gacp_no')
        farm_id = int(gacp_no.split("f")[0])
        region_id = int(gacp_no.split("f")[1].split("t")[0])
        record_id = request.form.get('record_id')
        farm_active = (g.session
                        .query(db.models.FIELD_INFO.farm_id)
                        .filter(db.models.FIELD_INFO.field_user == session.get('username'))
                        .group_by(db.models.FIELD_INFO.farm_id)
                       )
        farm_id = ''
        if farm_active:
            for id in farm_active:
                farm_id += str(id[0])
        record = (g.session
                   .query(db.models.OTHER_PURCH_RECORD)
                   .filter(db.models.OTHER_PURCH_RECORD.record_id == record_id)
                   .filter(db.models.OTHER_PURCH_RECORD.is_old == 0)
                   .first())
        region_id = record.region_id
        purch_date = request.form.get('purch_date')
        material_code = request.form.get('material_code')
        other_info = (g.session
                      .query(db.models.ITEMS)
                      .filter(db.models.ITEMS.item_no == material_code)
                      .first())
        label = g.session.query(db.models.ITEMS).filter(
            db.models.ITEMS.item_no == material_code).first().label
        price = request.form.get('price').replace(",", "")
        qty = request.form.get('qty').replace(",", "")
        qty_unit = request.form.get('qty_unit')
        memo = request.form.get('memo')
        sup_id = g.session.query(db.models.ITEMS).filter(
            db.models.ITEMS.item_no == material_code).first().sup_id
        lot_number = request.form.get('lot_number')

        up_file = request.files['up_file']
        if up_file:
            if allowed_file(up_file.filename):
                safe_file_name = str(uuid.uuid1())+".jpg"
                up_file_path = './static/photo/PURCHASE_UPLOAD/'+safe_file_name
                up_file.save(up_file_path)
                up_file_path = '../static/photo/PURCHASE_UPLOAD/'+safe_file_name
        else:
            old_addr = request.form.get('old_pic_addr')
            up_file_path = old_addr

        max_old_counter = (g.session
                            .query(db.models.OTHER_PURCH_RECORD)
                            .filter(db.models.OTHER_PURCH_RECORD.record_id == record_id)
                            .order_by(db.models.OTHER_PURCH_RECORD.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
          .query(db.models.OTHER_PURCH_RECORD)
          .filter(db.models.OTHER_PURCH_RECORD.record_id == record_id)
          .filter(db.models.OTHER_PURCH_RECORD.is_old == 0)
          .update({"is_old": max_old_counter.is_old+1}))

        g.session.add(db.models.OTHER_PURCH_RECORD(
            farm_id=farm_id,
            region_id=region_id,
            purch_date=purch_date,
            material_code=material_code,
            lot_number=lot_number,
            sup_id=sup_id,
            label=label,
            price=price,
            qty=qty,
            qty_unit=qty_unit,
            subtotal=float(price)*float(qty),
            memo=memo,
            up_file=up_file_path))
        g.session.commit()

        gacp = g.session.query(db.models.GACP_LIST_LOG).filter(db.models.GACP_LIST_LOG.farm_id == farm_id).filter(
            db.models.GACP_LIST_LOG.region_id == region_id).first()
        gacp_form_log(gacp.gacp_no, farm_id, region_id,
                      "OTHER_PURCH_RECORD", "update")
        return 'ok'
    abort(405)