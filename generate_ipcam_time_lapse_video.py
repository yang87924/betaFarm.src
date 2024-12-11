#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
import sys
import os
from datetime import datetime
import time
from custom_modules.main_modules import db
import cv2
import numpy as np
import config

absolute_path = config.ABSOULTE_PATH
save_folder = absolute_path + '/static/photo/ipcam_image/ipcam_time_lapse/'
def get_gacp_ipcam():
    session = db.get_session()
    gacp_list = db.models.GACP_LIST_LOG
    ipcam_images = db.models.ipcam_img
    ipcam_query = session.query(gacp_list, ipcam_images).filter(gacp_list.ipcam_name == ipcam_images.name).group_by(ipcam_images.name).all()
    session.close()
    ipcams = []
    if ipcam_query is not None:
        for gacp, ipcam in ipcam_query:
            ipcams.append(
                {
                    "gacp_no": gacp.gacp_no,
                    "folder": absolute_path + '/static/photo/ipcam_image/' + ipcam.img_path.split('/')[4]
                }
            )
    
    return ipcams
def generate_video(ipcam):
    gacp_no = ipcam['gacp_no']
    folder = ipcam['folder']
    temp_video_path = save_folder + 'temp_' + ipcam['gacp_no'] + '.webm'
    video_path = save_folder + ipcam['gacp_no'] + '.webm'
    images = [img for img in sorted(os.listdir(folder)) if img.endswith(".jpg") and (os.path.getsize(folder+'/'+img)>0)]
    frame = cv2.imread(os.path.join(folder, images[0]))
    height, width, layers = frame.shape
    video = cv2.VideoWriter(temp_video_path, cv2.VideoWriter_fourcc(*'vp80'), 8, (width,height))
    
    for image in images:
        raw_image = cv2.imread(os.path.join(folder, image))
        try:
            cooked_image = cv2.resize(raw_image, (width, height), interpolation=cv2.INTER_CUBIC)
            video.write(cooked_image)
        except Exception: 
            pass
    cv2.destroyAllWindows()
    video.release()
    if os.path.isfile(video_path):
        os.remove(video_path)
    os.rename(temp_video_path,video_path)

def all_generate():
    ipcams = get_gacp_ipcam()
    if ipcams:
        for ipcam in ipcams:
            generate_video(ipcam)
    else:
        print("no ipcam")
    print("mission complete")

def test():
    test_ipcam = {
        "gacp_no": "test_gacp_no",
        "folder": absolute_path + '/static/photo/ipcam_image/time_lapse_video_test_image/'
    }
    generate_video(test_ipcam)
    
if __name__ == '__main__':
    if len(sys.argv) > 1:
        arg = sys.argv[1]
        if arg == "--test":
            test()
    else:
        all_generate()
