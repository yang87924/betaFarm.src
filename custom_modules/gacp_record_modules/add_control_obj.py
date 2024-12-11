from flask import Blueprint, g, request, jsonify
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check

add_control_obj = Blueprint('add_control_obj', __name__)

@add_control_obj.route('/api/add_control_obj', methods=['POST'])
@required_login
@trace_sys_flag_check
def api_add_control_obj():
    obj_name = request.json.get('obj_name')
    new_control_obj =  db.models.CONTROL_OBJ_LIST(control_obj_name=obj_name)
    
    g.session.add(new_control_obj)
    g.session.commit()
    g.session.flush()
    
    return jsonify({"id":new_control_obj.control_obj_code,"name":new_control_obj.control_obj_name})