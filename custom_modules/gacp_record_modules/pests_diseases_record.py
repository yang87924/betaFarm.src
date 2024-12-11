from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user

PESTS_DISEASES_RECORD = Blueprint('PESTS_DISEASES_RECORD', __name__)

@PESTS_DISEASES_RECORD.route('/api/PESTS_DISEASES_RECORD', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_PESTS_DISEASES_RECORD():
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
            fert_date = request.form.get('fert_date')
            control_obj_code = request.form.get('control_obj_code')
            item_no = request.form.get('item_no')
            application_qty = request.form.get('application_qty')
            dilution_ratio = request.form.get('dilution_ratio')
            preve_method = request.form.get('preve_method')
            unit = request.form.get('qty_unit')
            reg_user_id = session.get("id")
            zoom = (g.session
                    .query(db.models.units.standard_zoom)
                    .filter(db.models.units.unit_id == unit)
                    .first())
            standard_qty = format(float(application_qty)
                                  * float(zoom.standard_zoom), ".5f")

            g.session.add(db.models.PESTS_DISEASES_RECORD(
                farm_id=farm_id,
                region_id=region_id,
                gacp_no=gacp_no,
                fert_date=fert_date,
                control_obj_code=control_obj_code,
                purchase_id=item_no,
                application_qty=application_qty,
                dilution_ratio=dilution_ratio,
                preve_method=preve_method,
                unit=unit,
                standard_qty=standard_qty,
                reg_user_id=session.get("id")))
            g.session.commit()
            gacp_form_log(gacp_no, farm_id, region_id,
                          "PESTS_DISEASES_RECORD", "create")
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
        fert_date = request.form.get('fert_date')
        control_obj_code = request.form.get('control_obj_code')
        item_no = request.form.get('item_no')
        application_qty = request.form.get('application_qty').replace(",", "")
        dilution_ratio = request.form.get('dilution_ratio').replace(",", "")
        preve_method = request.form.get('preve_method')
        pd_no = request.form.get('pd_no')
        unit = request.form.get('qty_unit')
        zoom = (g.session
                .query(db.models.units.standard_zoom)
                .filter(db.models.units.unit_id == unit)
                .first())
        standard_qty = format(float(application_qty) *
                              float(zoom.standard_zoom), ".5f")

        if not check_is_field_user(gacp_no):
            abort(401)
        max_old_counter = (g.session
                            .query(db.models.PESTS_DISEASES_RECORD)
                            .filter(db.models.PESTS_DISEASES_RECORD.gacp_no == gacp_no)
                            .filter(db.models.PESTS_DISEASES_RECORD.pd_no == pd_no)
                            .order_by(db.models.PESTS_DISEASES_RECORD.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
         .query(db.models.PESTS_DISEASES_RECORD)
         .filter(db.models.PESTS_DISEASES_RECORD.gacp_no == gacp_no)
         .filter(db.models.PESTS_DISEASES_RECORD.pd_no == pd_no)
         .filter(db.models.PESTS_DISEASES_RECORD.is_old == 0)
         .update({"is_old": max_old_counter.is_old+1}))
        g.session.add(db.models.PESTS_DISEASES_RECORD(
            farm_id=farm_id,
            region_id=region_id,
            gacp_no=gacp_no,
            fert_date=fert_date,
            control_obj_code=control_obj_code,
            purchase_id=item_no,
            application_qty=application_qty,
            dilution_ratio=dilution_ratio,
            preve_method=preve_method,
            reg_user_id=session.get("id"),
            unit=unit,
            standard_qty=standard_qty))
        g.session.commit()
        gacp_form_log(gacp_no, farm_id, region_id,
                      "PESTS_DISEASES_RECORD", "update")
        return 'ok'
    abort(405)