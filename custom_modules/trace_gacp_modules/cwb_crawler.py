from flask import Blueprint, request, jsonify, abort
from bs4 import BeautifulSoup
from calendar import monthrange

import time
import requests

cwb_crawler = Blueprint('cwb_crawler', __name__)

@cwb_crawler.route('/api/cwb_crawler', methods=['GET'])
def api_cwb_crawler():
    interval = request.args.get('interval')
    station = request.args.get('station')
    datepicker = request.args.get('datepicker')
    params = {'command':'viewMain','station':station,'stname':'%e4%bd%94%e4%bd%8d','datepicker':datepicker}
    if interval == "day":
        url = "http://e-service.cwb.gov.tw/HistoryDataQuery/DayDataController.do"
        target = requests.get(url,params=params)
        soup = BeautifulSoup(target.text, 'lxml')
        location = soup.find_all('option', selected=True)
        test = soup.select("#MyTable tr")
        useful_data_dict = {0:"hour",3:"temp",5:"humidity",6:"wind",10:"rain"}
        res_datas = []
        result = []
        if len(test) < 10:
            abort(404)
        else:
            res_datas.append({"location":str(location[0]).split('_')[2].replace("</option>","")})
        for day in range(3,27): #0 to 24 hour
            datas = {}
            for idx,data in enumerate(test[day].find_all("td")):
                if useful_data_dict.__contains__(idx):
                    datas[useful_data_dict[idx]] = str(data).replace('\u00A0','').replace("<td>","").replace("</td>","").replace('<td nowrap=\"\">','')
            res_datas.append({"time":datas.pop("hour")+":00","datas":datas})
    elif interval == "month":
        url = "http://e-service.cwb.gov.tw/HistoryDataQuery/MonthDataController.do"
        target = requests.get(url,params=params)
        soup = BeautifulSoup(target.text, 'lxml')
        location = soup.find_all('option', selected=True)
        test = soup.select("#MyTable tr")
        useful_data_dict = {0:"day",7:"avg_temp",8:"high_temp",10:"low_temp",13:"humidity",16:"wind",21:"rain"}
        res_datas = []
        result = []
        month_day = datepicker.split('-')
        max_day = monthrange(int(month_day[0]),int(month_day[1]))
        if len(test) < 10:
            abort(404)
        else:
            res_datas.append({"location":str(location[0]).split('_')[2].replace("</option>","")})
        for day in range(3,max_day[1]+3):
            datas = {}
            for idx,data in enumerate(test[day].find_all("td")):
                if useful_data_dict.__contains__(idx):
                    datas[useful_data_dict[idx]] = str(data).replace('\u00A0','').replace("<td>","").replace("</td>","").replace('<td nowrap=\"\">','')
            res_datas.append({"time":params['datepicker']+'-'+datas.pop("day"),"datas":datas})
    else:
        abort(404)
        
    return jsonify(res_datas),200