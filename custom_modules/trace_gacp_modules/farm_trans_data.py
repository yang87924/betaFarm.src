from flask import Blueprint, request, jsonify
import requests

farm_trans_data = Blueprint('farm_trans_data', __name__)

@farm_trans_data.route('/api/farm_trans_data', methods=['GET'])
def get_farm_trans_data():
    crop = request.args.get('crop')
    startdate = request.args.get('startdate')
    enddate = request.args.get('enddate')
    market = request.args.get('market')
    params = {'top': 1000, 'Crop': crop, 'StartDate': startdate, 'EndDate': enddate, 'Market': market}
    url = "https://data.coa.gov.tw/Service/OpenData/FromM/FarmTransData.aspx"
    response = requests.get(url,params=params)
    return jsonify(response.json())