from flask import Blueprint, g, session, request, jsonify
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check

add_seed = Blueprint('add_seed', __name__)

@add_seed.route('/api/add_seed', methods=['POST'])
@required_login
@trace_sys_flag_check
def api_add_seed():
    cultivar_id = request.json.get('cultivar_id')
    seed_name = request.json.get('seed_name')
    new_seed =  db.models.ITEMS(
        item_name=seed_name,
        type_code=1,
        cultivar_id=cultivar_id,
        sup_id=1,
        update_user=session.get('username')
    )
    
    g.session.add(new_seed)
    g.session.commit()
    g.session.flush()
    
    return jsonify({"id":new_seed.item_no,"name":new_seed.item_name})

@add_seed.route('/api/get_cultivar', methods=['GET'])
@required_login
@trace_sys_flag_check
def api_get_cultivar():
    cultivar_query = g.session.query(db.models.CULTIVAR_LIST).all()
    cultivar_list = []
    for row in cultivar_query:
        cultivar_list.append(
            {
                "id":row.cultivar_code,
                "name":row.cultivar_name
            }
        )
    return jsonify(cultivar_list)
