#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
import inspect
import json
import os
import sys

from datetime import datetime, date, timedelta
from dateutil import parser
from functools import wraps

from flask import (Flask, abort, jsonify, redirect, g,
                   render_template as flask_render_template,
                   request, send_from_directory, session, url_for,
                   send_file)
from sqlalchemy import text, exc, cast, Date, func, distinct, create_engine
from sqlalchemy.dialects import postgresql
from werkzeug.security import check_password_hash, generate_password_hash
from werkzeug.utils import secure_filename
import requests
from bs4 import BeautifulSoup
import time
import config
import uuid
import re
import cv2
import numpy as np

from custom_modules import sensor_data, user_profile, get_switch_time, citytown_list, unit_list

from custom_modules.main_modules import db, utils
from custom_modules.main_modules.decorators import *
from custom_modules.main_modules.custom_render_templates import *
from custom_modules.gacp_search_modules import gacp_search_result, generate_gacp_pdf
from custom_modules.material_modules import material_management, material_supplier
from custom_modules.management import manage_gacp, manage_field, manage_controller, manage_info
from custom_modules.trace_gacp_modules import (
    ipcam_time_lapse, cwb_crawler, farm_trans_data, main_trace,
    gacp_table_trace, show_farm_intro, ipcam_pic)

from custom_modules.gacp_record_modules import (
    add_material, affidavit, certificate_mark, cult_work_record,
    fert_cons_record, fert_purch_record, harvest_record, other_inspection_info,
    other_notes, other_purch_record, pests_diseases_record,
    preve_purch_record, sales_info, seed_regis_form, shippment_record,
    user_add_supplier, add_mark, add_control_obj, add_seed)

app = Flask(__name__)

app.secret_key = config.FLASK_SECRET_KEY
app.permanent_session_lifetime = timedelta(days=config.SESSION_LIFETIME)
db.connect()

app.register_blueprint(gacp_search_result.gacp_search_result)
app.register_blueprint(user_profile.user_profile)

# GACP record
app.register_blueprint(add_material.ADDMATERIAL)
app.register_blueprint(affidavit.AFFIDAVIT)
app.register_blueprint(certificate_mark.CERTIFICATE_MRAK)
app.register_blueprint(cult_work_record.CULT_WORK_RECORD)
app.register_blueprint(fert_cons_record.FERT_CONS_RECORD)
app.register_blueprint(fert_purch_record.FERT_PURCH_RECORD)
app.register_blueprint(harvest_record.HARVEST_RECORD)
app.register_blueprint(other_inspection_info.OTHER_INSPECTION_INFO)
app.register_blueprint(other_notes.OTHER_NOTES)
app.register_blueprint(other_purch_record.OTHER_PURCH_RECORD)
app.register_blueprint(pests_diseases_record.PESTS_DISEASES_RECORD)
app.register_blueprint(preve_purch_record.PREVE_PURCH_RECORD)
app.register_blueprint(sales_info.SALES_INFO)
app.register_blueprint(seed_regis_form.SEED_REGIS_FORM)
app.register_blueprint(shippment_record.SHIPPMENT_RECORD)
app.register_blueprint(user_add_supplier.UserAddSup)
app.register_blueprint(generate_gacp_pdf.gacp_pdf)
app.register_blueprint(add_mark.add_mark)
app.register_blueprint(add_control_obj.add_control_obj)
app.register_blueprint(add_seed.add_seed)

# dashboard get data
app.register_blueprint(sensor_data.sensor_data)

# trace gacp
app.register_blueprint(ipcam_time_lapse.ipcam_time_lapse)
app.register_blueprint(farm_trans_data.farm_trans_data)
app.register_blueprint(cwb_crawler.cwb_crawler)
app.register_blueprint(main_trace.main_trace)
app.register_blueprint(gacp_table_trace.trace_search)
app.register_blueprint(show_farm_intro.show_farm_intro)
app.register_blueprint(ipcam_pic.ipcam_picture)

# manage
app.register_blueprint(manage_gacp.manage_gacp)
app.register_blueprint(manage_field.manage_field)
app.register_blueprint(manage_controller.manage_controller)
app.register_blueprint(manage_info.manage_info)

# else
app.register_blueprint(get_switch_time.old_switch_time)
app.register_blueprint(citytown_list.citytown_list)
app.register_blueprint(unit_list.unit_list)
app.register_blueprint(material_management.material_management)
app.register_blueprint(material_supplier.material_supplier)

#@app.errorhandler(404)
#def not_found(error):
#    return 'Not Found', 404


#@app.errorhandler(500)
#def server_error(error):
#    return 'Server error', 500


@app.route('/favicon.ico')
def favicon():
    return send_from_directory(os.path.join(app.root_path, 'static'),
                               'favicon.ico',
                               mimetype='image/vnd.microsoft.icon')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        user = (g.session
                 .query(db.models.user)
                 .filter(db.models.user.username == username)
                 .first())
        if not user:
            return flask_render_template('login.html', msg='error')

        if user.status != 1:
            return flask_render_template('login.html', msg='error')

        if user and check_password_hash(user.password, password):
            login_session(user)
            return redirect('/dashboard')
        else:
            return flask_render_template('login.html', msg='error')

    if session.get('username'):
        return redirect(request.args.get('next', '/'))

    return flask_render_template('login.html')

@app.route('/logout')
def logout():
    logout_session()
    return redirect('/')

@app.route('/', methods=['GET'])
def TIAGA():
    if session.get('username'):
        return redirect('/dashboard')
    else:
        return before_login('TIAGA.html')

@app.route('/api/hack/camouflage')
def hack():
    if session.get('is_superuser') != 1:
        abort(404)
    
    username = request.args.get('target')
    user = (g.session
                .query(db.models.user)
                .filter(db.models.user.username == username)
                .first())
    if user:
        logout_session()
        login_session(user)
        return redirect('/dashboard')
    else:
        abort(404)
    return '?',404

def login_session(user):
    session['username'] = user.username
    session['id'] = user.id
    session['is_superuser'] = user.is_superuser
    session['status'] = user.status
    session['parent'] = user.parent_id
    session['is_taiwan'] = config.TAIWAN_MODE
    session.permanent = True
    if user.is_superuser == 0:
        target = db.models.user
        session['trace_sys_flag'] = g.session.query(
            target.trace_sys_flag).filter(target.id == user.parent_id).first()[0]
    else:
        session['trace_sys_flag'] = user.trace_sys_flag

def logout_session():
    if session.get('username'):
        del session['username']

    if session.get('id'):
        del session['id']

    if session.get('is_superuser'):
        del session['is_superuser']

    if session.get('status'):
        del session['status']

    if session.get('trace_sys_flag'):
        del session['trace_sys_flag']

    if session.get('parent'):
        del session['parent']

    if session.get('is_taiwan'):
        del session['is_taiwan']


@app.route('/dashboard', methods=['GET'])
@required_login
def dashboard():
    return render_template('dashboard.html')


@app.route('/history', methods=['GET'])
@required_login
def history():
    return render_template('history.html')


@app.route('/compare', methods=['GET'])
@required_login
def sensor_compare():
    return render_template('compare.html')


@app.route('/control', methods=['GET'])
@required_login
def control():
    return control_template('control.html')


@app.route('/profile', methods=['GET'])
@required_login
def profile():
    return render_template('profile.html')


@app.route('/addnewmark', methods=['GET'])
@required_superuser
def addnewmark():
    return render_template('addnewmark.html')


@app.route('/management', methods=['GET'])
@required_farm_user
def management():
    return render_template('management.html')


@app.route('/farm_info_init', methods=['GET'])
@required_superuser
def farm_info_init():
    return render_template('farm_info_init.html')


@app.route('/management_admin', methods=['GET'])
@required_superuser
def management_admin():
    return render_template('management_admin.html')


@app.route('/gacp', methods=['GET'])
@required_login
@trace_sys_flag_check
def gacp():
    if (session.get("is_superuser") == 4) or (session.get("is_superuser") == 3) or (session.get("is_superuser") == 2):
        abort(401)
    is_organic = request.args.get('is_organic') or None

    if is_organic == "true":
        session['is_organic'] = is_organic
        return organic_gacp_template('gacp.html')
    elif is_organic == "false":
        session['is_organic'] = is_organic
        return gacp_template('gacp.html')
    else:
        return gacp_template('gacp.html')


@app.route('/gacp_search', methods=['GET'])
@required_login
@trace_sys_flag_check
def gacp_search():
    user = session.get("is_superuser")
    if (user != 1) and (user != 4) and (user != 0):
        abort(403)
    return gacp_search_template('gacp_search.html')


@app.route('/supplier', methods=['GET'])
@required_login
@trace_sys_flag_check
def supplier():
    return render_template('supplier.html')


@app.route('/material', methods=['GET'])
@required_login
@trace_sys_flag_check
def material():
    return render_template('material.html')


@app.route('/visible_material', methods=['GET'])
@required_login
@trace_sys_flag_check
def visible_material():
    return render_template('visible_material.html')


@app.route('/userprofile', methods=['GET'])
@required_login
def userprofile():
    if session.get("is_superuser") != 4:
        return render_template('userprofile.html')
    else:
        farm_id = session.get("id")
        FARM_INFO = (g.session
                     .query(db.models.FARM_INFO)
                     .filter(db.models.FARM_INFO.farm_id == farm_id)
                     .first())
        file_name = str(farm_id)+"_intro.txt"
        intro_path = "./static/farm_introduction/"+file_name
        try:
            intro = open(intro_path, mode="r+", encoding='utf-8')
            with intro:
                intro_out = intro.read().replace('\n', '').replace('\'', '\\\'').replace(
                    '<p><audio style="display: none;" controls="controls"></audio></p>', '')
            intro.close()
        except:
            intro_out = ""
        return render_template('userprofile.html', intro=intro_out)


@app.route('/api/user/pwd', methods=['POST'])
@required_login
def api_user_change_pwd():
    user_id = session.get('id')
    old_password = request.json.get('old_password')
    new_password = request.json.get('new_password')

    if not new_password:
        return 'new_password', 404

    user = g.session.query(db.models.user).filter(
        db.models.user.id == user_id).first()

    if not user:
        return 'user', 404

    if not check_password_hash(user.password, old_password):
        return 'check_password', 403

    user.password = generate_password_hash(new_password)
    g.session.commit()
    return 'ok'


@app.before_request
def before_request():
    g.session = db.get_session()


@app.teardown_request
def teardown_request(exception):
    session = getattr(g, 'session', None)
    if session is not None:
        session.close()


@app.after_request
def add_header(r):
    """
    Add headers to both force latest IE rendering engine or Chrome Frame,
    and also to cache the rendered page for 10 minutes.
    """
    r.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    r.headers["Pragma"] = "no-cache"
    r.headers["Expires"] = "0"
    r.headers['Cache-Control'] = 'public, max-age=0'
    return r


def main():
    app.run('0', port=7799, debug=config.DEBUG, threaded=True)


if __name__ == '__main__':
    main()