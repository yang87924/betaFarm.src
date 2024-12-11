from flask import Blueprint, g, request, jsonify, abort, redirect
from custom_modules.main_modules import db, utils
from custom_modules.gacp_record_modules.allowed_file import allowed_file
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
import uuid
import re

add_mark = Blueprint('add_mark', __name__)

@add_mark.route('/api/addnewmark', methods=['GET', 'POST'])
@required_login
@trace_sys_flag_check
def addnewmark_api():
    if request.method == 'GET':
        query = g.session.query(db.models.CERTIFICATE_LIST).all()
        mark_list = [utils.row2dict(row) for row in query]
        for row in mark_list:
            addr = row["mark_image_addr"]
            row["mark_image_addr"] = "<img src='"+addr + \
                "'style='max-width:100px;height:auto;'>"
        return jsonify(mark_list)
    elif request.method == 'POST':
        mark_name = request.form.get('mark_name')
        mark_image = request.files['mark_image']
        abbreviation = request.form.get('abbreviation')

        if re.match('^[a-zA-Z]{1,}$', abbreviation) is None:
            abort(405)

        if allowed_file(mark_image.filename):
            safe_file_name = str(uuid.uuid1())+".jpg"
            mark_image_path = './static/photo/CERTIFICATE_MARK_SYSTEM/'+safe_file_name
            mark_image.save(mark_image_path)
            g.session.add(db.models.CERTIFICATE_LIST(
                mark_name=mark_name,
                abbreviation=abbreviation,
                mark_image_addr='../static/photo/CERTIFICATE_MARK_SYSTEM/'+safe_file_name)
            )
            g.session.commit()
        return redirect('/addnewmark')
    abort(401)