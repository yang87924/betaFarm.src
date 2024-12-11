from flask import Blueprint, abort, g, session, request, jsonify, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user

SEED_REGIS_FORM = Blueprint('SEED_REGIS_FORM', __name__)

@SEED_REGIS_FORM.route('/api/SEED_REGIS_FORM', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_SEED_REGIS_FORM():
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
            item_no = request.form.get('item_no')
            cultivar_code = g.session.query(db.models.ITEMS).filter(
                db.models.ITEMS.item_no == item_no).first().cultivar_id
            seed_qty = request.form.get('seed_qty')
            seed_qty_unit = request.form.get('seed_qty_unit')
            purch_date = request.form.get('purch_date') or None
            self_reserved = request.form.get('self_reserved')
            sup_id = request.form.get('sup_id') or None

            if self_reserved == "0":
                if (purch_date is None) | (sup_id is None):
                    abort(406)
            elif self_reserved == "1":
                purch_date = None
                sup_id = 0

            g.session.add(db.models.SEED_REGIS_FORM(
                farm_id=farm_id,
                region_id=region_id,
                gacp_no=gacp_no,
                item_no=item_no,
                cultivar_code=cultivar_code,
                seed_qty=seed_qty,
                seed_qty_unit=seed_qty_unit,
                purch_date=purch_date,
                reg_user_id=session.get("id"),
                self_reserved=self_reserved,
                sup_id=sup_id
            )
            )
            g.session.commit()
            gacp_form_log(gacp_no, farm_id, region_id,
                          "SEED_REGIS_FORM", "create")
        except:
            return redirect(url_for('gacp', somethingbad=1))
        else:
            return redirect(url_for("gacp", is_organic=session.get("is_organic")))
    elif request.method == 'PUT':
        if session.get("is_superuser") not in [0, 1]:
            abort(401)
        regis_id = request.form.get('regis_id')
        gacp_no = request.form.get('gacp_no')
        farm_id = int(gacp_no.split("f")[0])
        region_id = int(gacp_no.split("f")[1].split("t")[0])
        item_no = request.form.get('item_no')
        cultivar_code = g.session.query(db.models.ITEMS).filter(
            db.models.ITEMS.item_no == item_no).first().cultivar_id
        seed_qty = request.form.get('seed_qty').replace(",", "")
        seed_qty_unit = request.form.get('seed_qty_unit')
        purch_date = request.form.get('purch_date') or None
        self_reserved = request.form.get('self_reserved')
        sup_id = request.form.get('sup_id') or None

        if self_reserved == "0":
            if (purch_date is None) | (sup_id is None):
                abort(406)
        elif self_reserved == "1":
            purch_date = None
            sup_id = 0

        if not check_is_field_user(gacp_no):
            abort(401)

        max_old_counter = (g.session
                            .query(db.models.SEED_REGIS_FORM)
                            .filter(db.models.SEED_REGIS_FORM.gacp_no == gacp_no)
                            .order_by(db.models.SEED_REGIS_FORM.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
         .query(db.models.SEED_REGIS_FORM)
         .filter(db.models.SEED_REGIS_FORM.gacp_no == gacp_no)
         .filter(db.models.SEED_REGIS_FORM.is_old == 0)
         .filter(db.models.SEED_REGIS_FORM.regis_id == regis_id)
         .update({"is_old": max_old_counter.is_old+1}))

        g.session.add(db.models.SEED_REGIS_FORM(
            farm_id=farm_id,
            region_id=region_id,
            gacp_no=gacp_no,
            item_no=item_no,
            cultivar_code=cultivar_code,
            seed_qty=seed_qty,
            seed_qty_unit=seed_qty_unit,
            purch_date=purch_date,
            reg_user_id=session.get("id"),
            self_reserved=self_reserved,
            sup_id=sup_id
        ))
        g.session.commit()
        gacp_form_log(gacp_no, farm_id, region_id, "SEED_REGIS_FORM", "update")
        return 'ok'
    else:
        abort(405)