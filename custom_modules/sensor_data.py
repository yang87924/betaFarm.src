from flask import Blueprint, request, jsonify, abort, g, session
from datetime import datetime, date, timedelta
from dateutil import parser
from custom_modules.main_modules.connect_tiaga import connect_tiaga, disconnect_tiaga
from custom_modules.main_modules.decorators import required_login
from custom_modules.main_modules import db
from sqlalchemy import text, Date, func
import config

sensor_data = Blueprint('sensor_data', __name__)

@sensor_data.route('/datas/<string:field>', methods=['GET'])
def api_query_all_data(field):

    stime = datetime.now()

    res = {}

    start = request.args.get('start')
    end = request.args.get('end')
    limit = int(request.args.get('limit', config.QUERY_LIMIT))

    if start and end:
        start = parser.parse(start)
        end = parser.parse(end)

    is_tiaga_module = '_tiaga_' in field

    if is_tiaga_module and (field.split('_tiaga_')[1] in config.TIAGA_MODULE_MAC_LIST):
        # field.split('_tiaga_')[1] is TIAGA_MODULE_MAC at here
        module = field.split('_tiaga_')[0]
        mac = field.split('_tiaga_')[1]

        if module in config.TIAGA_MODULE_LIST:

            connect_tiaga(mac)

            for col in config.TIAGA_MODULE_LIST[module]:
                table = getattr(db.tiaga_modules, col)
                query = g.tiaga_db.query(table)

                if start and end:
                    query = query.filter(
                        table.timestamp >= start, table.timestamp <= end)

                query = query.order_by(
                    table.timestamp.desc()).limit(limit).all()
                res.update(
                    {col: [(str(record.timestamp), record.value) for record in query]})

            disconnect_tiaga()

            return jsonify(res)

        else:
            return "field name invalid.", 404
    else:
        query_df = (g.session
                    .query(db.models.field_sensor.df_name,
                           db.models.field_sensor.field)
                    .select_from(db.models.field_sensor)
                    .join(db.models.sensor)
                    .join(db.models.field)
                    .filter(db.models.field.name == field)
                    .all())

        datetime_now = datetime.now()

        for df_name, field_id in query_df:
            tablename = df_name.replace('-O', '')
            table = getattr(db.models, tablename)
            exception_list = ['Bug', 'RainMeter']
            if all(exception_sensor not in tablename for exception_sensor in exception_list):
                query = g.session.query(table).filter(table.field == field_id)
                if start and end:
                    query = query.filter(
                        table.timestamp >= start, table.timestamp <= end)
                query = query.order_by(
                    table.timestamp.desc()).limit(limit).all()

                res.update(
                    {df_name: [(str(record.timestamp), record.value) for record in query]})
            elif 'Bug' in tablename:
                query = g.session.query(table).group_by(table.value).having(
                    func.count(table.value) > 0).filter(table.field == field_id)
                if start and end:
                    query = query.filter(
                        table.timestamp >= start, table.timestamp <= end)
                    query = query.order_by(table.timestamp.desc()).all()
                else:
                    query = query.filter(
                        table.timestamp >= datetime_now+timedelta(days=-1), table.timestamp <= datetime_now)
                    query = query.order_by(table.timestamp.desc()).all()
                q_len = len(query)
                res.update({df_name: [(str(datetime_now), q_len-idx-1)
                                      for idx, record in enumerate(query)]})
            elif 'RainMeter' in tablename:
                query = g.session.query(table).filter(table.field == field_id)
                if start and end:
                    query = query.filter(
                        table.timestamp >= start, table.timestamp <= end)
                    query = query.order_by(
                        table.timestamp.desc()).limit(limit).all()
                else:
                    query = query.filter(
                        table.timestamp >= date.today(), table.timestamp <= datetime_now)
                    reset_value = query.order_by(table.timestamp.asc()).first()
                    query = query.order_by(
                        table.timestamp.desc()).limit(limit).all()
                res.update({df_name: [(str(record.timestamp), round(
                    (record.value-reset_value.value)*0.2, 1)) for record in query]})

        etime = datetime.now()
        print((etime - stime).total_seconds())
        return jsonify(res)


@sensor_data.route('/datas/<string:field>/<string:df_name>', methods=['GET'])
@required_login
def api_query_field_data(field, df_name):
    stime = datetime.now()

    is_tiaga_module = '_tiaga_' in field

    start = request.args.get('start')
    end = request.args.get('end')
    limit = int(request.args.get('limit', config.QUERY_LIMIT))

    if start and end:
        start = parser.parse(start)
        end = parser.parse(end)

    if is_tiaga_module and (field.split('_tiaga_')[1] in config.TIAGA_MODULE_MAC_LIST):
        mac = field.split('_tiaga_')[1]
        connect_tiaga(mac)

        table = getattr(db.tiaga_modules, df_name)
        query = g.tiaga_db.query(table)

        if start and end:
            query = query.filter(table.timestamp >= start,
                                 table.timestamp <= end)
        query = query.order_by(table.timestamp.desc()).limit(limit).all()

        disconnect_tiaga()

        res = {df_name: [(str(record.timestamp), record.value)
                         for record in query]}
    else:
        tablename = df_name.replace('-O', '')
        if not hasattr(db.models, tablename):
            abort(404)
        table = getattr(db.models, tablename)
        exception_list = ['Bug', 'RainMeter']
        if all(exception_sensor not in tablename for exception_sensor in exception_list):
            query = (g.session
                     .query(table)
                     .select_from(table)
                     .join(db.models.field)
                     .filter(db.models.field.name == field))
            if start and end:
                query = query.filter(
                    table.timestamp >= start, table.timestamp <= end)
            query = query.order_by(table.timestamp.desc()).limit(limit).all()

            res = {df_name: [(str(record.timestamp), record.value)
                             for record in query]}

            return jsonify(res)
        elif 'Bug' in tablename:
            query = (g.session
                     .query(table)
                     .group_by(table.value)
                     .join(db.models.field)
                     .filter(db.models.field.name == field)
                     .having(func.count(table.value) > 0))
            if start and end:
                query = query.filter(
                    table.timestamp >= start, table.timestamp <= end)
            query = query.order_by(table.timestamp.desc()).limit(limit).all()
            q_len = len(query)
            # q_len - idx - 1 will like n,n-1...,2,1,0
            res = {df_name: [(str(record.timestamp), q_len-idx-1)
                             for idx, record in enumerate(query)]}
        elif 'RainMeter' in tablename:
            query = (g.session
                     .query(table)
                     .select_from(table)
                     .join(db.models.field)
                     .filter(db.models.field.name == field))
            if start and end:
                query = query.filter(
                    table.timestamp >= start, table.timestamp <= end)
            query = query.order_by(table.timestamp.desc()).limit(limit).all()

            res = {df_name: [(str(record.timestamp), round(
                record.value*0.2, 1)) for record in query]}

    return jsonify(res)


@sensor_data.route('/api/datas', methods=['GET'])
def api_query_datas():
    if session.get("username") and request.args.get('f1'):
        '''
        :args f1: field, like `bao2`, `bao3`, etc
        :args f2: field, like `bao2`, `bao3`, etc
        :args s1: sensor, like `AtPressure`, `UV1`, etc
        :args s2: sensor, like `AtPressure`, `UV1`, etc
        :args st: start_time, any time format
        :args et: end_time, any time format
        :args i: interval, only allow `second`, `minute`, `hour`, `day`, default `hour`
        :args l: limit, query limit, default config.QUERY_LIMIT

        example:
            http://farm.iottalk.tw:5000/api/datas?f1=bao2&f2=bao3&s=Temperature&st=2018-06-26&et=2018-06-27&i=second
        '''
        stime = datetime.now()

        field1 = request.args.get('f1')
        sensor1 = request.args.get('s1')
        start_time = request.args.get('st')
        end_time = request.args.get('et')
        interval = request.args.get('i', 'hour')
        limit = int(request.args.get('l')) if request.args.get('l') else None
        exception_list = ['RainMeter']
        exception = None
        start = parser.parse(start_time).strftime('%Y-%m-%d %H:%M:%S')
        #end = parser.parse(end_time).strftime('%Y-%m-%d %H:%M:%S')
        end = (parser.parse(end_time) + timedelta(days=1)
               ).strftime('%Y-%m-%d %H:%M:%S')

        if not field1 or not sensor1 or not start_time or not end_time:
            abort(404)

        field1_is_tiaga_module = '_tiaga_' in field1

        if field1_is_tiaga_module and (field1.split('_tiaga_')[1] in config.TIAGA_MODULE_MAC_LIST):
            mac = field1.split('_tiaga_')[1]
            datas = compare_query(mac, sensor1, interval, start, end, limit)
            result = {sensor1: {}}
            result[sensor1].update({field1: datas})
        else:
            tablename1 = sensor1.replace('-O', '')
            if not hasattr(db.models, tablename1):
                abort(404)

            for e in exception_list:
                if e in tablename1:
                    exception = e

            table1 = getattr(db.models, tablename1)

            result = {sensor1: {}}
            raw_sql1 = get_mysql_raw_sql(
                interval, table1.__tablename__, field1, start, end, limit)
            result[sensor1].update({field1: query_data(raw_sql1, exception)})

        field2 = request.args.get('f2')
        if field2:
            sensor2 = request.args.get('s2')
            field2_is_tiaga_module = '_tiaga_' in field2

            if field2_is_tiaga_module and (field2.split('_tiaga_')[1] in config.TIAGA_MODULE_MAC_LIST):
                mac = field2.split('_tiaga_')[1]
                datas = compare_query(
                    mac, sensor2, interval, start, end, limit)
                result.update({sensor2: {}})
                result[sensor2].update({field2: datas})
            else:
                tablename2 = sensor2.replace('-O', '')

                for e in exception_list:
                    if e in tablename2:
                        exception = e

                table2 = getattr(db.models, tablename2)
                if not result.get(sensor2):
                    result[sensor2] = {}
                raw_sql2 = get_mysql_raw_sql(
                    interval, table2.__tablename__, field2, start, end, limit)
                result[sensor2].update(
                    {field2: query_data(raw_sql2, exception)})

        etime = datetime.now()
        print((etime - stime).total_seconds())
        return jsonify(result)
    else:
        field1_id = request.args.get('field')
        sensor1 = request.args.get('search_target')
        start_time = request.args.get('start_date')
        end_time = request.args.get('end_date')
        interval = request.args.get('data_interval', 'hour')
        limit = int(request.args.get('l')) if request.args.get('l') else None
        exception_list = ['RainMeter']
        exception = None

        field = (g.session
                  .query(db.models.field)
                  .filter(db.models.field.id == field1_id)
                  .first())

        field_name = field.name
        is_tiaga_module = '_tiaga_' in field_name
        if is_tiaga_module and (field_name.split('_tiaga_')[1] in config.TIAGA_MODULE_MAC_LIST):
            mac = field_name.split('_tiaga_')[1]
            return jsonify(compare_query(mac, sensor1, interval, start_time, end_time, limit))

        if not field1_id or not sensor1 or not start_time or not end_time:
            abort(404)

        tablename1 = sensor1.replace('-O', '')
        if not hasattr(db.models, tablename1):
            abort(404)

        for e in exception_list:
            if e in tablename1:
                exception = e

        table1 = getattr(db.models, tablename1)

        raw_sql1 = get_mysql_raw_sql(
            interval, table1.__tablename__, field.name, start_time, end_time, limit)

        return jsonify(query_data(raw_sql1, exception))


def compare_query(mac, table_name, interval, start, end, limit):
    connect_tiaga(mac)

    table = getattr(db.tiaga_modules, table_name)

    datas = []
    if interval == "day":
        query = (g.tiaga_db.query(func.date(table.timestamp), func.avg(table.value))
                           .filter(table.timestamp >= start)
                           .filter(table.timestamp <= end)
                           .group_by(func.date(table.timestamp))
                           .order_by(func.date(table.timestamp).desc()))
        datas = [{"date": date.strftime("%Y-%m-%d"), "value": avg}
                 for date, avg in query]

    elif interval == "hour":
        query = (g.tiaga_db.query(func.hour(table.timestamp), func.date(table.timestamp), func.avg(table.value))
                           .filter(table.timestamp >= start)
                           .filter(table.timestamp <= end)
                           .group_by(func.hour(table.timestamp), func.date(table.timestamp))
                           .order_by(func.date(table.timestamp).desc(), func.hour(table.timestamp).desc()))
        datas = [{"date": date.strftime(
            "%Y-%m-%d"), "hour": hour, "value": avg} for hour, date, avg in query]

    elif interval == "minute":
        query = (g.tiaga_db.query(func.minute(table.timestamp), func.hour(table.timestamp), func.date(table.timestamp), func.avg(table.value))
                           .filter(table.timestamp >= start)
                           .filter(table.timestamp <= end)
                           .group_by(func.minute(table.timestamp), func.hour(table.timestamp), func.date(table.timestamp))
                           .order_by(func.date(table.timestamp).desc(), func.hour(table.timestamp).desc(), func.minute(table.timestamp).desc()))
        datas = [{"date": date.strftime(
            "%Y-%m-%d"), "hour": hour, "minute": minute, "value": avg} for minute, hour, date, avg in query]

    elif interval == "second":
        query = (g.tiaga_db.query(table.timestamp, table.value)
                           .filter(table.timestamp >= start)
                           .filter(table.timestamp <= end)
                           .group_by(table.timestamp)
                           .order_by(table.timestamp.desc()))
        datas = [{"timestamp": date.strftime(
            "%Y-%m-%d"), "value": val} for date, val in query]

    else:
        return "invalid", 400

    return datas
    disconnect_tiaga()


def query_data(raw_sql, exception=None):
    query = g.session.execute(raw_sql).fetchall()

    datas = []
    check_date = date.today()
    offset_value = 0
    same_day_flag = False
    if exception is None:
        for row in query:
            data = {}
            for key in row.keys():
                data[key] = str(row[key])
            datas.append(data)
    elif exception == 'RainMeter':
        if query:
            if check_date == query[0]['date']:
                same_day_flag = True
            offset_value = query[0]['value']
        for row in query:
            data = {}
            if not same_day_flag:
                for key in row.keys():
                    if key != 'value':
                        data[key] = str(row[key])
                    elif key == 'value':
                        data[key] = str(round((row[key]-offset_value)*0.2, 2))
            else:
                for key in row.keys():
                    if key != 'value':
                        data[key] = str(row[key])
                    elif key == 'value':
                        data[key] = str(round((row[key])*0.2, 2))

            datas.append(data)

    return datas


def get_mysql_raw_sql(interval, table_name, field, start, end, limit):
    if interval == 'second':
        raw_sql = text('''
            SELECT sensor.timestamp, sensor.value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            ORDER BY sensor.timestamp DESC
        '''.format(table_name, field, start, end, limit))
    elif interval == 'minute':
        raw_sql = text('''
            SELECT MINUTE(sensor.timestamp) as minute,
                   HOUR(sensor.timestamp) AS hour,
                   DATE(sensor.timestamp) AS date,
                   AVG(sensor.value) AS value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            GROUP BY minute, hour, date
            ORDER BY date DESC, hour DESC, minute DESC
        '''.format(table_name, field, start, end, limit))
    elif interval == 'hour':
        raw_sql = text('''
            SELECT HOUR(sensor.timestamp) AS hour,
                   DATE(sensor.timestamp) AS date,
                   AVG(sensor.value) AS value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            GROUP BY hour, date
            ORDER BY date DESC, hour DESC
        '''.format(table_name, field, start, end, limit))
    elif interval == 'day':
        raw_sql = text('''
            SELECT DATE(sensor.timestamp) AS date,
                   AVG(sensor.value) AS value
            FROM {} as sensor
            LEFT JOIN field on field.id = sensor.field
            WHERE field.name = '{}' and
                  sensor.timestamp >= '{}' and
                  sensor.timestamp <= '{}'
            GROUP BY date
            ORDER BY date DESC
        '''.format(table_name, field, start, end, limit))
    else:
        abort(404)

    if limit:
        raw_sql += 'LIMIT {}'.format(limit)

    return raw_sql