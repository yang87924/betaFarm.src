from flask import session, g
from datetime import datetime
from custom_modules.main_modules import db

def gacp_form_log(gacp_no, farm, field, table_name, action):
    current_time = datetime.now().strftime("%Y-%m-%d")
    log_user = session.get("username")
    g.session.add(
        db.models.GACP_FORM_LOG(
            gacp_no=gacp_no,
            farm_id=farm,
            field_id=field,
            log_table=table_name,
            create_date=current_time,
            create_user=log_user,
            action=action
        )
    )
    g.session.commit()
    return