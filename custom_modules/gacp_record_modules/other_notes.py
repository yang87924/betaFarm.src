from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user
import uuid

OTHER_NOTES = Blueprint('OTHER_NOTES', __name__)

@OTHER_NOTES.route('/api/OTHER_NOTES', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_OTHER_NOTES():
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
            gacp_select = (g.session
                            .query(db.models.GACP_LIST_LOG.gacp_no)
                            .select_from(db.models.GACP_LIST_LOG)
                            .filter((db.models.GACP_LIST_LOG.farm_id == farm_id) & (db.models.GACP_LIST_LOG.region_id == region_id))
                            .filter(db.models.GACP_LIST_LOG.status == 1)
                           )
            gacp_no = gacp_select
            other_date = request.form.get('other_date')
            memo = request.form.get('memo')
            user_name = request.form.get('user_name')

            g.session.add(db.models.OTHER_NOTES(
                farm_id=farm_id,
                region_id=region_id,
                gacp_no=gacp_no,
                other_date=other_date,
                memo=memo,
                reg_user_id=session.get("id")))
            g.session.commit()
            gacp_form_log(gacp_no, farm_id, region_id, "OTHER_NOTES", "create")
        except:
            return redirect(url_for('gacp', somethingbad=1))
        else:
            return redirect(url_for("gacp", is_organic=session.get("is_organic")))
    elif request.method == 'PUT':
        if session.get("is_superuser") not in [0, 1]:
            abort(401)
        gacp_no = request.form.get('gacp_no')
        farm_id = gacp_no.split("f")[0]
        region_id = int(gacp_no.split("f")[1].split("t")[0])
        other_date = request.form.get('other_date')
        memo = request.form.get('memo')
        user_name = request.form.get('user_name')

        max_old_counter = (g.session
                            .query(db.models.OTHER_NOTES)
                            .filter(db.models.OTHER_NOTES.gacp_no == gacp_no)
                            .filter(db.models.OTHER_NOTES.other_date == other_date)
                            .order_by(db.models.OTHER_NOTES.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
          .query(db.models.OTHER_NOTES)
          .filter(db.models.OTHER_NOTES.gacp_no == gacp_no)
          .filter(db.models.OTHER_NOTES.other_date == other_date)
          .filter(db.models.OTHER_NOTES.is_old == 0)
          .update({"is_old": max_old_counter.is_old+1}))
        g.session.add(db.models.OTHER_NOTES(
            farm_id=farm_id,
            region_id=region_id,
            gacp_no=gacp_no,
            other_date=other_date,
            memo=memo,
            reg_user_id=session.get("id")))
        g.session.commit()
        gacp_form_log(gacp_no, farm_id, region_id, "OTHER_NOTES", "update")
        return 'ok'
    abort(405)