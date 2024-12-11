from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user
from custom_modules.gacp_record_modules.allowed_file import allowed_file
import uuid

CERTIFICATE_MRAK = Blueprint('CERTIFICATE_MRAK', __name__)

@CERTIFICATE_MRAK.route('/api/CERTIFICATE_MRAK', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_CERTIFICATE_MRAK():
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
            certificate_list_id = request.form.get('certificate_list_id') or None
            effective_date = request.form.get('up_date')
            up_file = request.files['up_file']

            if allowed_file(up_file.filename):
                safe_file_name = str(uuid.uuid1())+".jpg"
                up_file_path = './static/photo/CERTIFICATE_MRAK/'+safe_file_name
                up_file.save(up_file_path)
                memo = request.form.get('memo')
                g.session.add(db.models.CERTIFICATE_MRAK(
                    farm_id=farm_id,
                    field_id=region_id,
                    certificate_list_id=certificate_list_id,
                    effective_date=effective_date,
                    image_addr='../static/photo/CERTIFICATE_MRAK/'+safe_file_name)
                )
                g.session.commit()
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
        mark_id = request.form.get('mark_id')
        certificate_list_id = request.form.get('certificate_list_id') or None
        effective_date = request.form.get('up_date')
        up_file = request.files['up_file']

        if up_file:
            if allowed_file(up_file.filename):
                safe_file_name = str(uuid.uuid1())+".jpg"
                up_file_path = './static/photo/CERTIFICATE_MRAK/'+safe_file_name
                up_file.save(up_file_path)
                up_file_path = '../static/photo/CERTIFICATE_MRAK/'+safe_file_name
        else:
            old_addr = request.form.get('old_pic_addr')
            up_file_path = old_addr

        max_old_counter = (g.session
                            .query(db.models.CERTIFICATE_MRAK)
                            .filter(db.models.CERTIFICATE_MRAK.mark_id == mark_id)
                            .order_by(db.models.CERTIFICATE_MRAK.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
          .query(db.models.CERTIFICATE_MRAK)
          .filter(db.models.CERTIFICATE_MRAK.mark_id == mark_id)
          .filter(db.models.CERTIFICATE_MRAK.is_old == 0)
          .update({"is_old": max_old_counter.is_old+1}))

        g.session.add(db.models.CERTIFICATE_MRAK(
            farm_id=farm_id,
            field_id=region_id,
            effective_date=effective_date,
            image_addr=up_file_path,
            certificate_list_id=certificate_list_id))
        g.session.commit()
        return 'ok'
    abort(405)