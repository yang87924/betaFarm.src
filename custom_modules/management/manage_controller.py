from flask import Blueprint, g, session, request, jsonify
from custom_modules.main_modules import db, utils
from custom_modules.main_modules.connect_tiaga import connect_tiaga, disconnect_tiaga
from custom_modules.main_modules.decorators import required_login, required_farm_user
import config
import requests

manage_controller = Blueprint('manage_controller', __name__)

@manage_controller.route('/api/controller', methods=['GET', 'POST', 'PUT', 'DELETE'])
@required_farm_user
def api_query_controller():
    is_superuser = session.get('is_superuser')
    controller_list = db.models.controller_list
    controller_access = db.models.controller_access
    if request.method == 'GET':
        query = g.session.query(controller_list)
        access_query = g.session.query(controller_access).all()
        users = {access.controller_id: access.user_id for access in access_query}
        users = {}
        controllers = []
        for access in access_query:
            if access.controller_id not in users:
                users.update({access.controller_id: []})
            users[access.controller_id].append(access.user_id)

        if is_superuser != 1:
            query = query.filter(
                controller_list.creator_id == session.get('id'))

        query = query.all()

        for controller in query:
            row = utils.row2dict(controller)
            if controller.controller_id in users:
                row.update({"users": users[controller.controller_id]})
            else:
                row.update({"users": []})
            controllers.append(row)

        return jsonify(controllers)
    elif request.method == 'POST':
        name = request.json.get('controller_name')
        alias = request.json.get('controller_alias')
        mac = request.json.get('host_mac')
        users = request.json.get('users')

        if mac not in config.TIAGA_MODULE_MAC_LIST:
            return "MAC not found", 404
        try:
            new_controller = controller_list(
                controller_name=name,
                controller_alias=alias,
                host_mac=mac,
                creator_id=session.get("id")
            )
        except:
            return "ID is duplicated", 405
        g.session.add(new_controller)
        g.session.commit()
        g.session.flush()

        for user in users:
            if g.session.query(controller_access).filter(controller_access.controller_id == new_controller.controller_id).filter(controller_access.user_id == user).first() is None:
                new_controller_access = controller_access(
                    user_id=user,
                    controller_id=new_controller.controller_id
                )
                g.session.add(new_controller_access)
        g.session.commit()

        connect_tiaga(mac)

        farm_module = db.tiaga_modules.FarmModuleTable
        M3_query = g.tiaga_db.query(farm_module).filter(
            farm_module.ModuleName == "M21").first()

        if M3_query is None:
            return "Automation Control Subsystem not found", 404

        FarmID = M3_query.FarmID
        FieldID = M3_query.FieldID
        ApplicationID = M3_query.ApplicationID
        ModuleID = M3_query.ModuleID

        ralay_table = db.tiaga_modules.RelayTable
        relay_query = g.tiaga_db.query(ralay_table.PinNo).filter(
            ralay_table.MACAddr == mac).all()

        m3_pin_list = [m3_pin.PinNo for m3_pin in relay_query]

        for PinNo in range(12, 13):  # from 1 ~ 16 because m3 have 16 pin relay
            if PinNo not in m3_pin_list:
                g.tiaga_db.add(
                    db.tiaga_modules.RelayTable(
                        FarmID=FarmID,
                        FieldID=FieldID,
                        ApplicationID=ApplicationID,
                        ModuleName="M21",
                        MACAddr=mac,
                        ModuleID=ModuleID,
                        PinNo=PinNo,
                        RelayType=0,
                        RelayMemo="Relay"+str(PinNo),
                        LastStatus=0
                    )
                )

        g.tiaga_db.commit()
        disconnect_tiaga()

    elif request.method == 'PUT':
        controller_id = request.json.get('controller_id')
        name = request.json.get('controller_name')
        alias = request.json.get('controller_alias')
        mac = request.json.get('host_mac')
        users = request.json.get('users')

        if mac not in config.TIAGA_MODULE_MAC_LIST:
            return "MAC not found", 404

        update_controller = g.session.query(controller_list).filter(
            controller_list.controller_id == controller_id)

        if session.get('is_superuser') != 1:
            update_controller = update_controller.filter(
                controller_list.creator_id == session.get('id'))
        try:
            update_controller.update(
                {
                    "controller_name": name,
                    "controller_alias": alias,
                    "host_mac": mac
                }
            )
        except:
            return "ID is duplicated", 400

        g.session.query(controller_access).filter(
            controller_access.controller_id == controller_id).delete()
        g.session.commit()
        g.session.flush()

        for user in users:
            if g.session.query(controller_access).filter(controller_access.controller_id == controller_id).filter(controller_access.user_id == user).first() is None:
                new_controller_access = controller_access(
                    user_id=user,
                    controller_id=controller_id
                )
                g.session.add(new_controller_access)
        g.session.commit()

    elif request.method == 'DELETE':
        controller_id = request.args.get('id')
        delete_controller = g.session.query(controller_list).filter(
            controller_list.controller_id == controller_id)
        if session.get('is_superuser') != 1:
            delete_controller = delete_controller.filter(
                controller_list.creator_id == session.get('id'))

        if delete_controller.first() is not None:
            g.session.query(controller_access).filter(
                controller_access.controller_id == controller_id).delete()

        delete_controller.delete()
        g.session.commit()

    return 'ok'

@manage_controller.route('/api/relay_management', methods=['GET', 'PUT'])
@required_farm_user
def api_relay_management():
    if request.method == 'GET':
        mac = request.args.get("mac")

        connect_tiaga(mac)

        relay_table = db.tiaga_modules.RelayTable
        relay_query = g.tiaga_db.query(relay_table).filter(
            relay_table.MACAddr == mac).order_by(relay_table.PinNo).all()

        relay_list = []

        for relay in relay_query:
            relay_list.append(
                {
                    "RelayItemID": relay.RelayItemID,
                    "PinNo": relay.PinNo,
                    "RelayType": relay.RelayType,
                    "RelayMemo": relay.RelayMemo,
                }
            )

        disconnect_tiaga()
        return jsonify(relay_list)
    if request.method == 'PUT':
        mac = request.json.get('mac')
        relay_list = request.json.get('relay')

        connect_tiaga(mac)

        relay_table = db.tiaga_modules.RelayTable

        for relay in relay_list:
            (g.tiaga_db
              .query(relay_table)
              .filter(relay_table.MACAddr == mac)
              .filter(relay_table.PinNo == relay['PinNo'])
              .update(relay)
             )

        g.tiaga_db.commit()
        disconnect_tiaga()

        return "ok"

    return "don't cheat", 405

@manage_controller.route('/api/connect_controller', methods=['GET'])
@required_login
def connect_controller():
    if request.method == 'GET':
        mac = request.args.get('mac')

        connect_tiaga(mac)

        RelayTable = db.tiaga_modules.RelayTable
        relay_list = g.tiaga_db.query(RelayTable).filter(
            RelayTable.MACAddr == mac).order_by(RelayTable.PinNo.asc()).all()

        RelayScheduleTable = db.tiaga_modules.RelayScheduleTable
        schedule_list = g.tiaga_db.query(RelayScheduleTable).filter(RelayScheduleTable.MACAddr == mac).filter(
            RelayScheduleTable.TimerSet != 0).order_by(RelayScheduleTable.PinNo.asc(), RelayScheduleTable.OnTime.asc()).all()

        disconnect_tiaga()

        relay_icon = db.models.relay_icons
        icon_list = {
            icon.relay_type: icon.icon_path for icon in g.session.query(relay_icon).all()}

        relay_infos = []
        all_schedule = {}
        pin_schedule = []

        for schedule in schedule_list:
            if schedule.PinNo not in all_schedule:
                all_schedule.update(
                    {
                        schedule.PinNo: []
                    }
                )

            all_schedule[schedule.PinNo].append(
                {"OnTime": str(schedule.OnTime), "OffTime": str(schedule.OffTime)})

        for relay in relay_list:
            check_status = ""
            temp_schedule = []

            if relay.LastStatus == "1":
                check_status = "checked"
            if relay.PinNo in all_schedule:
                temp_schedule = all_schedule[relay.PinNo]

            relay_infos.append(
                {
                    "relay_alias": relay.RelayMemo,
                    "check_status": check_status,
                    "pin_no": relay.PinNo,
                    "icon_path": icon_list[relay.RelayType],
                    "last_time": relay.TimeStamp.strftime("%Y-%m-%d %H:%M:%S"),
                    "schedule": temp_schedule
                }
            )
        return jsonify(relay_infos)

@manage_controller.route('/api/relay_status', methods=['GET', 'PUT'])
@required_login
def put_relay_status():
    if request.method == 'GET':
        mac = request.args.get('mac')
        PinNo = request.args.get('PinNo') or None
        allquest = request.args.get('all') or None

        connect_tiaga(mac)
        RelayTable = db.tiaga_modules.RelayTable

        if allquest is None:
            relay = g.tiaga_db.query(RelayTable).filter(
                RelayTable.MACAddr == mac).filter(RelayTable.PinNo == PinNo).first()
            disconnect_tiaga()
            return jsonify({"status": relay.LastStatus, "time": relay.TimeStamp.strftime("%Y-%m-%d %H:%M:%S")})
        else:
            relay_status = []
            relay_list = g.tiaga_db.query(RelayTable).filter(
                RelayTable.MACAddr == mac).all()
            disconnect_tiaga()
            for relay in relay_list:
                relay_status.append(
                    {
                        relay.PinNo: {
                            "status": relay.LastStatus,
                            "time": relay.TimeStamp.strftime("%Y-%m-%d %H:%M:%S")
                        }
                    }
                )
            return jsonify(relay_status)

    elif request.method == 'PUT':
        mac = request.json.get("mac")
        PinNo = request.json.get("PinNo")
        status = request.json.get("status")
        url = 'http://'+config.TIAGA_HOST+"/"+mac+"/"+"M21"+PinNo
        header = {'Content-type': 'application/json; charset=utf-8',
                  'Connection': 'close'}
        r = requests.put(url, json={"data": [status]}, headers=header)
        r.connection.close()

        connect_tiaga(mac)

        RelayTable = db.tiaga_modules.RelayTable
        (g.tiaga_db.query(RelayTable)
                   .filter(RelayTable.MACAddr == mac)
                   .filter(RelayTable.PinNo == PinNo)
                   .update(
                       {
                           "LastStatus": status
                       }
        ))
        g.tiaga_db.commit()

        disconnect_tiaga()

        return jsonify(r.request.headers.__dict__['_store']), 200

@manage_controller.route('/api/timer_management', methods=['POST', 'DELETE'])
@required_login
def timer_management():
    mac = request.json.get("mac")
    pin = request.json.get("PinNo")
    start = request.json.get("start")

    connect_tiaga(mac)

    RelayScheduleTable = db.tiaga_modules.RelayScheduleTable
    RelayTable = db.tiaga_modules.RelayTable

    if request.method == 'POST':
        end = request.json.get("end")
        target_schedule = g.tiaga_db.query(RelayScheduleTable).filter(RelayScheduleTable.MACAddr == mac).filter(
            RelayScheduleTable.PinNo == pin).filter(RelayScheduleTable.OnTime == start)
        target = target_schedule.first()

        if target is not None:
            target_schedule.update(
                {
                    "OffTime": end
                }
            )
        else:
            relay = g.tiaga_db.query(RelayTable).filter(
                RelayTable.MACAddr == mac).filter(RelayTable.PinNo == pin).first()

            g.tiaga_db.add(
                db.tiaga_modules.RelayScheduleTable(
                    FarmID=relay.FarmID,
                    FieldID=relay.FieldID,
                    ApplicationID=relay.ApplicationID,
                    ModuleName=relay.ModuleName,
                    MACAddr=relay.MACAddr,
                    ModuleID=relay.ModuleID,
                    PinNo=relay.PinNo,
                    RelayType=relay.RelayType,
                    RelayMemo=relay.RelayMemo,
                    TimerSet=1,
                    OnTime=start,
                    OffTime=end
                )
            )
        g.tiaga_db.commit()
        g.tiaga_db.flush()

    elif request.method == 'DELETE':
        (g.tiaga_db.query(RelayScheduleTable)
                   .filter(RelayScheduleTable.MACAddr == mac)
                   .filter(RelayScheduleTable.PinNo == pin)
                   .filter(RelayScheduleTable.OnTime == start)
                   .delete())
        g.tiaga_db.commit()
        g.tiaga_db.flush()

    else:
        return "?", 405

    temp_schedule = []

    schedule_list = (g.tiaga_db.query(RelayScheduleTable.OnTime, RelayScheduleTable.OffTime)
                     .filter(RelayScheduleTable.MACAddr == mac)
                     .filter(RelayScheduleTable.PinNo == pin)
                     .order_by(RelayScheduleTable.PinNo.asc(), RelayScheduleTable.OnTime.asc())
                     .all())

    for OnTime, OffTime in schedule_list:
        temp_schedule.append(
            {
                "OnTime": str(OnTime),
                "OffTime": str(OffTime)
            }
        )

    disconnect_tiaga()
    # return newest schedule list to frontend
    return jsonify({pin: temp_schedule})

@manage_controller.route('/api/relay_icon_list', methods=['GET'])
@required_farm_user
def api_relay_icon_list():
    if request.method == 'GET':
        icon_query = g.session.query(db.models.relay_icons).all()
        return jsonify([utils.row2dict(row) for row in icon_query])
