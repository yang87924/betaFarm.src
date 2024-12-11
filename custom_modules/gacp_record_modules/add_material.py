from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user
import re

ADDMATERIAL = Blueprint('ADDMATERIAL', __name__)

@ADDMATERIAL.route('/api/ADDMATERIAL', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_AddMaterial():
    if request.method == 'POST':
        try:
            item_name = request.form.get('item_name')
            label = request.form.get('label')
            type_code = request.form.get('type_code')
            SUPPLIER = db.models.SUPPLIER
            sup_id = None
            sup = g.session.query(SUPPLIER).filter(SUPPLIER.sup_name == label).first()
            if sup:
                sup_id = sup.sup_id
            else:
                user_sup = db.models.SUPPLIER(
                    sup_name=label,
                    update_user=session.get("username")
                )
                g.session.add(user_sup)
                g.session.commit()
                g.session.flush()
                sup_id = user_sup.sup_id

            new_material = db.models.ITEMS(
                item_name=item_name,
                sup_id=sup_id,
                label=label,
                type_code=type_code,
                update_user=session.get("username")
            )
            g.session.add(new_material)
            g.session.commit()
            g.session.flush()
            g.session.add(
                db.models.farm_visible_material(
                    item_no=new_material.item_no,
                    farm_id=session.get("parent"),
                    visible=1
                )
            )
            g.session.commit()
        except:
            return redirect(url_for('gacp', somethingbad=1))
        else:
            return redirect(url_for("gacp", is_organic=session.get("is_organic")))
    else:
        abort(405)