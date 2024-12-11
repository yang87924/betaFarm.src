from flask import g
from custom_modules.main_modules import db

def connect_tiaga(mac):
    g.tiaga_db = db.tiaga_connect(mac)


def disconnect_tiaga():
    tiaga_db = getattr(g, 'tiaga_db', None)
    if tiaga_db is not None:
        tiaga_db.close()