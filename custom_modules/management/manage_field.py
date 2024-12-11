from flask import Blueprint, g, session, request, abort
from custom_modules.main_modules import db, utils
from werkzeug.security import check_password_hash, generate_password_hash
from custom_modules.main_modules.decorators import required_login, required_farm_user
from datetime import datetime
import json
import time
import inspect
import re

manage_field = Blueprint('manage_field', __name__)

@manage_field.route('/api/user', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_login
def api_query_user():
    user_level_list = [0, 4, 3, 2, 1]
    #is_superuser = 0,1,2,3,4
    user_level = user_level_list.index(session.get('is_superuser'))
    if user_level == 0:
        return abort(401)

    if request.method == 'GET':
        # Read user
        # GET /api/user[?id=<id>&username=<username>]
        users = []
        query = g.session.query(db.models.user)

        for key, value in request.args.items():
            attr = getattr(db.models.user, key, None)
            if attr:
                query = query.filter(attr == value)
        # if admin : list all user
        if user_level == 4:  # admin
            query = query.order_by(db.models.user.id).all()
        else:
            query = query.filter((db.models.user.id == session.get('id')) | (db.models.user.parent_id == session.get(
                'id'))).filter(db.models.user.status == 1).order_by(db.models.user.id).all()

        for user in query:
            query_access = (g.session
                             .query(db.models.field, db.models.user_access)
                             .select_from(db.models.user_access)
                             .join(db.models.field)
                             .filter((db.models.user_access.user == user.id))
                             .order_by(db.models.user_access.id)
                             .all())
            access = []
            active = None
            for field, acc in query_access:
                access.append(utils.row2dict(field))
                if acc.is_active:
                    active = acc.field
            users.append({
                'id': user.id,
                'username': user.username,
                'is_superuser': user.is_superuser,
                'access': access,
                'active': active,
                'status': user.status,
                'trace_sys_flag': user.trace_sys_flag
            })
        return json.dumps(users)
    elif request.method == 'POST':
        # Create user
        # POST /api/user
        # {username:<username>, password:<password>, is_superuser:<is_superuser>}
        username = request.json.get('username')
        password = generate_password_hash(request.json.get('password'))

        is_superuser = 0
        if session.get('is_superuser') == 1:
            is_superuser = request.json.get('is_superuser')
        else:
            is_superuser = user_level_list[user_level-1]

        if username == False:
            abort(406)
        if len(username) < 4:
            abort(406)

        access = request.json.get('access', [])
        active = request.json.get('active')
        parent_id = g.session.query(db.models.user.id).filter(
            db.models.user.id == session.get('id')).first()

        if user_level == 2:
            new_user = db.models.user(username=username,
                                      password=password,
                                      is_superuser=is_superuser,
                                      parent_id=parent_id.id,
                                      trace_sys_flag=request.json.get('trace_sys_flag'))
        else:
            new_user = db.models.user(username=username,
                                      password=password,
                                      is_superuser=is_superuser,
                                      parent_id=parent_id.id,
                                      trace_sys_flag=request.json.get('trace_sys_flag') or 0)
        g.session.add(new_user)
        g.session.commit()

        for field in access:
            new_access = db.models.user_access(
                user=new_user.id, field=field.get('id'))
            if field.get('id') == active:
                new_access.is_active = True
            g.session.add(new_access)
        g.session.commit()

        return json.dumps(utils.row2dict(new_user))
    elif request.method == 'PUT':
        # Update user
        # PUT /api/user
        # {id:<id>, username:<username>, is_superuser:<is_superuser>}
        id_ = request.json.get('id')
        username = request.json.get('username')
        is_superuser = request.json.get('is_superuser')
        access = request.json.get('access', [])
        active = request.json.get('active')

        is_superuser = 0
        if session.get('is_superuser') == 1:
            is_superuser = request.json.get('is_superuser')
        else:
            is_superuser = user_level_list[user_level-1]


        (g.session
          .query(db.models.user)
          .filter(db.models.user.id == id_)
          .update({'username': username,
                   'is_superuser': is_superuser,
                   'trace_sys_flag': request.json.get('trace_sys_flag') or 0
                  }))

        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.user == id_)
          .delete())
        for field in access:
            new_access = db.models.user_access(user=id_, field=field.get('id'))
            if field.get('id') == active:
                new_access.is_active = True
            g.session.add(new_access)
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete user
        # DELETE /api/user?id=<id>

        id_ = request.args.get('id')

        # deleted user should not have children with status == 1
        children = (g.session
                     .query(db.models.user)
                     .filter(db.models.user.parent_id == id_)
                     .filter(db.models.user.status == 1)
                     .first())

        if children != None:
            abort(406)

        deleted_user = (g.session
                         .query(db.models.user)
                         .filter(db.models.user.id == id_)
                         .first())

        # if deleted user is field level , check if is a field user
        if deleted_user.is_superuser == 0:
            is_field_user = (g.session
                              .query(db.models.FIELD_INFO)
                              .filter(db.models.FIELD_INFO.field_user == deleted_user.username)
                              .first())
            if is_field_user != None:
                abort(406)

        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.user == id_)
          .delete())
        (g.session
          .query(db.models.user)
          .filter(db.models.user.id == id_)
          .update({'status': 2}))
        g.session.commit()

        return 'ok'
    abort(404)

@manage_field.route('/api/ipcam', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_farm_user
def api_query_ipcam():
    dateArray = datetime.utcfromtimestamp(time.time())
    date = dateArray.strftime("%Y-%m-%d")
    if request.method == 'GET':
        ipcams = []
        infos = []
        name_list = []
        field_user_list = {}
        soil_type = []
        soil_type_list = {}
        cultivar = []
        cultivar_list = {}
        field_method = []
        field_method_list = {}

        # ipcam that this account can see
        if session.get("is_superuser") == 1:
            query_ipcam = (g.session
                           .query(db.models.field)
                           .filter(db.models.field.ipcam != "")
                           .order_by(db.models.field.id)
                           .all())
        else:
            query_ipcam = (g.session
                           .query(db.models.field)
                           .filter(db.models.field.creator_id == session.get("id"))
                           .filter(db.models.field.ipcam != "")
                           .order_by(db.models.field.id)
                           .all())

        for ipcam in query_ipcam:
            temp_ipcam = utils.row2dict(ipcam)

            ipcams.append(temp_ipcam)
        ipcam = ipcams
        return json.dumps(ipcam)

    elif request.method == 'POST':
        # Create field
        # POST /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}

        name = request.json.get('name')
        if re.match('^[a-zA-Z0-9_]{1,200}$', name) is not None:
            pass
        else:
            abort(406)

        field_exist = (g.session
                        .query(db.models.field)
                        .filter(db.models.field.creator_id == session.get("id"))
                        .filter(db.models.field.name == name)
                        .first())

        if field_exist is None:
            pass
        else:
            abort(400)
        alias = request.json.get('alias')
        ipcam = request.json.get('ipcam') or None
        if ipcam is None:
            ipcam = "no data"
        new_ipcam = db.models.field(name=name,
                                    alias=alias,
                                    ipcam=ipcam,
                                    creator_id=session.get('id'))
        g.session.add(new_ipcam)
        g.session.commit()

        last_id = (g.session
                    .query(db.models.field.id)
                    .select_from(db.models.field)
                    .filter(db.models.field.creator_id == session.get('id'))
                    .order_by(db.models.field.id.desc())
                    .first()
                   )

        new_access = db.models.user_access(user=session.get('id'),
                                           field=last_id.id,
                                           is_active=False)
        g.session.add(new_access)
        g.session.commit()

        return json.dumps(utils.row2dict(new_ipcam))

    elif request.method == 'PUT':
        # Update field
        # PUT /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}
        print(request.json)
        id_ = request.json.get('id')
        name = request.json.get('name')
        alias = request.json.get('alias')
        ipcam = request.json.get('ipcam', '')
        if re.match('^[a-zA-Z0-9_]{1,200}$', name) is not None:
            pass
        else:
            abort(406)

        field_exist = (g.session
                        .query(db.models.field)
                        .filter(db.models.field.creator_id == session.get("id"))
                        .filter(db.models.field.name == name)
                        .first())

        field_now = (g.session
                     .query(db.models.field)
                     .filter(db.models.field.id == id_)
                     .first())

        if (field_exist is None):
            pass
        elif name == field_now.name:
            pass
        else:
            abort(400)

        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .update({'name': name,
                   'alias': alias,
                   'ipcam': ipcam}))
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete field
        # DELETE /api/field?id=<id>
        id_ = request.args.get('id')

        for attr in db.models.__dict__.values():
            if inspect.isclass(attr) and hasattr(attr, 'timestamp'):
                (g.session
                  .query(attr)
                  .filter(attr.field == id_)
                  .delete())
        (g.session
          .query(db.models.field_sensor)
          .filter(db.models.field_sensor.field == id_)
          .delete())
        (g.session
          .query(db.models.FIELD_INFO)
          .filter(db.models.FIELD_INFO.field_id == id_)
          .delete())
        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.field == id_)
          .delete())
        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)

@manage_field.route('/api/sensor', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_login
def api_query_sensor():
    if request.method == 'GET':
        # Read sensor
        # GET /api/sensor
        sensors = g.session.query(db.models.sensor).order_by(
            db.models.sensor.id).all()
        return json.dumps([utils.row2dict(sensor) for sensor in sensors])
    elif request.method == 'POST':
        # Create sensor
        # POST /api/sensor
        # {name:<string>, df_name:<string>, alias:<string>, unit:<string>,
        #  icon:<string>, bg_color:<string>}
        if session.get("is_superuser") is not 1:
            abort(401)

        df_name = request.json.get('df_name')
        if not df_name:
            return 'No df_name'

        new_sensor = db.models.sensor(df_name=df_name,
                                      name=request.json.get('name'),
                                      alias=request.json.get('alias'),
                                      unit=request.json.get('unit'),
                                      icon=request.json.get('icon'),
                                      bg_color=request.json.get('bg_color'))
        g.session.add(new_sensor)
        g.session.commit()

        return json.dumps(utils.row2dict(new_sensor))
    elif request.method == 'PUT':
        # Update sensor
        # PUT /api/sensor
        # {id:<int>, name:<string>, df_name:<string>, alias:<string>,
        #  unit:<string>, icon:<string>, bg_color:<string>}
        id_ = request.json.get('id')
        (g.session
          .query(db.models.sensor)
          .filter(db.models.sensor.id == id_)
          .update(request.json))
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete sensor
        # DELETE /api/sensor?id=<id>
        id_ = request.args.get('id')
        (g.session
          .query(db.models.sensor)
          .filter(db.models.sensor.id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)



@manage_field.route('/api/field', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_farm_user
def api_query_field():
    dateArray = datetime.utcfromtimestamp(time.time())
    date = dateArray.strftime("%Y-%m-%d")
    if request.method == 'GET':
        fields = []
        infos = []
        name_list = []
        field_user_list = {}
        soil_type = []
        soil_type_list = {}
        cultivar = []
        cultivar_list = {}
        field_method = []
        field_method_list = {}

        # fields that this account can see
        if session.get("is_superuser") == 1:
            query_fields = (g.session
                            .query(db.models.field)
                            .join(db.models.FIELD_INFO, db.models.field.id == db.models.FIELD_INFO.field_id)
                            .order_by(db.models.field.id)
                            .all())
            query_infos = (g.session
                           .query(db.models.FIELD_INFO)
                           .join(db.models.field, db.models.FIELD_INFO.field_id == db.models.field.id)
                           .order_by(db.models.FIELD_INFO.field_id)
                           .all())
        else:
            query_fields = (g.session
                             .query(db.models.field)
                             .join(db.models.FIELD_INFO, db.models.field.id == db.models.FIELD_INFO.field_id)
                             .filter(db.models.FIELD_INFO.farm_id == session.get("id"))
                             .order_by(db.models.field.id)
                             .all())
            query_infos = (g.session
                           .query(db.models.FIELD_INFO)
                           .join(db.models.field, db.models.FIELD_INFO.field_id == db.models.field.id)
                           .filter(db.models.FIELD_INFO.farm_id == session.get("id"))
                           .order_by(db.models.FIELD_INFO.field_id)
                           .all())
        field_user_names = (g.session
                            .query(db.models.user.username)
                            .filter(db.models.user.parent_id == session.get('id'))
                            .filter(db.models.user.status == 1)
                            .order_by(db.models.user.id)
                            .all())

        soil_type_query = (g.session
                            .query(db.models.SOIL_TYPE_LIST)
                            .all())
        for info in soil_type_query:
            soil_type.append([info.soil_type, info.soil_type_name])
        soil_type_list["soil_type_list"] = soil_type

        cultivar_query = (g.session
                           .query(db.models.CULTIVAR_LIST)
                           .all())
        for info in cultivar_query:
            cultivar.append([info.cultivar_code, info.cultivar_name])
        cultivar_list["cultivar_list"] = cultivar

        field_method_query = (g.session
                              .query(db.models.FIELD_METHOD_LIST)
                              .all())
        for info in field_method_query:
            field_method.append([info.field_method, info.field_method_name])
        field_method_list["field_method_list"] = field_method

        for user in field_user_names:
            name_list.append(user.username)
        field_user_list["field_user"] = name_list
        for field, info in zip(query_fields, query_infos):
            arable_area_unit_name = (g.session
                                     .query(db.models.units)
                                     .filter(db.models.units.unit_id == info.arable_area_unit)
                                     .first()).name
            temp_field = utils.row2dict(field)
            temp_info = utils.row2dict(info)
            temp_info["arable_area_unit_name"] = arable_area_unit_name
            temp_field.update(temp_info)

            query_field_sensor = (g.session
                                   .query(db.models.sensor.name,
                                          db.models.field_sensor.sensor,
                                          db.models.field_sensor.df_name,
                                          db.models.field_sensor.alias,
                                          db.models.field_sensor.unit,
                                          db.models.field_sensor.icon,
                                          db.models.field_sensor.bg_color)
                                   .select_from(db.models.field_sensor)
                                   .join(db.models.sensor)
                                   .filter(db.models.field_sensor.field == field.id)
                                   .order_by(db.models.field_sensor.id)
                                   .all())

            temp_field['sensors'] = []
            for sensor in query_field_sensor:
                temp_sensor = {
                    'name': sensor[0],
                    'sensor': sensor[1],
                    'df_name': sensor[2],
                    'alias': sensor[3],
                    'unit': sensor[4],
                    'icon': sensor[5],
                    'bg_color': sensor[6],
                }
                temp_field['sensors'].append(temp_sensor)
            fields.append(temp_field)
        fields = [field_user_list] + [soil_type_list] + \
            [cultivar_list] + [field_method_list] + fields
        return json.dumps(fields)

    elif request.method == 'POST':
        # Create field
        # POST /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}
        town_id = request.json.get('town_id')
        city_id = request.json.get('city_id')
        city_query = (g.session
                      .query(db.models.taiwan_town_list)
                      .filter(db.models.taiwan_town_list.city_id == city_id)
                      .filter(db.models.taiwan_town_list.town_id == town_id)
                      .first())

        if not city_query:
            return "city or town error", 500

        name = request.json.get('name')
        if re.match('^[a-zA-Z0-9_]{1,200}$', name) is not None:
            pass
        else:
            abort(404)

        field_exist = (g.session
                        .query(db.models.field)
                        .filter(db.models.field.creator_id == session.get("id"))
                        .filter(db.models.field.name == name)
                        .first())

        if field_exist is None:
            pass
        else:
            abort(400)

        area = request.json.get('arable_area')

        zoom = (g.session
                .query(db.models.units.standard_zoom)
                .filter(db.models.units.unit_id == request.json.get("arable_area_unit"))
                .first())

        parent_farm = (g.session.query(db.models.FARM_INFO)
                                .filter(db.models.FARM_INFO.farm_id == session.get("id"))
                                .first())

        farm_zoom = (g.session
                     .query(db.models.units.standard_zoom)
                     .filter(db.models.units.unit_id == parent_farm.area_unit)
                     .first())

        standard_area = format(float(area) * float(zoom.standard_zoom), ".5f")

        farm_standard_area = format(
            float(parent_farm.arable_area) * float(farm_zoom.standard_zoom), ".5f")

        new_field = db.models.field(name=name,
                                    alias=request.json.get('alias'),
                                    iframe=request.json.get('iframe', ''),
                                    creator_id=session.get('id'))
        g.session.add(new_field)
        g.session.commit()

        last_id = (g.session
                    .query(db.models.field.id)
                    .select_from(db.models.field)
                    .filter(db.models.field.creator_id == session.get('id'))
                    .order_by(db.models.field.id.desc())
                    .first()
                   )
        farm_id = (g.session
                    .query(db.models.user.id)
                    .select_from(db.models.user)
                    .filter(db.models.user.username == session.get('username'))
                    .first())

        new_field_info = db.models.FIELD_INFO(field_id=last_id.id,
                                              farm_id=farm_id.id,
                                              arable_area=area,
                                              field_user=request.json.get(
                                                  'field_user'),
                                              field_facility=request.json.get(
                                                  'field_facility'),
                                              Soil_type=request.json.get(
                                                  'Soil_type'),
                                              fiele_method=request.json.get(
                                                  'fiele_method'),
                                              cadastral=request.json.get(
                                                  'cadastral'),
                                              create_date=date,
                                              create_user=session.get(
                                                  'username'),
                                              standard_area=standard_area,
                                              arable_area_unit=request.json.get(
                                                  'arable_area_unit'),
                                              city_id=request.json.get(
                                                  'city_id'),
                                              town_id=request.json.get(
                                                  'town_id')
                                              )

        g.session.add(new_field_info)
        g.session.commit()

        field_user = (g.session
                       .query(db.models.user)
                       .filter(db.models.user.username == request.json.get('field_user'))
                       .first())

        new_access = db.models.user_access(user=field_user.id,
                                           field=last_id.id,
                                           is_active=False)
        g.session.add(new_access)
        g.session.commit()

        new_access2 = db.models.user_access(user=session.get('id'),
                                            field=last_id.id,
                                            is_active=False)
        g.session.add(new_access2)
        g.session.commit()

        for sensor in request.json.get('sensors', []):
            new_sensor = db.models.field_sensor(
                field=new_field.id,
                sensor=sensor.get('sensor'),
                df_name=sensor.get('df_name'),
                alias=sensor.get('alias'),
                unit=sensor.get('unit'),
                icon=sensor.get('icon'),
                bg_color=sensor.get('bg_color'))
            g.session.add(new_sensor)
            g.session.commit()

        return json.dumps(utils.row2dict(new_field))

    elif request.method == 'PUT':
        # Update field
        # PUT /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}
        print(request.json)
        id_ = request.json.get('id')
        name = request.json.get('name')
        alias = request.json.get('alias')
        iframe = request.json.get('iframe', '')
        sensors = request.json.get('sensors', [])
        farm_id = request.json.get('farm_id')
        arable_area = request.json.get('arable_area')
        field_user = request.json.get('field_user')
        field_facility = request.json.get('field_facility')
        Soil_type = request.json.get('Soil_type')
        fiele_method = request.json.get('fiele_method')
        cadastral = request.json.get('cadastral'),
        arable_area_unit = request.json.get('arable_area_unit')
        city_id = request.json.get('city_id')
        town_id = request.json.get('town_id')

        zoom = (g.session
                .query(db.models.units.standard_zoom)
                .filter(db.models.units.unit_id == arable_area_unit)
                .first())

        parent_farm = (g.session.query(db.models.FARM_INFO)
                                .filter(db.models.FARM_INFO.farm_id == session.get("id"))
                                .first())

        farm_zoom = (g.session
                     .query(db.models.units.standard_zoom)
                     .filter(db.models.units.unit_id == parent_farm.area_unit)
                     .first())

        standard_area = format(float(arable_area) *
                               float(zoom.standard_zoom), ".5f")

        farm_standard_area = format(
            float(parent_farm.arable_area) * float(farm_zoom.standard_zoom), ".5f")

        if re.match('^[a-zA-Z0-9_]{1,200}$', name) is not None:
            pass
        else:
            abort(404)

        city_query = (g.session
                      .query(db.models.taiwan_town_list)
                      .filter(db.models.taiwan_town_list.city_id == city_id)
                      .filter(db.models.taiwan_town_list.town_id == town_id)
                      .first())

        if not city_query:
            return "city or town error", 500

        field_exist = (g.session
                        .query(db.models.field)
                        .filter(db.models.field.creator_id == session.get("id"))
                        .filter(db.models.field.name == name)
                        .first())

        field_now = (g.session
                     .query(db.models.field)
                     .filter(db.models.field.id == id_)
                     .first())

        if (field_exist is None):
            pass
        elif name == field_now.name:
            pass
        else:
            abort(400)

        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .update({'name': name,
                   'alias': alias,
                   'iframe': iframe}))

        (g.session
          .query(db.models.FIELD_INFO)
          .filter(db.models.FIELD_INFO.field_id == id_)
          .update({'farm_id': farm_id,
                   'arable_area': arable_area,
                   'field_user': field_user,
                   'field_facility': field_facility,
                   'Soil_type': Soil_type,
                   'fiele_method': fiele_method,
                   'update_date': date,
                   'update_user': session.get('username'),
                   'standard_area': standard_area,
                   'arable_area_unit': arable_area_unit,
                   'cadastral': cadastral,
                   'city_id': city_id,
                   'town_id': town_id}))

        (g.session
          .query(db.models.field_sensor)
          .filter(db.models.field_sensor.field == id_)
          .delete())

        for sensor in sensors:
            new_sensor = db.models.field_sensor(
                field=id_,
                sensor=sensor.get('sensor'),
                df_name=sensor.get('df_name'),
                alias=sensor.get('alias'),
                unit=sensor.get('unit'),
                icon=sensor.get('icon'),
                bg_color=sensor.get('bg_color'))
            new_sensor.field = id_
            new_sensor.id = None
            g.session.add(new_sensor)
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete field
        # DELETE /api/field?id=<id>
        id_ = request.args.get('id')

        field_in_gacp = (g.session
                          .query(db.models.GACP_LIST_LOG)
                          .filter(db.models.GACP_LIST_LOG.region_id == id_)
                          .first())

        if field_in_gacp is not None:
            abort(405)

        (g.session
          .query(db.models.field_sensor)
          .filter(db.models.field_sensor.field == id_)
          .delete())
        (g.session
          .query(db.models.FIELD_INFO)
          .filter(db.models.FIELD_INFO.field_id == id_)
          .delete())
        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.field == id_)
          .delete())
        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)

@manage_field.route('/api/other_sensor', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_farm_user
def api_query_other_sensor():
    dateArray = datetime.utcfromtimestamp(time.time())
    date = dateArray.strftime("%Y-%m-%d")
    if request.method == 'GET':
        fields = []
        infos = []

        # fields that this account can see
        if session.get("is_superuser") == 1:
            query_other_sensor = (g.session
                                   .query(db.models.field)
                                   .filter(db.models.field.other_chk == 1)
                                   .order_by(db.models.field.id)
                                   .all())
        else:
            query_other_sensor = (g.session
                                   .query(db.models.field)
                                   .filter(db.models.field.creator_id == session.get("id"))
                                   .filter(db.models.field.other_chk == 1)
                                   .order_by(db.models.field.id)
                                   .all())

        for field in query_other_sensor:
            temp_field = utils.row2dict(field)

            query_field_sensor = (g.session
                                   .query(db.models.sensor.name,
                                          db.models.field_sensor.sensor,
                                          db.models.field_sensor.df_name,
                                          db.models.field_sensor.alias,
                                          db.models.field_sensor.unit,
                                          db.models.field_sensor.icon,
                                          db.models.field_sensor.bg_color)
                                   .select_from(db.models.field_sensor)
                                   .join(db.models.sensor)
                                   .filter(db.models.field_sensor.field == field.id)
                                   .order_by(db.models.field_sensor.id)
                                   .all())

            temp_field['sensors'] = []
            for sensor in query_field_sensor:
                temp_sensor = {
                    'name': sensor[0],
                    'sensor': sensor[1],
                    'df_name': sensor[2],
                    'alias': sensor[3],
                    'unit': sensor[4],
                    'icon': sensor[5],
                    'bg_color': sensor[6],
                }
                temp_field['sensors'].append(temp_sensor)
            fields.append(temp_field)

        return json.dumps(fields)

    elif request.method == 'POST':
        # Create field
        # POST /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}

        name = request.json.get('name')
        if re.match('^[a-zA-Z0-9_]{1,200}$', name) is not None:
            pass
        else:
            abort(404)

        field_exist = (g.session
                       .query(db.models.field)
                       .filter(db.models.field.creator_id == session.get("id"))
                       .filter(db.models.field.name == name)
                       .first())

        if field_exist is None:
            pass
        else:
            abort(400)

        new_field = db.models.field(name=name,
                                    alias=request.json.get('alias'),
                                    other_chk=1,
                                    creator_id=session.get('id'))
        g.session.add(new_field)
        g.session.commit()

        last_id = (g.session
                    .query(db.models.field.id)
                    .select_from(db.models.field)
                    .filter(db.models.field.creator_id == session.get('id'))
                    .order_by(db.models.field.id.desc())
                    .first()
                   )

        new_access = db.models.user_access(user=session.get('id'),
                                           field=last_id.id,
                                           is_active=False)
        g.session.add(new_access)
        g.session.commit()

        for sensor in request.json.get('sensors', []):
            new_sensor = db.models.field_sensor(
                field=new_field.id,
                sensor=sensor.get('sensor'),
                df_name=sensor.get('df_name'),
                alias=sensor.get('alias'),
                unit=sensor.get('unit'),
                icon=sensor.get('icon'),
                bg_color=sensor.get('bg_color'))
            g.session.add(new_sensor)
            g.session.commit()

        return json.dumps(utils.row2dict(new_field))

    elif request.method == 'PUT':
        # Update field
        # PUT /api/field
        # {name:<string>, alias:<string>, sensors: [<sensor>, ...]}
        print(request.json)
        id_ = request.json.get('id')
        name = request.json.get('name')
        alias = request.json.get('alias')
        iframe = request.json.get('iframe', '')
        sensors = request.json.get('sensors', [])
        if re.match('^[a-zA-Z0-9_]{1,200}$', name) is not None:
            pass
        else:
            abort(406)

        field_exist = (g.session
                        .query(db.models.field)
                        .filter(db.models.field.creator_id == session.get("id"))
                        .filter(db.models.field.name == name)
                        .first())

        field_now = (g.session
                     .query(db.models.field)
                     .filter(db.models.field.id == id_)
                     .first())

        if (field_exist is None):
            pass
        elif name == field_now.name:
            pass
        else:
            abort(400)

        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .update({'name': name,
                   'alias': alias,
                   'iframe': iframe}))

        (g.session
          .query(db.models.field_sensor)
          .filter(db.models.field_sensor.field == id_)
          .delete())

        for sensor in sensors:
            new_sensor = db.models.field_sensor(
                field=id_,
                sensor=sensor.get('sensor'),
                df_name=sensor.get('df_name'),
                alias=sensor.get('alias'),
                unit=sensor.get('unit'),
                icon=sensor.get('icon'),
                bg_color=sensor.get('bg_color'))
            new_sensor.field = id_
            new_sensor.id = None
            g.session.add(new_sensor)
        g.session.commit()

        return 'ok'
    elif request.method == 'DELETE':
        # Delete field
        # DELETE /api/field?id=<id>
        id_ = request.args.get('id')

        for attr in db.models.__dict__.values():
            if inspect.isclass(attr) and hasattr(attr, 'timestamp'):
                (g.session
                  .query(attr)
                  .filter(attr.field == id_)
                  .delete())
        (g.session
          .query(db.models.field_sensor)
          .filter(db.models.field_sensor.field == id_)
          .delete())
        (g.session
          .query(db.models.user_access)
          .filter(db.models.user_access.field == id_)
          .delete())
        (g.session
          .query(db.models.field)
          .filter(db.models.field.id == id_)
          .delete())
        g.session.commit()

        return 'ok'

    abort(404)
    