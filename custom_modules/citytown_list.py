from flask import Blueprint, jsonify, g
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login

citytown_list = Blueprint('citytown_list', __name__)

@citytown_list.route('/api/citytown', methods=['GET'])
@required_login
def get_citys_and_towns():
    taiwan_city_list = db.models.taiwan_city_list
    taiwan_town_list = db.models.taiwan_town_list
    query = (g.session
             .query(taiwan_city_list, taiwan_town_list)
             .filter(taiwan_city_list.city_id == taiwan_town_list.city_id)
             .order_by(taiwan_town_list.city_id)
             .all())
    data = []
    citys = {}
    town_data = []
    temp_city = ""
    for city, town in query:
        if temp_city != city.city_id:
            town_data = []
        town_data.append(
            {
                "city_name": city.name,
                "town_id": town.town_id,
                "town_name": town.name,
                "postal_code": town.postal_code
            }
        )
        citys.update(
            {
                city.city_id: town_data
            }
        )
        temp_city = city.city_id
    data.append(citys)
    return jsonify(data)