from flask import session, g
from custom_modules.main_modules import db

def check_is_field_user(gacp_no):
    if session.get("is_superuser") == 1:
        return True
    gacp_query = (g.session
                   .query(db.models.GACP_LIST_LOG)
                   .filter(db.models.GACP_LIST_LOG.gacp_no == gacp_no)
                   .first())
    field_query = (g.session
                    .query(db.models.FIELD_INFO)
                    .filter(db.models.FIELD_INFO.field_id == gacp_query.region_id)
                    .filter(db.models.FIELD_INFO.farm_id == gacp_query.farm_id)
                    .first())
    if field_query is None:
        return False
    elif field_query.field_user == session.get("username"):
        return True
    else:
        return False