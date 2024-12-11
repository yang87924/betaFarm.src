from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user

HARVEST_RECORD = Blueprint('HARVEST_RECORD', __name__)

@HARVEST_RECORD.route('/api/HARVEST_RECORD', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_HARVEST_RECORD():
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

        gacp_no = (g.session
                    .query(db.models.GACP_LIST_LOG)
                    .filter(db.models.GACP_LIST_LOG.farm_id == farm_id)
                    .filter(db.models.GACP_LIST_LOG.region_id == request.form.get('region_id'))
                    .filter(db.models.GACP_LIST_LOG.status == 1)
                    .first())

        try:
            farm_id = farm_id
            region_id = request.form.get('region_id')
            gacp_no = gacp_no.gacp_no
            word_date = request.form.get('word_date')
            harvest_qty = request.form.get('harvest_qty')
            word_memo = request.form.get('word_memo')
            memo = request.form.get('memo')
            grading_code = request.form.get('grading_code')
            storage_code = request.form.get('storage_code')
            unit = request.form.get('qty_unit')
            zoom = (g.session
                    .query(db.models.units.standard_zoom)
                    .filter(db.models.units.unit_id == unit)
                    .first())
            standard_qty = format(float(harvest_qty) *
                                  float(zoom.standard_zoom), ".5f")

            if (grading_code == '99') | (storage_code == '99'):
                if (grading_code == '99') & (storage_code == '99'):
                    old_record = (g.session.query(db.models.HARVEST_RECORD)
                                  .filter(db.models.HARVEST_RECORD.gacp_no == gacp_no)
                                  .filter(db.models.HARVEST_RECORD.grading_code == 99)
                                  .filter(db.models.HARVEST_RECORD.storage_code == 99)
                                  .first())
                    if old_record:
                        return redirect(url_for('gacp', somethingbad=992))
                else:
                    return redirect(url_for('gacp', somethingbad=991))
            g.session.add(db.models.HARVEST_RECORD(
                farm_id=farm_id,
                region_id=region_id,
                gacp_no=gacp_no,
                word_date=word_date,
                harvest_qty=harvest_qty,
                word_memo=word_memo,
                memo=memo,
                unit=unit,
                standard_qty=standard_qty,
                grading_code=grading_code,
                storage_code=storage_code,
                reg_user_id=session.get("id")))
            g.session.commit()
            gacp_form_log(gacp_no, farm_id, region_id,
                          "HARVEST_RECORD", "create")
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
        word_date = request.form.get('word_date')
        harvest_qty = request.form.get('harvest_qty').replace(",", "")
        word_memo = request.form.get('word_memo')
        memo = request.form.get('memo')
        record_id = request.form.get('record_id')
        grading_code = request.form.get('grading_code')
        storage_code = request.form.get('storage_code')
        unit = request.form.get('qty_unit')
        zoom = (g.session
                .query(db.models.units.standard_zoom)
                .filter(db.models.units.unit_id == unit)
                .first())
        standard_qty = format(float(harvest_qty) *
                              float(zoom.standard_zoom), ".5f")

        if not check_is_field_user(gacp_no):
            abort(401)
        max_old_counter = (g.session
                            .query(db.models.HARVEST_RECORD)
                            .filter(db.models.HARVEST_RECORD.gacp_no == gacp_no)
                            .filter(db.models.HARVEST_RECORD.record_id == record_id)
                            .order_by(db.models.HARVEST_RECORD.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
         .query(db.models.HARVEST_RECORD)
         .filter(db.models.HARVEST_RECORD.gacp_no == gacp_no)
         .filter(db.models.HARVEST_RECORD.record_id == record_id)
         .filter(db.models.HARVEST_RECORD.is_old == 0)
         .update({"is_old": max_old_counter.is_old+1}))

        g.session.add(db.models.HARVEST_RECORD(
            farm_id=farm_id,
            region_id=region_id,
            gacp_no=gacp_no,
            word_date=word_date,
            harvest_qty=harvest_qty,
            word_memo=word_memo,
            memo=memo,
            unit=unit,
            standard_qty=standard_qty,
            grading_code=grading_code,
            storage_code=storage_code,
            reg_user_id=session.get("id")))
        g.session.commit()
        gacp_form_log(gacp_no, farm_id, region_id, "HARVEST_RECORD", "update")
        return 'ok'
    abort(405)