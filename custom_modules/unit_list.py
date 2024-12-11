from flask import Blueprint, jsonify, g
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login

unit_list = Blueprint('unit_list', __name__)

@unit_list.route('/api/units', methods=['GET'])
@required_login
def get_units():
    unit_query = (g.session
                  .query(db.models.units)
                  .all())
    data = {}
    for index, unit in enumerate(unit_query):
        data.update(
            {
                index: {
                    "unit_id": unit.unit_id,
                    "name": unit.name,
                    "type_id": unit.type_id
                }
            }
        )
    return jsonify(data)