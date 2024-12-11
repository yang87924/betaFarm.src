from flask import Blueprint, request, session, g, abort
from custom_modules.main_modules import db, utils
from custom_modules.main_modules.decorators import required_farm_user, required_superuser
from datetime import datetime
import re
import json
import time

manage_info = Blueprint('manage_info', __name__)

@manage_info.route('/api/farm/info', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_superuser
def api_query_farm_info():
    if request.method == 'GET':
        # Read info
        if session.get("is_superuser") == 1:
            farm_infos = (g.session
                          .query(db.models.FARM_INFO)
                          .order_by(db.models.FARM_INFO.farm_id)
                          .all())
        else:
            farm_infos = (g.session
                          .query(db.models.FARM_INFO)
                          .join(db.models.user, db.models.FARM_INFO.farm_id == db.models.user.id)
                          .filter(db.models.FARM_INFO.local_agent_id == session.get("id"))
                          .filter(db.models.user.status == 1)
                          .order_by(db.models.FARM_INFO.farm_id)
                          .all())
        province = g.session.query(db.models.PROVINCE).order_by(
            db.models.PROVINCE.province_id).all()
        region = g.session.query(db.models.REGION).order_by(
            db.models.REGION.region_id).all()
        local = g.session.query(db.models.LOCAL).order_by(
            db.models.LOCAL.local_id).all()
        temp_farm_infos = [utils.row2dict(info) for info in farm_infos]
        temp_province = [utils.row2dict(info) for info in province]
        temp_region = [utils.row2dict(info) for info in region]
        temp_local = [utils.row2dict(info) for info in local]
        for info in temp_farm_infos:
            info["username"] = (g.session
                                 .query(db.models.user.username)
                                 .filter(db.models.user.id == info["farm_id"])
                                 .first())[0]
            info["unit_name"] = (g.session.query(db.models.units).filter(
                db.models.units.unit_id == info["area_unit"]).first()).name
        farm = [{"province_list": temp_province}] + [{"region_list": temp_region}
                                                     ]+[{"local_list": temp_local}] + temp_farm_infos
        return json.dumps(farm)
    elif request.method == 'POST':
        # Create info
        is_superuser = session.get("is_superuser")
        if is_superuser == 1:#admin
            parent_id = session.get("id")
        else: 
            parent_id = (g.session.query(db.models.user.id)
                                  .select_from(db.models.user)
                                  .filter(db.models.user.username == session.get('username'))
                                  .first()).id
        farm_id = (g.session.query(db.models.user.id)
                   .select_from(db.models.user)
                   .filter(db.models.user.parent_id == parent_id)
                   .order_by(db.models.user.id.desc())
                   .first())
        dateArray = datetime.utcfromtimestamp(time.time())

        date = dateArray.strftime("%Y-%m-%d")

        farm_area = float(request.json.get('farm_area'))
        arable_area = float(request.json.get('arable_area'))

        if farm_area < arable_area:
            return "202", 406

        if (int(farm_area) > 99999999) or (int(arable_area) > 99999999):
            return "203", 406

        tel_no = request.json.get('tel_no')
        email = request.json.get('email') or None

        if re.match('^\d{7,18}$', tel_no) is not None:
            pass
        else:
            abort(406)
        if email is not None:
            if re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
                pass
            elif email == '':
                pass
            else:
                abort(406)

        new_info = db.models.FARM_INFO(farm_id=farm_id.id,
                                       province_id=0,#not use
                                       local_id=0,#not use
                                       local_agent_id=parent_id,
                                       farm_addr=request.json.get('farm_addr'),
                                       farm_area=farm_area,
                                       arable_area=arable_area,
                                       area_unit=request.json.get('area_unit'),
                                       farm_user=request.json.get('farm_user'),
                                       farm_name=request.json.get('farm_name'),
                                       tgap_no=request.json.get('tgap_no'),
                                       tel_no=tel_no,
                                       email=email,
                                       wechat_id=request.json.get('wechat_id'),
                                       create_date=date,
                                       create_user=session.get('username'))
        g.session.add(new_info)
        g.session.commit()
        return json.dumps(utils.row2dict(new_info))
    elif request.method == 'PUT':
        dateArray = datetime.utcfromtimestamp(time.time())
        date = dateArray.strftime("%Y-%m-%d")
        # Update info
        id_ = request.json.get('farm_id')
        tel_no = request.json.get('tel_no')
        email = request.json.get('email')

        farm_area = float(request.json.get('farm_area'))
        arable_area = float(request.json.get('arable_area'))

        if farm_area < arable_area:
            return "202", 406

        if (farm_area > 99999999) or (arable_area > 99999999):
            return "203", 406

        if re.match('^\d{7,18}$', tel_no) is None:
            abort(406)
        if email is not None:
            if re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
                pass
            elif email == '':
                pass
            else:
                abort(406)

        del request.json["unit_name"]
        (g.session
          .query(db.models.FARM_INFO)
          .filter(db.models.FARM_INFO.farm_id == id_)
          .update(request.json))
        (g.session
          .query(db.models.FARM_INFO)
          .filter(db.models.FARM_INFO.farm_id == id_)
          .update({'update_date': date,
                   'update_user': session.get('username')}))
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete info
        id_ = request.args.get('farm_id')
        (g.session
          .query(db.models.FARM_INFO)
          .filter(db.models.FARM_INFO.farm_id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)

@manage_info.route('/api/farmer_change_info', methods=['PUT'])
@required_farm_user
def farmer_change_info():
    dateArray = datetime.utcfromtimestamp(time.time())
    date = dateArray.strftime("%Y-%m-%d")
    # Update info
    id_ = request.json.get('farm_id')
    tel_no = request.json.get('tel_no')
    email = request.json.get('email')
    if re.match('^\d{7,18}$', tel_no) is not None:
        pass
    else:
        abort(406)
    if email is not None:
        if re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
            pass
        elif email == '':
            pass
        else:
            abort(406)

    del request.json["intro"]
    del request.json["province_id"]
    del request.json["local_id"]
    del request.json["local_agent_id"]
    del request.json["unit_name"]

    (g.session
        .query(db.models.FARM_INFO)
        .filter(db.models.FARM_INFO.farm_id == id_)
        .update(request.json))
    (g.session
        .query(db.models.FARM_INFO)
        .filter(db.models.FARM_INFO.farm_id == id_)
        .update({'update_date': date,
                 'update_user': session.get('username')}))
    g.session.commit()

    return 'ok'