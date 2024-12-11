from flask import Blueprint, abort, g, session, request, redirect, url_for
from custom_modules.main_modules import db
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.gacp_record_modules.gacp_form_log import gacp_form_log
from custom_modules.gacp_record_modules.check_is_field_user import check_is_field_user
import re

SALES_INFO = Blueprint('SALES_INFO', __name__)

@SALES_INFO.route('/api/SALES_INFO', methods=['POST', 'PUT'])
@required_login
@trace_sys_flag_check
def api_SALES_INFO():
    user_id = session.get('id')
    if not user_id:
        abort(404)

    if request.method == 'POST':
        try:
            name = request.form.get('name')
            tel_no = request.form.get('tel_no')
            if re.match('^\d{7,18}$', tel_no) is not None:
                pass
            else:
                raise

            farm_addr = request.form.get('farm_addr')
            email = request.form.get('email')

            if email == "":
                pass
            elif re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
                pass
            else:
                raise
            wechat_id = request.form.get('wechat_id')
            memo = request.form.get('memo')

            g.session.add(db.models.SALES_INFO(
                name=name,
                tel_no=tel_no,
                farm_addr=farm_addr,
                update_farm_id=session.get("parent"),
                email=email,
                wechat_id=wechat_id,
                memo=memo))
            g.session.commit()
        except:
            return redirect(url_for('gacp', somethingbad=1))
        else:
            return redirect(url_for("gacp", is_organic=session.get("is_organic")))
    elif request.method == "PUT":
        if session.get("is_superuser") not in [0, 1]:
            abort(401)
        gacp_no = request.form.get('gacp_no')
        farm_id = int(gacp_no.split("f")[0])
        region_id = int(gacp_no.split("f")[1].split("t")[0])
        name = request.form.get('name')
        tel_no = request.form.get('tel_no')
        if re.match('^\d{7,18}$', tel_no) is not None:
            pass
        else:
            raise

        farm_addr = request.form.get('farm_addr')
        email = request.form.get('email')

        if email == "":
            pass
        elif re.match('\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}', email) is not None:
            pass
        else:
            raise
        wechat_id = request.form.get('wechat_id')
        memo = request.form.get('memo')
        sales_sup_id = request.form.get('sales_sup_id')

        max_old_counter = (g.session
                            .query(db.models.SALES_INFO)
                            .filter(db.models.SALES_INFO.sales_sup_id == sales_sup_id)
                            .order_by(db.models.SALES_INFO.is_old.desc())
                            .first())
        if max_old_counter is None:
            abort(404)

        (g.session
          .query(db.models.SALES_INFO)
          .filter(db.models.SALES_INFO.sales_sup_id == sales_sup_id)
          .filter(db.models.SALES_INFO.is_old == 0)
          .update({"is_old": max_old_counter.is_old+1}))

        g.session.add(db.models.SALES_INFO(
            sales_sup_id=sales_sup_id,
            name=name,
            tel_no=tel_no,
            farm_addr=farm_addr,
            email=email,
            wechat_id=wechat_id,
            update_farm_id=session.get("parent"),
            memo=memo))
        g.session.commit()
        return "ok"
    abort(405)