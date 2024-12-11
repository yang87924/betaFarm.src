from flask import Blueprint, abort, session, request, jsonify, g
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check
from custom_modules.main_modules import db, utils
from sqlalchemy import cast, Date
from custom_modules.main_modules.decorators import required_login, trace_sys_flag_check

gacp_search_result = Blueprint('gacp_search_result', __name__)

@gacp_search_result.route('/api/gacp_search/getdata', methods=['GET'])
@required_login
@trace_sys_flag_check
def gacp_search_getdata():
    if request.method != 'GET':
        abort(405)
    farm_id = request.args.get("farm_id_search")
    field_id = request.args.get("field_id_search")
    gacp_no = request.args.get("gacp_no_search")
    
    SEED_REGIS_FORM_data = []
    CULT_WORK_RECORD_data = []
    FERT_CONS_RECORD_data =[]    
    PESTS_DISEASES_RECORD_data =[]
    HARVEST_RECORD_data =[] 
    SHIPPMENT_RECORD_data =[]
    SALES_INFO_data=[]   
    FERT_PURCH_RECORD_data =[]
    PREVE_PURCH_RECORD_data = []
    OTHER_PURCH_RECORD_data = []
    OTHER_INSPECTION_INFO_data = []
    CERTIFICATE_MRAK_data = []
    OTHER_NOTES_data = []
    
    #required data,ex. be used to change No to name 
    #row2dict_extra(row,key)
    #>>{ key:{
    #>>     row.col1_name:value,
    #>>     row.col2_name:value ...
    #>>}}
    CULTIVAR_LIST_query = g.session.query(db.models.CULTIVAR_LIST).all()
    cultivar_list ={}
    for info in CULTIVAR_LIST_query:
        cultivar_list.update(utils.row2dict_extra(info,"cultivar_code"))
    
    CULT_WORK_LIST_query = g.session.query(db.models.CULT_WORK_LIST).all()
    cult_work_list ={}
    for info in CULT_WORK_LIST_query:
        cult_work_list.update(utils.row2dict_extra(info,"cult_work_code"))
    
    FERT_CONS_LIST_query = g.session.query(db.models.FERT_CONS_LIST).all()
    fert_cons_list ={}
    for info in FERT_CONS_LIST_query:
        fert_cons_list.update(utils.row2dict_extra(info,"fert_cons_code"))
    
    SUPPLIER_query = g.session.query(db.models.SUPPLIER).all()
    supplier = {}
    for info in SUPPLIER_query:
        supplier.update(utils.row2dict_extra(info,"sup_id"))
    
    CONTROL_OBJ_LIST_query = g.session.query(db.models.CONTROL_OBJ_LIST).all()
    control_obj_list = {}
    for info in CONTROL_OBJ_LIST_query:
        control_obj_list.update(utils.row2dict_extra(info,"control_obj_code"))
    
    ITEMS_query = g.session.query(db.models.ITEMS).all()
    items = {}
    for info in ITEMS_query:
        items.update(utils.row2dict_extra(info,"item_no"))
    
    SALES_INFO_query = g.session.query(db.models.SALES_INFO).all()
    sales_info = {}
    for info in SALES_INFO_query:
        sales_info.update(utils.row2dict_extra(info,"sales_sup_id"))
        
    GRADING_CODE_LIST_query = g.session.query(db.models.GRADING_CODE_LIST).all()
    gradig_code_list = {}
    for info in GRADING_CODE_LIST_query:
        gradig_code_list.update(utils.row2dict_extra(info,"grading_code"))    
    
    STORAGE_CODE_LIST_query = g.session.query(db.models.STORAGE_CODE_LIST).all()
    storage_code_list = {}
    for info in STORAGE_CODE_LIST_query:
        storage_code_list.update(utils.row2dict_extra(info,"storage_code"))
        
    record_user_query = g.session.query(db.models.user).all()
    user_list = {}
    for info in record_user_query:
        user_list.update(utils.row2dict_extra(info,"id"))

    units_query = g.session.query(db.models.units).all()
    unit_list = {}
    for unit in units_query:
        unit_list.update(utils.row2dict_extra(unit,"unit_id"))
    #GACP query

    #SEED_REGIS_FORM
    SEED_REGIS_FORM_query = (g.session
                            .query(db.models.SEED_REGIS_FORM.item_no,
                                db.models.SEED_REGIS_FORM.cultivar_code,
                                db.models.SEED_REGIS_FORM.seed_qty,
                                db.models.SEED_REGIS_FORM.purch_date,
                                db.models.CULTIVAR_LIST.cultivar_name,
                                db.models.ITEMS.item_name,
                                db.models.SUPPLIER.sup_name,
                                db.models.SEED_REGIS_FORM.seed_qty_unit,
                                db.models.SEED_REGIS_FORM.self_reserved,
                                db.models.SEED_REGIS_FORM.regis_id
                                )
                            .filter(db.models.SEED_REGIS_FORM.is_old == 0)
                            .filter(db.models.SEED_REGIS_FORM.gacp_no == gacp_no)
                            .filter(db.models.SEED_REGIS_FORM.cultivar_code == db.models.CULTIVAR_LIST.cultivar_code)
                            .filter(db.models.SEED_REGIS_FORM.item_no == db.models.ITEMS.item_no)
                            .filter(db.models.SUPPLIER.sup_id == db.models.SEED_REGIS_FORM.sup_id)
                            .order_by(db.models.SEED_REGIS_FORM.cultivar_code)
                            .all())
    
    for ino,cc,sq,pd,cnm,inm,snm,squ,sr,ri in SEED_REGIS_FORM_query:
        if pd is None:
            pd = ""
        else:
            pd = pd.strftime("%Y/%m/%d")
        
        _squ = unit_list[squ]["name"]
        
        if sr == 1 :
            _sr = True
            snm = "--"
        else:
            _sr = False
        SEED_REGIS_FORM_data.append({"cc":cc,
                                     "ino":ino,
                                     "sq":format(sq,',').rstrip('0').rstrip('.'),
                                     "pd":pd,
                                     "cnm":cnm,
                                     "inm":inm,
                                     "snm":snm,
                                     "squ":_squ,
                                     "sr":_sr,
                                     "ri":ri})
    #CULT_WORK_RECORD
    CULT_WORK_RECORD_query = (g.session
            .query(db.models.CULT_WORK_RECORD.record_item,
                   db.models.CULT_WORK_RECORD.word_date.cast(Date),
                   db.models.CULT_WORK_RECORD.image_addr,
                   db.models.CULT_WORK_RECORD.memo,
                   db.models.CULT_WORK_RECORD.record_id
                   )
            .select_from(db.models.CULT_WORK_RECORD)
            .filter(db.models.CULT_WORK_RECORD.gacp_no == gacp_no)
            .filter(db.models.CULT_WORK_RECORD.is_old == 0)
            .order_by(db.models.CULT_WORK_RECORD.word_date)
            .all())
    
    for ri,wd,ia,mm,rid in CULT_WORK_RECORD_query:
        _ri = cult_work_list[ri]["cult_work_tw_name"]
        CULT_WORK_RECORD_data.append({"ri":_ri,
                                     "wd":wd.strftime("%Y/%m/%d"),
                                     "ia":ia,
                                     "mm":mm,
                                     "id":rid,
                                     "rio":ri})
    
    #FERT_CONS_RECORD
    FERT_CONS_RECORD_query = (g.session
            .query(db.models.FERT_CONS_RECORD.fert_code,
                   db.models.FERT_CONS_RECORD.fert_date.cast(Date),
                   db.models.FERT_CONS_RECORD.purchase_id,
                   db.models.FERT_CONS_RECORD.application_qty,
                   db.models.FERT_CONS_RECORD.memo,
                   db.models.units.name,
                   db.models.FERT_CONS_RECORD.standard_qty,
                   db.models.FERT_CONS_RECORD.fert_id
                   )
            .select_from(db.models.FERT_CONS_RECORD)
            .filter(db.models.FERT_CONS_RECORD.gacp_no == gacp_no)
            .filter(db.models.FERT_CONS_RECORD.is_old == 0)
            .filter(db.models.units.unit_id == db.models.FERT_CONS_RECORD.unit)
            .order_by(db.models.FERT_CONS_RECORD.fert_date)
            .all())
            
    for fc,fd,pi,aq,mm,qu,sq,fi in FERT_CONS_RECORD_query:
        fcn = fc
        if fc > 4: #add fert 2rd or more
            fc = 4 #4 is code of "add fert"
        _fc = fert_cons_list[fc]["fert_cons_name"]
        p_record = g.session.query(db.models.FERT_PURCH_RECORD).filter(db.models.FERT_PURCH_RECORD.record_id == pi).first()
        _ino1 = items[p_record.material_code]["item_name"]
        _ino2 = items[p_record.material_code]["item_no"]
        FERT_CONS_RECORD_data.append({"fc":_fc,
                                      "fd":fd.strftime("%Y/%m/%d"),
                                      "ino1":_ino1,
                                      "ino2":_ino2,
                                      "aq":format(aq,",.2f").rstrip('0').rstrip('.'),
                                      "mm":mm,
                                      "fcn":fcn,
                                      "qu":qu,
                                      "sq":format(sq,",.5f").rstrip('0').rstrip('.'),
                                      "ln":p_record.lot_number,
                                      "fi":fi})
    
    #PESTS_DISEASES_RECORD
    PESTS_DISEASES_RECORD_query = (g.session
            .query(db.models.PESTS_DISEASES_RECORD.fert_date.cast(Date),
                   db.models.PESTS_DISEASES_RECORD.control_obj_code,
                   db.models.PESTS_DISEASES_RECORD.purchase_id,
                   db.models.PESTS_DISEASES_RECORD.application_qty,
                   db.models.PESTS_DISEASES_RECORD.dilution_ratio,
                   db.models.PESTS_DISEASES_RECORD.preve_method,
                   db.models.PESTS_DISEASES_RECORD.pd_no,
                   db.models.units.name,
                   db.models.PESTS_DISEASES_RECORD.standard_qty)
            .select_from(db.models.PESTS_DISEASES_RECORD)
            .filter(db.models.PESTS_DISEASES_RECORD.gacp_no == gacp_no)
            .filter(db.models.PESTS_DISEASES_RECORD.is_old == 0)
            .filter(db.models.PESTS_DISEASES_RECORD.unit == db.models.units.unit_id)
            .order_by(db.models.PESTS_DISEASES_RECORD.fert_date)
            .all())
            
    for fd,coc,pi,aq,dr,pm,pn,qu,sq in PESTS_DISEASES_RECORD_query:
        _coc = control_obj_list[coc]["control_obj_name"]
        p_record = g.session.query(db.models.PREVE_PURCH_RECORD).filter(db.models.PREVE_PURCH_RECORD.record_id == pi).first()
        _ino1 = items[p_record.material_code]["item_name"]
        _ino2 = items[p_record.material_code]["item_no"]
        PESTS_DISEASES_RECORD_data.append({"coc":_coc,
                                           "fd":fd.strftime("%Y/%m/%d"),
                                           "ino1":_ino1,
                                           "ino2":_ino2,
                                           "aq":format(aq,",.2f").rstrip('0').rstrip('.'),
                                           "dr":format(dr,",.2f").rstrip('0').rstrip('.'),
                                           "pm":pm,
                                           "pn":pn,
                                           "qu":qu,
                                           "ln":p_record.lot_number,
                                           "sq":format(sq,",.5f").rstrip('0').rstrip('.')})
    #HARVEST_RECORD
    HARVEST_RECORD_query = (g.session
            .query(db.models.HARVEST_RECORD.record_id,
                   db.models.HARVEST_RECORD.word_date,
                   db.models.HARVEST_RECORD.harvest_qty,
                   db.models.HARVEST_RECORD.word_memo,
                   db.models.HARVEST_RECORD.memo,
                   db.models.units.name,
                   db.models.HARVEST_RECORD.grading_code,
                   db.models.HARVEST_RECORD.storage_code,
                   db.models.HARVEST_RECORD.standard_qty)
            .select_from(db.models.HARVEST_RECORD)
            .filter(db.models.HARVEST_RECORD.gacp_no == gacp_no)
            .filter(db.models.HARVEST_RECORD.is_old == 0)
            .filter(db.models.HARVEST_RECORD.unit == db.models.units.unit_id)
            .order_by(db.models.HARVEST_RECORD.word_date)
            .all())
            
    for ri,wd,hq,wm,mm,nm,gc,sc,sq in HARVEST_RECORD_query:
        _gc = gradig_code_list[gc]["grading_code_name"]
        _sc = storage_code_list[sc]["storage_code_name"]
        HARVEST_RECORD_data.append({"ri":ri,
                                    "wd":wd.strftime("%Y/%m/%d"),
                                    "hq":format(hq,",.2f").rstrip('0').rstrip('.'),
                                    "wm":wm,
                                    "mm":mm,
                                    "nm":nm,
                                    "gc":_gc,
                                    "sc":_sc,
                                    "sq":format(sq,",.5f").rstrip('0').rstrip('.')})
    #SHIPPMENT_RECORD                                
    SHIPPMENT_RECORD_query = (g.session
            .query(db.models.SHIPPMENT_RECORD.sales_date,
                   db.models.SHIPPMENT_RECORD.harvest_no,
                   db.models.SHIPPMENT_RECORD.sales_sup_id,
                   db.models.SHIPPMENT_RECORD.shipment_qty,
                   db.models.SHIPPMENT_RECORD.package_qty,
                   db.models.SHIPPMENT_RECORD.sales_amount,
                   db.models.SHIPPMENT_RECORD.stamp_flow_no,
                   db.models.SHIPPMENT_RECORD.item_grading,
                   db.models.SHIPPMENT_RECORD.memo,
                   db.models.SHIPPMENT_RECORD.sr_no,
                   db.models.SHIPPMENT_RECORD.shipment_qty_unit,
                   db.models.SHIPPMENT_RECORD.package_qty_unit,
                   db.models.SHIPPMENT_RECORD.shipment_qty_standard,
                   db.models.SHIPPMENT_RECORD.package_qty_standard
                   )
            .select_from(db.models.SHIPPMENT_RECORD)
            .filter(db.models.SHIPPMENT_RECORD.gacp_no == gacp_no)
            .filter(db.models.SHIPPMENT_RECORD.is_old == 0)
            .order_by(db.models.SHIPPMENT_RECORD.sales_date)
            .all())
    
    for sd,hn,ssi,sq,pq,sa,sfn,ig,mm,sn,squ,pqu,sqt,pqt in SHIPPMENT_RECORD_query:
        _ssi = sales_info[ssi]["name"]
        _ig =gradig_code_list[ig]["grading_code_name"]
        _squ = unit_list[squ]["name"]
        _pqu = unit_list[pqu]["name"]
        if sa:
            _sa = sa
        else:
            _sa = ""
        SHIPPMENT_RECORD_data.append({"sd":sd.strftime("%Y/%m/%d"),
                                      "hn":hn,
                                      "ssi":_ssi,
                                      "sq":format(sq,",.2f").rstrip('0').rstrip('.'),
                                      "pq":format(pq,",.2f").rstrip('0').rstrip('.'),
                                      "sa":format(sa,",.2f").rstrip('0').rstrip('.'),
                                      "sfn":sfn,
                                      "ig":_ig,
                                      "mm":mm,
                                      "sn":sn,
                                      "pqu":_pqu,
                                      "squ":_squ,
                                      "sqt":format(sqt,",.5f").rstrip('0').rstrip('.'),
                                      "pqt":format(pqt,",.5f").rstrip('0').rstrip('.')})
    #SALES_INFO
    SALES_INFO_query = (g.session
            .query(db.models.SALES_INFO.sales_sup_id,
                   db.models.SALES_INFO.name,
                   db.models.SALES_INFO.tel_no,
                   db.models.SALES_INFO.farm_addr,
                   db.models.SALES_INFO.email,
                   db.models.SALES_INFO.wechat_id,
                   db.models.SALES_INFO.memo
                   )
            .select_from(db.models.SALES_INFO)
            .filter(db.models.SALES_INFO.is_old == 0)
            .filter(db.models.SALES_INFO.update_farm_id == session.get("parent"))
            .order_by(db.models.SALES_INFO.name)
            .all())
    
    for ssi,nm,tn,fa,em,wi,mm in SALES_INFO_query:
        SALES_INFO_data.append({"ssi":ssi,
                                "nm":nm,
                                "tn":tn,
                                "fa":fa,
                                "em":em,
                                "wi":wi,
                                "mm":mm})
    #FERT_PURCH_RECORD
    FERT_PURCH_RECORD_query = (g.session
            .query(db.models.FERT_PURCH_RECORD.record_id,
                   db.models.FERT_PURCH_RECORD.purch_date,
                   db.models.FERT_PURCH_RECORD.material_code,
                   db.models.FERT_PURCH_RECORD.lot_number,
                   db.models.FERT_PURCH_RECORD.label,
                   db.models.FERT_PURCH_RECORD.sup_id,
                   db.models.FERT_PURCH_RECORD.price,
                   db.models.FERT_PURCH_RECORD.qty,
                   db.models.FERT_PURCH_RECORD.subtotal,
                   db.models.FERT_PURCH_RECORD.memo,
                   db.models.FERT_PURCH_RECORD.up_file,
                   db.models.FERT_PURCH_RECORD.qty_unit
                   )
            .select_from(db.models.FERT_PURCH_RECORD)
            .filter((db.models.FERT_PURCH_RECORD.farm_id ==farm_id) & (db.models.FERT_PURCH_RECORD.region_id == field_id))
            .filter(db.models.FERT_PURCH_RECORD.is_old == 0)
            .order_by(db.models.FERT_PURCH_RECORD.purch_date)
            .all())
            
    for ri,pd,mc,mn,lb,si,pr,qt,st,mm,uf,qu in FERT_PURCH_RECORD_query:
        _si = supplier[si]["sup_name"]
        _mc = items[mc]["item_name"]
        _qu = unit_list[qu]["name"]
        FERT_PURCH_RECORD_data.append({"ri":ri,
                                       "pd":pd.strftime("%Y/%m/%d"),
                                       "mc":_mc,
                                       "mn":mn,
                                       "lb":lb,
                                       "si":_si,
                                       "pr":format(pr,",.2f").rstrip('0').rstrip('.'),
                                       "qt":format(qt,",.2f").rstrip('0').rstrip('.'),
                                       "st":format(st,",.2f").rstrip('0').rstrip('.'),
                                       "mm":mm,
                                       "uf":uf,
                                       "qu":_qu,
                                       "no":mc})
    #PREVE_PURCH_RECORD                                  
    PREVE_PURCH_RECORD_query = (g.session
            .query(db.models.PREVE_PURCH_RECORD.record_id,
                   db.models.PREVE_PURCH_RECORD.purch_date,
                   db.models.PREVE_PURCH_RECORD.material_code,
                   db.models.PREVE_PURCH_RECORD.lot_number,
                   db.models.PREVE_PURCH_RECORD.label,
                   db.models.PREVE_PURCH_RECORD.sup_id,
                   db.models.PREVE_PURCH_RECORD.price,
                   db.models.PREVE_PURCH_RECORD.qty,
                   db.models.PREVE_PURCH_RECORD.subtotal,
                   db.models.PREVE_PURCH_RECORD.memo,
                   db.models.PREVE_PURCH_RECORD.up_file,
                   db.models.PREVE_PURCH_RECORD.qty_unit
                   )
            .select_from(db.models.PREVE_PURCH_RECORD)
            .filter((db.models.PREVE_PURCH_RECORD.farm_id ==farm_id) & (db.models.PREVE_PURCH_RECORD.region_id == field_id))
            .filter(db.models.PREVE_PURCH_RECORD.is_old == 0)
            .order_by(db.models.PREVE_PURCH_RECORD.purch_date)
            .all())
    
    for ri,pd,mc,mn,lb,si,pr,qt,st,mm,uf,qu in PREVE_PURCH_RECORD_query:
        _si = supplier[si]["sup_name"]
        _mc = items[mc]["item_name"]
        _qu = unit_list[qu]["name"]
        PREVE_PURCH_RECORD_data.append({"ri":ri,
                                        "pd":pd.strftime("%Y/%m/%d"),
                                        "mc":_mc,
                                        "mn":mn,
                                        "lb":lb,
                                        "si":_si,
                                        "pr":format(pr,",.2f").rstrip('0').rstrip('.'),
                                        "qt":format(qt,",.2f").rstrip('0').rstrip('.'),
                                        "st":format(st,",.2f").rstrip('0').rstrip('.'),
                                        "mm":mm,
                                        "uf":uf,
                                        "qu":_qu,
                                        "no":mc})
    #OTHER_PURCH_RECORD
    OTHER_PURCH_RECORD_query = (g.session
            .query(db.models.OTHER_PURCH_RECORD.record_id,
                   db.models.OTHER_PURCH_RECORD.purch_date,
                   db.models.OTHER_PURCH_RECORD.material_code,
                   db.models.OTHER_PURCH_RECORD.lot_number,
                   db.models.OTHER_PURCH_RECORD.label,
                   db.models.OTHER_PURCH_RECORD.sup_id,
                   db.models.OTHER_PURCH_RECORD.price,
                   db.models.OTHER_PURCH_RECORD.qty,
                   db.models.OTHER_PURCH_RECORD.subtotal,
                   db.models.OTHER_PURCH_RECORD.memo,
                   db.models.OTHER_PURCH_RECORD.up_file,
                   db.models.OTHER_PURCH_RECORD.qty_unit
                   )
            .select_from(db.models.OTHER_PURCH_RECORD)
            .filter((db.models.OTHER_PURCH_RECORD.farm_id ==farm_id) & (db.models.OTHER_PURCH_RECORD.region_id == field_id))
            .filter(db.models.OTHER_PURCH_RECORD.is_old == 0)
            .order_by(db.models.OTHER_PURCH_RECORD.purch_date)
            .all())
    
    for ri,pd,mc,mn,lb,si,pr,qt,st,mm,uf,qu in OTHER_PURCH_RECORD_query:
        _si = supplier[si]["sup_name"]
        _mc = items[mc]["item_name"]
        _qu = unit_list[qu]["name"]
        OTHER_PURCH_RECORD_data.append({"ri":ri,
                                        "pd":pd.strftime("%Y/%m/%d"),
                                        "mc":_mc,
                                        "mn":mn,
                                        "lb":lb,
                                        "si":_si,
                                        "pr":format(pr,",.2f").rstrip('0').rstrip('.'),
                                        "qt":format(qt,",.2f").rstrip('0').rstrip('.'),
                                        "st":format(st,",.2f").rstrip('0').rstrip('.'),
                                        "mm":mm,
                                        "uf":uf,
                                        "qu":_qu,
                                        "no":mc})
    #OTHER_INSPECTION_INFO
    OTHER_INSPECTION_INFO_query = (g.session
            .query(db.models.OTHER_INSPECTION_INFO.up_date,
                   db.models.OTHER_INSPECTION_INFO.up_file,
                   db.models.OTHER_INSPECTION_INFO.memo,
                   db.models.OTHER_INSPECTION_INFO.oii_no
                   )
            .select_from(db.models.OTHER_INSPECTION_INFO)
            .filter((db.models.OTHER_INSPECTION_INFO.farm_id ==farm_id) & (db.models.OTHER_INSPECTION_INFO.region_id == field_id))
            .filter(db.models.OTHER_INSPECTION_INFO.is_old == 0)
            .order_by(db.models.OTHER_INSPECTION_INFO.up_date)
            .all())
        
    for ud,uf,mm,on in OTHER_INSPECTION_INFO_query:
        OTHER_INSPECTION_INFO_data.append({"ud":ud.strftime("%Y/%m/%d"),
                                           "uf":uf,
                                           "mm":mm,
                                           "on":on})

    #CERTIFICATE_MRAK
    CERTIFICATE_query = (g.session
                        .query(db.models.CERTIFICATE_MRAK.image_addr,
                               db.models.CERTIFICATE_MRAK.effective_date,
                               db.models.CERTIFICATE_MRAK.mark_id,
                               db.models.CERTIFICATE_MRAK.certificate_list_id,
                               db.models.CERTIFICATE_LIST.mark_name,
                               db.models.CERTIFICATE_LIST.mark_image_addr,
                               db.models.CERTIFICATE_LIST.abbreviation)
                        .select_from(db.models.CERTIFICATE_MRAK)
                        .filter(db.models.CERTIFICATE_MRAK.farm_id == farm_id)
                        .filter(db.models.CERTIFICATE_MRAK.field_id == field_id)
                        .filter(db.models.CERTIFICATE_MRAK.is_old == 0)
                        .filter(db.models.CERTIFICATE_LIST.certificate_list_id == db.models.CERTIFICATE_MRAK.certificate_list_id)
                        .all())

    for ia,ed,mi,cli,mn,mia,ab in CERTIFICATE_query:
        CERTIFICATE_MRAK_data.append({"ia":ia,
                                      "ed":ed.strftime("%Y/%m/%d"),
                                      "mi":mi,
                                      "cli":cli,
                                      "mn":mn,
                                      "mia":mia,
                                      "ab":ab})             

    #OTHER_NOTES
    OTHER_NOTES_query = (g.session
            .query(db.models.OTHER_NOTES.other_date,
                   db.models.OTHER_NOTES.memo,
                   db.models.OTHER_NOTES.reg_user_id
                   )
            .select_from(db.models.OTHER_NOTES)
            .filter((db.models.OTHER_NOTES.farm_id ==farm_id) & (db.models.OTHER_NOTES.region_id == field_id))
            .filter(db.models.OTHER_NOTES.is_old == 0)
            .order_by(db.models.OTHER_NOTES.other_date)
            .all())
        
    for od,mm,rui in OTHER_NOTES_query:
        _rui = user_list[rui]["username"]
        OTHER_NOTES_data.append({"od":od.strftime("%Y/%m/%d"),
                                 "mm":mm,
                                 "un":_rui})
    
    return jsonify(username=session.get('username'),
                   is_superuser=session.get('is_superuser'),
                   farm_id = farm_id,
                   field_id = field_id,
                   gacp_no = gacp_no,
                   SEED_REGIS_FORM = SEED_REGIS_FORM_data,
                   CULT_WORK_RECORD = CULT_WORK_RECORD_data,
                   FERT_CONS_RECORD = FERT_CONS_RECORD_data,
                   PESTS_DISEASES_RECORD = PESTS_DISEASES_RECORD_data,
                   HARVEST_RECORD = HARVEST_RECORD_data,
                   SHIPPMENT_RECORD = SHIPPMENT_RECORD_data,
                   SALES_INFO = SALES_INFO_data,
                   FERT_PURCH_RECORD = FERT_PURCH_RECORD_data,
                   PREVE_PURCH_RECORD = PREVE_PURCH_RECORD_data,
                   OTHER_PURCH_RECORD = OTHER_PURCH_RECORD_data,
                   OTHER_INSPECTION_INFO = OTHER_INSPECTION_INFO_data,
                   CERTIFICATE_MRAK = CERTIFICATE_MRAK_data,
                   OTHER_NOTES = OTHER_NOTES_data,
                   )