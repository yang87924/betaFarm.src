from flask import Blueprint, request
import os

ipcam_time_lapse = Blueprint('ipcam_time_lapse', __name__)

@ipcam_time_lapse.route('/api/ipcam_time_lapse', methods=['GET'])
def api_ipcam_time_lapse():
    gacp_no = request.args.get('no')
    video_path = './static/photo/ipcam_image/ipcam_time_lapse/'+gacp_no+'.webm'

    if os.path.isfile(video_path):
        return video_path.replace('./', '/')
    else:
        return "data not found", 404