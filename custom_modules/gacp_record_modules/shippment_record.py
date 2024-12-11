from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user

SHIPPMENT_RECORD = Blueprint('SHIPPMENT_RECORD', __name__)

@SHIPPMENT_RECORD.route('/api/SHIPPMENT_RECORD', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_SHIPPMENT_RECORD():
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
            sales_date = request.form.get('sales_date')
            harvest_no = request.form.get('harvest_no')
            sales_sup_id = request.form.get('sales_sup_id')
            shipment_qty = request.form.get('shipment_qty').replace(",", "")
            package_qty = request.form.get('package_qty').replace(",", "")
            sales_amount = request.form.get('sales_amount').replace(",", "") or None
            stamp_flow_no = request.form.get('stamp_flow_no')
            item_grading = request.form.get('item_grading')
            memo = request.form.get('memo')
            shipment_qty_unit = request.form.get('shipment_qty_unit')
            package_qty_unit = request.form.get('package_qty_unit')

            shipment_qty_zoom = (g.session
                                 .query(db.models.units.standard_zoom)
                                 .filter(db.models.units.unit_id == shipment_qty_unit)
                                 .first())
            package_qty_zoom = (g.session
                                .query(db.models.units.standard_zoom)
                                .filter(db.models.units.unit_id == package_qty_unit)
                                .first())
            shipment_qty_standard = format(
                float(shipment_qty) * float(shipment_qty_zoom.standard_zoom), ".5f")
            package_qty_standard = format(
                float(package_qty) * float(package_qty_zoom.standard_zoom), ".5f")

            g.session.add(db.models.SHIPPMENT_RECORD(
                farm_id=farm_id,
                region_id=region_id,
                gacp_no=gacp_no,
                sales_date=sales_date,
                harvest_no=harvest_no.replace("/", "-"),
                sales_sup_id=sales_sup_id,
                shipment_qty=shipment_qty,
                package_qty=package_qty,
                sales_amount=sales_amount,
                stamp_flow_no=stamp_flow_no,
                item_grading=item_grading,
                memo=memo,
                shipment_qty_unit=shipment_qty_unit,
                package_qty_unit=package_qty_unit,
                shipment_qty_standard=shipment_qty_standard,
                package_qty_standard=package_qty_standard,
                reg_user_id=session.get("id")))
            g.session.commit()
            gacp_form_log(gacp_no, farm_id, region_id,
                          "SHIPPMENT_RECORD", "create")
        except:
            return redirect(url_for('gacp', somethingbad=1))
        else:
            return redirect(url_for("gacp", is_organic=session.get("is_organic")))

    elif request.method == "PUT":
        if session.get("is_superuser") not in [0, 1]:
            abort(401)

        gacp_no = request.form.get('gacp_no')
        farm_id = int(gacp_no.split("f")[0])
        region_id = int(gacp_no.split("f")[1].split("t")[0])
        sales_date = request.form.get('sales_date')
        harvest_no = request.form.get('harvest_no')
        sales_sup_id = request.form.get('sales_sup_id')
        shipment_qty = request.form.get('shipment_qty')
        package_qty = request.form.get('package_qty')
        sales_amount = request.form.get('sales_amount') or None
        stamp_flow_no = request.form.get('stamp_flow_no')
        item_grading = request.form.get('item_grading')
        shipment_qty_unit = request.form.get('shipment_qty_unit')
        package_qty_unit = request.form.get('package_qty_unit')
        memo = request.form.get('memo')
        sr_no = request.form.get('sr_no')

        shipment_qty_zoom = (g.session
                             .query(db.models.units.standard_zoom)
                             .filter(db.models.units.unit_id == shipment_qty_unit)
                             .first())
        package_qty_zoom = (g.session
                            .query(db.models.units.standard_zoom)
                            .filter(db.models.units.unit_id == package_qty_unit)
                            .first())
        shipment_qty_standard = format(
            float(shipment_qty) * float(shipment_qty_zoom.standard_zoom), ".5f")
        package_qty_standard = format(
            float(package_qty) * float(package_qty_zoom.standard_zoom), ".5f")

        if not check_is_field_user(gacp_no):
            abort(401)
        max_old_counter = (g.session
                            .query(db.models.SHIPPMENT_RECORD)
                            .filter(db.models.SHIPPMENT_RECORD.gacp_no == gacp_no)
                            .filter(db.models.SHIPPMENT_RECORD.sr_no == sr_no)
                            .order_by(db.models.SHIPPMENT_RECORD.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
          .query(db.models.SHIPPMENT_RECORD)
          .filter(db.models.SHIPPMENT_RECORD.gacp_no == gacp_no)
          .filter(db.models.SHIPPMENT_RECORD.sr_no == sr_no)
          .filter(db.models.SHIPPMENT_RECORD.is_old == 0)
          .update({"is_old": max_old_counter.is_old+1}))

        g.session.add(db.models.SHIPPMENT_RECORD(
            farm_id=farm_id,
            region_id=region_id,
            gacp_no=gacp_no,
            sales_date=sales_date,
            harvest_no=harvest_no.replace("/", "-"),
            sales_sup_id=sales_sup_id,
            shipment_qty=shipment_qty,
            package_qty=package_qty,
            sales_amount=sales_amount,
            stamp_flow_no=stamp_flow_no,
            item_grading=item_grading,
            memo=memo,
            shipment_qty_unit=shipment_qty_unit,
            package_qty_unit=package_qty_unit,
            shipment_qty_standard=shipment_qty_standard,
            package_qty_standard=package_qty_standard,
            reg_user_id=session.get("id")))
        g.session.commit()
        gacp_form_log(gacp_no, farm_id, region_id,
                      "SHIPPMENT_RECORD", "update")
        return "ok"
    abort(405)