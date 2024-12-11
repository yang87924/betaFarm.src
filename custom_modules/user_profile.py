from flask import Blueprint, abort, g, session, request, jsonify, redirect
from custom_modules.main_modules.decorators import required_login, required_farm_user
from custom_modules.main_modules import db, utils

user_profile = Blueprint('user_profile', __name__)


@user_profile.route('/api/userprofile', methods=['GET'])
@required_login
def userprofile_api():
    if request.method != 'GET':
        abort(405)

    user_id = session.get('id')

    if session.get('is_superuser') == 1:
        return "ok"

    elif session.get('is_superuser') == 4:
        farm_user = (g.session
                     .query(db.models.FARM_INFO)
                     .filter(db.models.FARM_INFO.farm_id == user_id)
                     .first())

        farm_intro = (g.session
                       .query(db.models.FARM_INFO)
                       .filter(db.models.FARM_INFO.farm_id == user_id)
                       .first())

        unit = (g.session
                .query(db.models.units)
                .filter(db.models.units.unit_id == farm_user.area_unit)
                .first())

        file_name = str(user_id)+"_intro.txt"
        intro_path = "./static/farm_introduction/"+file_name
        try:
            intro = open(intro_path, mode="r+", encoding='utf-8')
            with intro:
                intro_out = intro.read().replace('\n', '').replace('\'', '\\\'').replace(
                    '<p><audio style="display: none;" controls="controls"></audio></p>', '')
            intro.close()
        except:
            intro_out = ""

        user = utils.row2dict(farm_user)

        user["intro"] = intro_out
        user["unit_name"] = unit.name
        return jsonify(user)

    abort(404)

@user_profile.route('/api/farmintro', methods=['POST'])
@required_farm_user
def farm_introduction():
    farm_id = request.form.get('farm_id')
    farm_intro = request.form.get('farm_intro')

    if farm_intro is None:
        abort(405)

    file_name = str(farm_id)+"_intro.txt"
    intro_path = "./static/farm_introduction/"+file_name
    intro = open(intro_path, mode="w", encoding='utf-8')
    print(farm_intro, file=intro)
    intro.close()

    (g.session
      .query(db.models.FARM_INFO)
      .filter(db.models.FARM_INFO.farm_id == farm_id)
      .update({"farm_introduction": intro_path}))
    g.session.commit()

    return redirect('/userprofile')
