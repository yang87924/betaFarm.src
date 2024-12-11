from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user
from custom_modules.gacp_record_modules.allowed_file import allowed_file
import uuid

CULT_WORK_RECORD = Blueprint('CULT_WORK_RECORD', __name__)

@CULT_WORK_RECORD.route('/api/CULT_WORK_RECORD', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_CULT_WORK_RECORD():
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
            record_item = request.form.get('record_item')
            word_date = request.form.get('word_date')
            memo = request.form.get('memo')
            reg_user_id = session.get("id")

            up_file = request.files['up_file']
            image_addr = ""
            if up_file:
                if allowed_file(up_file.filename):
                    safe_file_name = str(uuid.uuid1())+".jpg"
                    up_file_path = './static/photo/WORK_RECORD/'+safe_file_name
                    up_file.save(up_file_path)
                    image_addr = '../static/photo/WORK_RECORD/'+safe_file_name
                else:
                    abort(500)
            else:
                image_addr = None
            g.session.add(db.models.CULT_WORK_RECORD(
                farm_id=farm_id,
                region_id=region_id,
                gacp_no=gacp_no,
                record_item=record_item,
                word_date=word_date,
                image_addr=image_addr,
                memo=memo,
                reg_user_id=reg_user_id))

            g.session.commit()
            gacp_form_log(gacp_no, farm_id, region_id,
                          "CULT_WORK_RECORD", "create")
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
        record_item = request.form.get('record_item')
        word_date = request.form.get('word_date')
        memo = request.form.get('memo')
        reg_user_id = session.get("id")
        up_file = request.files['up_file']
        old_addr = request.form.get('old_pic_addr')
        record_id = request.form.get('record_id')

        if not check_is_field_user(gacp_no):
            abort(401)

        if up_file:
            if allowed_file(up_file.filename):
                safe_file_name = str(uuid.uuid1())+".jpg"
                up_file_path = './static/photo/WORK_RECORD/'+safe_file_name
                up_file.save(up_file_path)
                up_file_path = '../static/photo/WORK_RECORD/'+safe_file_name
        else:
            if old_addr:
                up_file_path = old_addr
            else:
                up_file_path = None
        max_old_counter = (g.session
                            .query(db.models.CULT_WORK_RECORD)
                            .filter(db.models.CULT_WORK_RECORD.gacp_no == gacp_no)
                            .filter(db.models.CULT_WORK_RECORD.record_id == record_id)
                            .order_by(db.models.CULT_WORK_RECORD.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)
        (g.session
          .query(db.models.CULT_WORK_RECORD)
          .filter(db.models.CULT_WORK_RECORD.gacp_no == gacp_no)
          .filter(db.models.CULT_WORK_RECORD.is_old == 0)
          .filter(db.models.CULT_WORK_RECORD.record_id == record_id)
          .update({"is_old": max_old_counter.is_old+1}))
        g.session.add(db.models.CULT_WORK_RECORD(
            farm_id=farm_id,
            region_id=region_id,
            gacp_no=gacp_no,
            record_item=record_item,
            word_date=word_date,
            image_addr=up_file_path,
            memo=memo,
            reg_user_id=reg_user_id
        ))
        g.session.commit()
        gacp_form_log(gacp_no, farm_id, region_id, "CULT_WORK_RECORD", "update")
        return 'ok'

    else:
        abort(405)
    abort(405)