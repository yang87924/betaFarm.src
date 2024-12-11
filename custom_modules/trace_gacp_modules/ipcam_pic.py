from flask import Blueprint, request, abort, g, jsonify
from custom_modules.main_modules import db
from datetime import datetime, timedelta

ipcam_picture = Blueprint('ipcam_picture', __name__)

@ipcam_picture.route('/api/ipcam_picture', methods=['GET'])
def get_ipcam_picture():
    interval = request.args.get('interval')
    gacp_no = request.args.get('no')
    date = request.args.get('start_date')
    gacp_ipcam = g.session.query(db.models.GACP_LIST_LOG).filter(
        db.models.GACP_LIST_LOG.gacp_no == gacp_no).first() or None
    if gacp_ipcam:
        name = gacp_ipcam.ipcam_name
    else:
        abort(404)

    data = []
    if interval == 'day':
        start_date = datetime.strptime(date, "%Y-%m-%d") + timedelta(days=1)
        end_date = datetime.strptime(date, "%Y-%m-%d") + timedelta(days=-9)
        query = (g.session.query(db.models.ipcam_img)
                 .filter(db.models.ipcam_img.name == name)
                 .filter(db.models.ipcam_img.timestamp <= start_date)
                 .filter(db.models.ipcam_img.timestamp > end_date)
                 .limit(20)
                 .all())
        for row in query:
            data.append(
                {
                    "time": row.timestamp.strftime("%Y-%m-%d %H:%M:%S"),
                    "img_path": row.img_path
                }
            )
    elif interval == 'week':
        start_date = datetime.strptime(date, "%Y-%m-%d") + timedelta(days=1)
        end_date = datetime.strptime(date, "%Y-%m-%d") + timedelta(days=-69)
        query = (g.session.query(db.models.ipcam_img)
                 .filter(db.models.ipcam_img.name == name)
                 .filter(db.models.ipcam_img.timestamp <= start_date)
                 .filter(db.models.ipcam_img.timestamp > end_date)
                 .all())
        for row in query[::int(len(query)/20)]:
            data.append(
                {
                    "time": row.timestamp.strftime("%Y-%m-%d %H:%M:%S"),
                    "img_path": row.img_path
                }
            )
    elif interval == 'month':
        start_date = datetime.strptime(date, "%Y-%m-%d") + timedelta(days=1)
        end_date = datetime.strptime(date, "%Y-%m-%d") + timedelta(days=-299)
        query = (g.session.query(db.models.ipcam_img)
                 .filter(db.models.ipcam_img.name == name)
                 .filter(db.models.ipcam_img.timestamp <= start_date)
                 .filter(db.models.ipcam_img.timestamp > end_date)
                 .all())
        for row in query[::int(len(query)/20)]:
            data.append(
                {
                    "time": row.timestamp.strftime("%Y-%m-%d %H:%M:%S"),
                    "img_path": row.img_path
                }
            )
    return jsonify(data)