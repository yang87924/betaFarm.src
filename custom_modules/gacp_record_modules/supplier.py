from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user
import re

UserAddSup = Blueprint('UserAddSup', __name__)

@UserAddSup.route('/api/Supplier', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_UserAddSup():
    if request.method == 'POST':
        try:
            sup_name = request.form.get('sup_name')
            type_code = 9  # user add
            user_name = request.form.get('user_name') or None
            sup_addr = request.form.get('sup_addr') or None
            wechat_id = request.form.get('line') or None
            memo = request.form.get('memo')
            tel_no = request.form.get('tel_no')
            email = request.form.get('email') or None
            busi_id = request.form.get('busi_id') or None

            if tel_no is not None:
                if re.match('^\d{7,18}$', tel_no) is not None:
                    pass
                else:
                    abort(406)
            else:
                abort(406)
            if email is not None:
                if re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
                    pass
                else:
                    abort(406)
            if busi_id is not None:
                if re.match('^\d{8}$', busi_id) is not None:
                    pass
                else:
                    abort(406)

            new_info = db.models.SUPPLIER(
                sup_name=sup_name,
                busi_id=busi_id,
                type_code=type_code,
                user_name=user_name,
                tel_no=tel_no,
                sup_addr=sup_addr,
                email=email,
                wechat_id=wechat_id,
                memo=memo,
                update_user=session.get("username")
            )
            g.session.add(new_info)
            g.session.commit()
        except:
            return redirect(url_for('gacp', somethingbad=1))
        else:
            return redirect(url_for("gacp", is_organic=session.get("is_organic")))
    elif request.method == 'PUT':
        try:
            sup_id = request.form.get('sup_id')
            sup_name = request.form.get('sup_name')
            type_code = 9  # user add
            user_name = request.form.get('user_name') or None
            sup_addr = request.form.get('sup_addr') or None
            wechat_id = request.form.get('wechat_id') or None
            memo = request.form.get('memo')
            update_user = session.get("username")
            tel_no = request.form.get('tel_no')
            email = request.form.get('email') or None
            busi_id = request.form.get('busi_id') or None

            if tel_no is not None:
                if re.match('^\d{7,18}$', tel_no) is not None:
                    pass
                else:
                    abort(406)
            else:
                abort(406)
            if email is not None:
                if re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
                    pass
                else:
                    abort(406)
            if busi_id is not None:
                if re.match('^\d{8}$', busi_id) is not None:
                    pass
                else:
                    abort(406)

            (g.session.query(db.models.SUPPLIER)
             .filter(db.models.SUPPLIER.sup_id == sup_id)
             .update(
                {
                    "sup_name": sup_name,
                    "busi_id": busi_id,
                    "type_code": type_code,
                    "user_name": user_name,
                    "tel_no": tel_no,
                    "sup_addr": sup_addr,
                    "email": email,
                    "wechat_id": wechat_id,
                    "memo": memo,
                    "update_user": session.get("username")
                }
            ))
            g.session.commit()
        except:
            abort(406)
        else:
            return 'ok'
    else:
        abort(405)