from flask import Blueprint, g, abort, request, session, redirect
from custom_modules.main_modules import db
from custom_modules.gacp_record_modules.allowed_file import allowed_file
from custom_modules.main_modules.decorators import (
    required_area_user, required_farm_user, required_local_user,
    required_login, required_superuser, trace_sys_flag_check)
import uuid
from datetime import datetime
import time

management = Blueprint('management', __name__)

@management.route('/api/upload_gacp_image', methods=['POST'])
@required_login
@trace_sys_flag_check
@required_farm_user
def upload_gacp_image():
    if request.method != 'POST':
        abort(405)
    gacp_no = request.form.get("gacp_no")
    up_file = request.files['up_file']

    if gacp_no.split('f')[0] != str(session.get('id')):
        abort(404)

    if allowed_file(up_file.filename):
        safe_file_name = str(uuid.uuid1())+".jpg"
        up_file_path = './static/photo/product_image/'+safe_file_name
        up_file.save(up_file_path)

        (g.session
          .query(db.models.GACP_LIST_LOG)
          .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
          .update({"image_addr": '../static/photo/product_image/'+safe_file_name}))
        g.session.commit()
    return redirect("/management")


@management.route('/api/upload_purchase_link', methods=['POST'])
@required_login
@trace_sys_flag_check
@required_farm_user
def upload_purchase_link():
    if request.method != 'POST':
        abort(405)
    gacp_no = request.form.get("gacp_no")
    purchase_link_name = request.form.get("purchase_link_name")
    purchase_link = request.form.get("purchase_link")

    if gacp_no.split('f')[0] != str(session.get('id')):
        abort(404)

    if purchase_link_name and purchase_link:
        (g.session
          .query(db.models.GACP_LIST_LOG)
          .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
          .update({"purchase_link_name": purchase_link_name, "purchase_link": purchase_link}))
        g.session.commit()
    return redirect("/management")


@management.route('/api/link_ipcam', methods=['POST'])
@required_login
@trace_sys_flag_check
@required_farm_user
def link_ipcam():
    if request.method != 'POST':
        abort(405)
    gacp_no = request.form.get("gacp_no")
    ipcam_name = request.form.get("ipcam_name")

    if gacp_no.split('f')[0] != str(session.get('id')):
        abort(404)

    (g.session
        .query(db.models.GACP_LIST_LOG)
        .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
        .update({"ipcam_name": ipcam_name}))
    g.session.commit()
    return redirect("/management")


@management.route('/api/cwb_link', methods=['POST'])
@required_login
@trace_sys_flag_check
@required_farm_user
def cwb_link():
    if request.method != 'POST':
        abort(405)
    gacp_no = request.form.get("gacp_no")
    cwb_no = request.form.get("cwb_no")

    if gacp_no.split('f')[0] != str(session.get('id')):
        abort(404)

    (g.session
        .query(db.models.GACP_LIST_LOG)
        .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
        .update({"cwb_no": cwb_no}))
    g.session.commit()
    return redirect("/management")


@management.route('/api/close_gacp', methods=['POST'])
@required_login
@trace_sys_flag_check
@required_farm_user
def close_gacp():
    if request.method != 'POST':
        abort(405)

    user = session.get("id")
    gacp_no = request.form.get("gacp_no")
    dateArray = datetime.utcfromtimestamp(time.time())
    date = dateArray.strftime("%Y-%m-%d")
    (g.session
      .query(db.models.GACP_LIST_LOG)
      .filter(db.models.GACP_LIST_LOG.farm_id == user)
      .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
      .filter(db.models.GACP_LIST_LOG.status == 1)
      .update({"update_date": date, "update_user": session.get("username"), "status": 2}))
    g.session.commit()
    return redirect("/management")


@management.route('/api/switchtoinorganic', methods=['POST'])
@required_login
@trace_sys_flag_check
@required_farm_user
def switch_to_inorganic():
    if request.method != 'POST':
        abort(405)

    user = session.get("id")
    gacp_no = request.form.get("gacp_no")
    dateArray = datetime.utcfromtimestamp(time.time())
    date = dateArray.strftime("%Y-%m-%d")
    (g.session
      .query(db.models.GACP_LIST_LOG)
      .filter(db.models.GACP_LIST_LOG.farm_id == user)
      .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
      .filter(db.models.GACP_LIST_LOG.status == 1)
      .update({"update_date": date, "update_user": session.get("username"), "is_organic": 0}))
    g.session.commit()
    return redirect("/management")
