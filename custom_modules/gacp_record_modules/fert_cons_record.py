from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user

FERT_CONS_RECORD = Blueprint('FERT_CONS_RECORD', __name__)

@FERT_CONS_RECORD.route('/api/FERT_CONS_RECORD', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_FERT_CONS_RECORD():
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
            fert_code = int(request.form.get('fert_code'))
            fert_date = request.form.get('fert_date')
            item_no = request.form.get('item_no')
            application_qty = request.form.get('application_qty')
            memo = request.form.get('memo')
            unit = request.form.get('qty_unit')
            reg_user_id = session.get("id")
            zoom = (g.session
                    .query(db.models.units.standard_zoom)
                    .filter(db.models.units.unit_id == unit)
                    .first())
            standard_qty = format(float(application_qty)
                                  * float(zoom.standard_zoom), ".5f")

            """if fert_code == 4:  # add fert
                fert_record = (g.session
                                .query(db.models.FERT_CONS_RECORD)
                                .filter(db.models.FERT_CONS_RECORD.fert_code >= 4)
                                .order_by(db.models.FERT_CONS_RECORD.fert_code.desc())
                                .first())
                if fert_record:
                    fert_code = fert_record.fert_code + 1
                else:
                    pass"""

            g.session.add(db.models.FERT_CONS_RECORD(
                farm_id=farm_id,
                region_id=region_id,
                gacp_no=gacp_no,
                fert_code=fert_code,
                fert_date=fert_date,
                purchase_id=item_no,
                application_qty=application_qty,
                unit=unit,
                standard_qty=standard_qty,
                memo=memo,
                reg_user_id=reg_user_id
            ))
            g.session.commit()
            gacp_form_log(gacp_no, farm_id, region_id,
                          "FERT_CONS_RECORD", "create")
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
        fert_code = request.form.get('fert_code')
        fert_date = request.form.get('fert_date')
        item_no = request.form.get('item_no')
        application_qty = request.form.get('application_qty').replace(",", "")
        memo = request.form.get('memo')
        reg_user_id = session.get("id")
        unit = request.form.get('qty_unit')
        fert_id = request.form.get('record_id')
        zoom = (g.session
                .query(db.models.units.standard_zoom)
                .filter(db.models.units.unit_id == unit)
                .first())
        standard_qty = format(float(application_qty) *
                              float(zoom.standard_zoom), ".5f")

        if not check_is_field_user(gacp_no):
            abort(401)
        max_old_counter = (g.session
                            .query(db.models.FERT_CONS_RECORD)
                            .filter(db.models.FERT_CONS_RECORD.gacp_no == gacp_no)
                            .filter(db.models.FERT_CONS_RECORD.fert_id == fert_id)
                            .order_by(db.models.FERT_CONS_RECORD.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
         .query(db.models.FERT_CONS_RECORD)
         .filter(db.models.FERT_CONS_RECORD.gacp_no == gacp_no)
         .filter(db.models.FERT_CONS_RECORD.fert_id == fert_id)
         .filter(db.models.FERT_CONS_RECORD.is_old == 0)
         .update({"is_old": max_old_counter.is_old+1}))

        g.session.add(db.models.FERT_CONS_RECORD(
            farm_id=farm_id,
            region_id=region_id,
            gacp_no=gacp_no,
            fert_code=fert_code,
            fert_date=fert_date,
            purchase_id=item_no,
            application_qty=application_qty,
            unit=unit,
            standard_qty=standard_qty,
            memo=memo,
            reg_user_id=reg_user_id
        ))
        g.session.commit()
        gacp_form_log(gacp_no, farm_id, region_id,
                      "FERT_CONS_RECORD", "update")
        return 'ok'
    abort(405)