from flask import Blueprint, abort, g, session, request, jsonify, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check

AFFIDAVIT = Blueprint('AFFIDAVIT', __name__)

@AFFIDAVIT.route('/api/AFFIDAVIT', methods=['POST'])
@required_login
@trace_sys_flag_check
def api_AFFIDAVIT():
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
            region_id = request.form.get('region_id')
            organic_affidavit = request.form.get('organic_affidavit')

            (g.session
                .query(db.models.GACP_LIST_LOG)
                .filter(db.models.GACP_LIST_LOG.farm_id == farm_id)
                .filter(db.models.GACP_LIST_LOG.region_id == region_id)
                .filter(db.models.GACP_LIST_LOG.status == 1)
                .update({"organic_affidavit": organic_affidavit}))
            g.session.commit()
            return redirect(url_for("gacp", is_organic="true"))
        except:
            return redirect(url_for('gacp', is_organic="true", no_check=1))
    else:
        abort(405)