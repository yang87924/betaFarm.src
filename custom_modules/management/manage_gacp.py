from flask import Blueprint, g, abort, request, session, redirect, jsonify
from custom_modules.main_modules import db, utils
from custom_modules.gacp_record_modules.allowed_file import allowed_file
from custom_modules.main_modules.decorators import (
     required_farm_user, required_login, required_superuser, trace_sys_flag_check)
import uuid
from datetime import datetime
import time
import json
import re

manage_gacp = Blueprint('manage_gacp', __name__)

@manage_gacp.route('/api/upload_gacp_image', methods=['POST'])
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


@manage_gacp.route('/api/upload_purchase_link', methods=['POST'])
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


@manage_gacp.route('/api/link_ipcam', methods=['POST'])
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


@manage_gacp.route('/api/cwb_link', methods=['POST'])
@required_login
@trace_sys_flag_check
@required_farm_user
def cwb_link():
    if request.method != 'POST':
        abort(405)
    gacp_no = request.form.get("gacp_no")
    cwb_no = request.form.get("cwb_no")
    
    if session.get('is_superuser') != 1: # not admin
        if gacp_no.split('f')[0] != str(session.get('id')):
            abort(404)

    (g.session
        .query(db.models.GACP_LIST_LOG)
        .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
        .update({"cwb_no": cwb_no}))
    g.session.commit()
    return redirect("/management")


@manage_gacp.route('/api/close_gacp', methods=['POST'])
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


@manage_gacp.route('/api/switch_to_inorganic', methods=['POST'])
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

@manage_gacp.route('/api/gacp_log', methods=['GET', 'POST'])
@required_farm_user
def api_query_gacp_log():
    user = session.get('is_superuser')
    if request.method == 'DELETE':
        abort(405)
    timestamp = str(int(time.time()))
    dateArray = datetime.utcfromtimestamp(time.time())
    date = dateArray.strftime("%Y-%m-%d")
    field_list = []
    field_query = (g.session
                    .query(db.models.field)
                    .join(db.models.FIELD_INFO, db.models.field.id == db.models.FIELD_INFO.field_id)
                    .filter(db.models.field.creator_id == session.get('id'))
                    .all())
    for field in field_query:
        field_list.append([field.id, field.name, field.alias])

    if request.method == 'GET':
        if user == 1:
            gacp_list_log = g.session.query(db.models.GACP_LIST_LOG).order_by(
                db.models.GACP_LIST_LOG.gacp_no).all()
            return jsonify([{"field_info": field_list}]+[utils.row2dict(log) for log in gacp_list_log])
        elif user == 4:
            gacp_list_log = g.session.query(db.models.GACP_LIST_LOG).filter(
                db.models.GACP_LIST_LOG.farm_id == session.get('id')).order_by(db.models.GACP_LIST_LOG.gacp_no).all()
            return jsonify([{"field_info": field_list}]+[utils.row2dict(log) for log in gacp_list_log])
    elif request.method == 'POST':
        if user == 0:
            abort(403)
        field_id = str(request.json.get('field_id'))

        farm_id = (g.session
                    .query(db.models.FIELD_INFO.farm_id)
                    .select_from(db.models.FIELD_INFO)
                    .filter(db.models.FIELD_INFO.field_id == request.json.get('field_id'))
                    .group_by(db.models.FIELD_INFO.farm_id)
                   )

        is_organic = request.json.get('is_organic') or None
        planning_planting_date = request.json.get(
            'planning_planting_date') or None

        if not field_id:
            return 'No field_id'
        elif len(field_id) == 1:
            field_id = "00"+str(field_id)
        elif len(field_id) == 2:
            field_id = "0"+str(field_id)
        elif len(field_id) > 3 or len(field_id) < 1:
            return 'field_id in range 0 to 999'

        farm_id_str = ''
        if farm_id:
            for id in farm_id:
                farm_id_str += str(id[0])

        check_status = (g.session
                         .query(db.models.GACP_LIST_LOG)
                         .filter(db.models.GACP_LIST_LOG.farm_id == farm_id_str)
                         .filter(db.models.GACP_LIST_LOG.region_id == field_id)
                         .filter(db.models.GACP_LIST_LOG.status == 1)
                         .first())
        if check_status:
            abort(406)
        try:
            new_gacp = db.models.GACP_LIST_LOG(gacp_no=farm_id_str+"f"+field_id+"t"+timestamp,
                                               farm_id=farm_id_str,
                                               region_id=field_id,
                                               log_table="temp",  # temp
                                               create_date=date,
                                               create_user=session.get(
                                                   'username'),
                                               status=1,
                                               is_organic=is_organic,
                                               planning_planting_date=planning_planting_date
                                               )
        except:
            abort(406)
        try:
            g.session.add(new_gacp)
            g.session.commit()
        except:
            abort(406)
        gacp_list_log = g.session.query(db.models.GACP_LIST_LOG).order_by(
            db.models.GACP_LIST_LOG.gacp_no).all()
        return jsonify([utils.row2dict(log) for log in gacp_list_log])

    abort(404)