from flask import g, abort, redirect, session, request, render_template as flask_render_template
from functools import wraps
from custom_modules.main_modules import db, utils
import config

def required_login(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if config.ONLY_TRACE_MODE:
            abort(404)
        if session.get('username'):
            if session.get('status') != 1 :
                abort(401)
            return f(*args, **kwargs)
        else:
            next_url = request.path
            return redirect('/login?next=' + next_url)
    return decorated_function

def trace_sys_flag_check(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get('is_superuser') in [4,0]:
            flag = session.get('trace_sys_flag')
            if flag != 1:
                return '404 not found',404
        return f(*args, **kwargs)      
    return decorated_function

def required_superuser(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if config.ONLY_TRACE_MODE:
            abort(404)
        if session.get('username'):
            if session.get('is_superuser') == 1:
                return f(*args, **kwargs)
            else:
                abort(401)
        else:
            next_url = request.path
            return redirect('/login?next=' + next_url)
    return decorated_function

def required_farm_user(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if config.ONLY_TRACE_MODE:
            abort(404)
        if session.get('username'):
            if session.get('is_superuser') in [1,4]:
                return f(*args, **kwargs)
            else:
                abort(401)
        else:
            next_url = request.path
            return redirect('/login?next=' + next_url)
    return decorated_function