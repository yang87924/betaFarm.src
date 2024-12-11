from flask import Blueprint, request, g, jsonify
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_farm_user

gacp_pdf = Blueprint('gacp_pdf', __name__)

@gacp_pdf.route('/api/gacp_pdf_farminfo', methods=['GET'])
@required_farm_user
def gacp_pdf_farminfo():
    gacp_no = request.args.get('gacp_no')
    farm_id = int(gacp_no.split("f")[0])
    field_id = int(gacp_no.split("f")[1].split("t")[0])
    FARM_INFO = db.models.FARM_INFO
    FIELD_INFO = db.models.FIELD_INFO
    taiwan_city_list = db.models.taiwan_city_list
    taiwan_town_list = db.models.taiwan_town_list
    units = db.models.units
    try:
        farm_query = (g.session.query(FARM_INFO, units)
                      .filter(FARM_INFO.farm_id == farm_id)
                      .filter(FARM_INFO.area_unit == units.unit_id)
                      .first())
    except:
        return "farm not found", 404
    field_query = (g.session.query(FIELD_INFO, taiwan_city_list, taiwan_town_list)
                            .filter(FIELD_INFO.farm_id == farm_id)
                            .filter(FIELD_INFO.field_id == field_id)
                            .filter(taiwan_city_list.city_id == FIELD_INFO.city_id)
                            .filter(taiwan_town_list.town_id == FIELD_INFO.town_id)
                            .first())

    return jsonify({
        're_tgap_no': farm_query[0].tgap_no,
        're_farm_name': farm_query[0].farm_name,
        're_farm_user': farm_query[0].farm_user,
        're_tel_no': farm_query[0].tel_no,
        're_farm_addr': farm_query[0].farm_addr,
        're_farm_area': format(farm_query[0].arable_area * float(farm_query[1].standard_zoom), ",.7f").rstrip('0').rstrip('.'),
        're_city': field_query[1].name,
        're_town': field_query[2].name,
        're_cadastral': field_query[0].cadastral,
        're_field_area': format(field_query[0].standard_area, ",.7f").rstrip('0').rstrip('.')
    })