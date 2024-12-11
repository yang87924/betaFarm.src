from custom_modules.main_modules import db
from flask import Blueprint, request, g
import json

old_switch_time = Blueprint('old_switch_time', __name__)

#for old kernel switch controll
@old_switch_time.route('/api/get_switch_time', methods=["GET"])
def get_switch_time():

    receive_field_name = request.args.get("switchreceivefield")
    request_switch = request.args.get("switch")

    if "switch_receive" not in request_switch:
        return "?", 404

    query_field = db.models.field

    field = (g.session.query(query_field)
             .filter(query_field.name == receive_field_name)
             .first())

    query_switch = getattr(db.models, request_switch)
    field_switch_query = g.session.query(
        query_switch).filter(query_switch.field == field.id)

    last_data = (field_switch_query
                 .order_by(query_switch.timestamp.desc())
                 .first())

    before_last_change = (field_switch_query
                          .filter(query_switch.value != last_data.value)
                          .order_by(query_switch.timestamp.desc())
                          .first())

    last_change = (field_switch_query
                   .filter(query_switch.timestamp > before_last_change.timestamp)
                   .order_by(query_switch.timestamp.asc())
                   .first())

    return_data = []
    return_data.append( 
        {
            "datetime": last_change.timestamp.strftime("%Y/%m/%d %H:%M:%S"),
            "value": last_change.value,
            "id": request_switch
        }
    )

    return 'callback('+json.dumps(return_data)+')'