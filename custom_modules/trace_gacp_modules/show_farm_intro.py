from flask import Blueprint, abort, g, request
from custom_modules.main_modules.custom_render_templates import flask_render_template
from custom_modules.main_modules import db

show_farm_intro = Blueprint('show_farm_intro', __name__)

@show_farm_intro.route('/trace/farmintro', methods=['GET'])
def trace_farm_intro():
    farm_id = request.args.get("no")
    if not farm_id:
        abort(404)
    FARM_INFO = (g.session
                  .query(db.models.FARM_INFO)
                  .filter(db.models.FARM_INFO.farm_id == int(farm_id))
                  .first())
    file_name = str(farm_id)+"_intro.txt"
    intro_path = "./static/farm_introduction/"+file_name
    try:
        intro = open(intro_path, mode="r+", encoding='utf-8')
        with intro:
            intro_out = intro.read().replace('\n', '').replace('\'', '\\\'').replace(
                '<p><audio style="display: none;" controls="controls"></audio></p>', '')
        intro.close()
    except:
        intro_out = ""
    return flask_render_template('farmintro_trace.html',
                                 farm_name=FARM_INFO.farm_name,
                                 intro=intro_out)