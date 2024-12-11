from sqlalchemy import (Boolean, Column, DateTime, Float, ForeignKey,
                        Integer, String, Text, UniqueConstraint, DECIMAL, Date)
from sqlalchemy.ext.declarative import declarative_base

base = declarative_base()


class AtPressure(base):
    __tablename__ = 'atpressure'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)


class CO2(base):
    __tablename__ = 'co2'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class Temperature(base):
    __tablename__ = 'temperature'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class Humidity(base):
    __tablename__ = 'humidity'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Luminance(base):
    __tablename__ = 'luminance'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class WindSpeed(base):
    __tablename__ = 'windspeed'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)


class RainMeter(base):
    __tablename__ = 'rainmeter'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Bug1(base):
    __tablename__ = 'bug1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class UV1(base):
    __tablename__ = 'uv1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Moisture1(base):
    __tablename__ = 'moisture1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class PH1(base):
    __tablename__ = 'ph1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)
class Volt1(base):
    __tablename__ = 'volt1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Current1(base):
    __tablename__ = 'current1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Power1(base):
    __tablename__ = 'power1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Consumption(base):
    __tablename__ = 'consumption'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Spore(base):
    __tablename__ = 'spore'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Ovum(base):
    __tablename__ = 'Ovum'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilTemp1(base):
    __tablename__ = 'soiltemp1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class SoilEC1(base):
    __tablename__ = 'soilec1'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class N(base):
    __tablename__ = 'n'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class P(base):
    __tablename__ = 'p'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)
class K(base):
    __tablename__ = 'k'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)

class Turmeric(base):
    __tablename__ = 'turmeric'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    __table_args__ = (UniqueConstraint('field',
                                       'timestamp',
                                       name='UC_field_time'),)



####################################################

class user(base):
    __tablename__ = 'user'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    username = Column(String(255), nullable=False)
    password = Column(String(255), nullable=False)
    is_superuser = Column(Integer, nullable=False, default=False)
    memo = Column(Text, nullable=False, default='')
    parent_id = Column(Integer,nullable=False)
    status = Column(Integer,nullable=False, default=1)
    trace_sys_flag = Column(Integer,nullable=False, default=0)
    __table_args__ = (UniqueConstraint('username', name='uc_username'),)



class field(base):
    __tablename__ = 'field'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    name = Column(String(50), nullable=False)
    alias = Column(String(50), nullable=False)
    iframe = Column(String(200),
                    nullable=False,
                    default='')
    ipcam = Column(String(200),
                   nullable=False,
                   default='')
    other_chk = Column(Integer,
                    nullable=False,
                    default=0)
    creator_id = Column(Integer, nullable=False)


class sensor(base):
    __tablename__ = 'sensor'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    name = Column(String(50), nullable=False, unique=True)
    df_name = Column(String(50), nullable=False, unique=True)
    alias = Column(String(50), nullable=False)
    unit = Column(String(50), default='')
    icon = Column(String(50), default='')
    bg_color = Column(String(50), default='bg-aqua')


class field_sensor(base):
    __tablename__ = 'field_sensor'
    id = Column(Integer,
                primary_key=True,
                nullable=False)
    field = Column(Integer,
                   ForeignKey('field.id'),
                   nullable=False)
    sensor = Column(Integer,
                    ForeignKey('sensor.id'),
                    nullable=False)
    df_name = Column(String(50), nullable=False)
    alias = Column(String(50), nullable=False)
    unit = Column(String(50), default='')
    icon = Column(String(50), default='')
    bg_color = Column(String(50), default='bg-aqua')
    __table_args__ = (UniqueConstraint('field',
                                       'df_name',
                                       name='UC_field_df_name'),)


class user_access(base):
    __tablename__ = 'user_access'
    id = Column(Integer,
                primary_key=True)
    user = Column(Integer,
                  ForeignKey('user.id'),
                  nullable=False)
    field = Column(Integer,
                   ForeignKey('field.id'),
                   nullable=False)
    is_active = Column(Boolean, nullable=False, default=False)

class test(base):
    __tablename__ = 'test'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
	
	
	
####################################################

class SEED_REGIS_FORM(base):
    __tablename__ = 'SEED_REGIS_FORM'
    regis_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    item_no = Column(Integer, primary_key=True, nullable=False)
    cultivar_code = Column(Integer, primary_key=True, nullable=False)
    seed_qty = Column(DECIMAL(10,2), nullable=False)
    purch_date = Column(Date, nullable=True)
    reg_user_id = Column(Integer, nullable=False)
    is_old = Column(Integer, nullable=False,default=0)
    seed_qty_unit = Column(Integer, nullable=False)
    self_reserved = Column(Integer, nullable=False)
    sup_id = Column(Integer, primary_key=True, nullable=True)

class CULT_WORK_RECORD(base):
    __tablename__ = 'CULT_WORK_RECORD'
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    record_item = Column(Integer, primary_key=True, nullable=False)
    word_date = Column(Date, nullable=False)
    image_addr = Column(String(255), nullable=False)
    memo = Column(String(200), nullable=True)
    reg_user_id = Column(Integer, nullable=False)
    is_old = Column(Integer, nullable=False,default=0)
    record_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)

class FERT_CONS_RECORD(base):
    __tablename__ = 'FERT_CONS_RECORD'
    fert_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    fert_code = Column(Integer, primary_key=True, nullable=False)
    purchase_id = Column(Integer, nullable=False)
    fert_date = Column(Date, nullable=False)
    application_qty = Column(DECIMAL(10,2), nullable=False)
    memo = Column(String(200), nullable=True)
    reg_user_id = Column(Integer, nullable=False)
    is_old = Column(Integer, nullable=False,default=0)
    unit = Column(Integer,nullable=False)
    standard_qty = Column(DECIMAL(12,5), nullable=False)
    
class PESTS_DISEASES_RECORD(base):
    __tablename__ = 'PESTS_DISEASES_RECORD'
    pd_no = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    fert_date = Column(Date, nullable=False)
    control_obj_code = Column(Integer, nullable=False)
    purchase_id = Column(Integer, nullable=False)
    application_qty = Column(DECIMAL(10,2), nullable=False)
    dilution_ratio = Column(DECIMAL(10,2), nullable=True)
    preve_method = Column(String(200), nullable=True)
    reg_user_id = Column(Integer, nullable=False)
    is_old = Column(Integer, nullable=False,default=0)
    unit = Column(Integer,nullable=False)
    standard_qty = Column(DECIMAL(12,5), nullable=False)

class HARVEST_RECORD(base):
    __tablename__ = 'HARVEST_RECORD'
    record_id = Column(Integer, primary_key=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    word_date = Column(Date, nullable=False)
    harvest_qty = Column(DECIMAL(10,2), nullable=False)
    word_memo = Column(String(200), nullable=True)
    memo = Column(String(200), nullable=True)
    reg_user_id = Column(Integer, nullable=False)
    is_old = Column(Integer, nullable=False,default=0)
    unit = Column(Integer, nullable=False)
    standard_qty = Column(DECIMAL(12,5), nullable=False)
    grading_code = Column(Integer, nullable=True)
    storage_code = Column(Integer, nullable=True)

class SHIPPMENT_RECORD(base):
    __tablename__ = 'SHIPPMENT_RECORD'
    sr_no = Column(Integer, primary_key=True, autoincrement=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    sales_date = Column(Date, nullable=False)
    harvest_no = Column(String(10), nullable=False)
    sales_sup_id = Column(Integer, nullable=False)
    shipment_qty = Column(DECIMAL(12,2), nullable=False)
    package_qty = Column(DECIMAL(10,2), nullable=False)
    sales_amount = Column(DECIMAL(10,2), nullable=False)
    stamp_flow_no = Column(String(100), nullable=False)
    item_grading = Column(Integer, nullable=False)
    memo = Column(String(200), nullable=True)
    reg_user_id = Column(Integer, nullable=True)
    is_old = Column(Integer, nullable=False,default=0)
    shipment_qty_unit = Column(Integer, nullable=False)
    package_qty_unit = Column(Integer, nullable=False)
    shipment_qty_standard = Column(DECIMAL(12,5), nullable=False)
    package_qty_standard = Column(DECIMAL(12,5), nullable=False)

class SALES_INFO(base):
    __tablename__ = 'SALES_INFO'
    sales_sup_id = Column(Integer, primary_key=True, nullable=False)
    name = Column(String(20), nullable=False)
    tel_no = Column(String(15), nullable=False)
    farm_addr = Column(String(100), nullable=True)
    email = Column(String(100), nullable=True)
    wechat_id = Column(String(30), nullable=True)
    memo = Column(String(200), nullable=True)
    is_old = Column(Integer, nullable=False,default=0)
    update_farm_id = Column(Integer, nullable=False)

class FERT_PURCH_RECORD(base):
    __tablename__ = 'FERT_PURCH_RECORD'
    record_id = Column(Integer, primary_key=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    purch_date = Column(Date, nullable=False)
    material_code = Column(Integer, nullable=False)
    label = Column(String(100), nullable=True)
    sup_id = Column(Integer, nullable=True)
    price = Column(DECIMAL(10,2), nullable=True)
    qty = Column(DECIMAL(10,2), nullable=True)
    subtotal = Column(DECIMAL(10,2), nullable=True)
    memo = Column(String(200), nullable=True)
    is_old = Column(Integer, nullable=False,default=0)
    up_file = Column(String(200), nullable=False)
    qty_unit = Column(Integer, nullable=False)
    lot_number = Column(String(30), nullable=False)

class PREVE_PURCH_RECORD(base):
    __tablename__ = 'PREVE_PURCH_RECORD'
    record_id = Column(Integer, primary_key=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    purch_date = Column(Date, nullable=False)
    material_code = Column(Integer, nullable=False)
    label = Column(String(100), nullable=True)
    sup_id = Column(Integer, nullable=True)
    price = Column(DECIMAL(10,2), nullable=True)
    qty = Column(DECIMAL(10,2), nullable=True)
    subtotal = Column(DECIMAL(10,2), nullable=True)
    memo = Column(String(200), nullable=True)
    is_old = Column(Integer, nullable=False,default=0)
    up_file = Column(String(200), nullable=False)
    qty_unit = Column(Integer, nullable=False)
    lot_number = Column(String(30), nullable=False)

class OTHER_PURCH_RECORD(base):
    __tablename__ = 'OTHER_PURCH_RECORD'
    record_id = Column(Integer, primary_key=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    purch_date = Column(Date, nullable=False)
    material_code = Column(Integer, nullable=False)
    label = Column(String(100), nullable=True)
    sup_id = Column(Integer, nullable=True)
    price = Column(DECIMAL(10,2), nullable=True)
    qty = Column(DECIMAL(10,2), nullable=True)
    subtotal = Column(DECIMAL(10,2), nullable=True)
    memo = Column(String(200), nullable=True)
    is_old = Column(Integer, nullable=False,default=0)
    up_file = Column(String(200), nullable=False)
    qty_unit = Column(Integer, nullable=False)
    lot_number = Column(String(30), nullable=False)

class OTHER_INSPECTION_INFO(base):
    __tablename__ = 'OTHER_INSPECTION_INFO'
    oii_no = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    up_date = Column(Date, nullable=False)
    up_file = Column(String(200), nullable=False)
    memo = Column(String(200), nullable=True)
    is_old = Column(Integer, nullable=False,default=0)

class OTHER_NOTES(base):
    __tablename__ = 'OTHER_NOTES'
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, primary_key=True, nullable=False)
    gacp_no = Column(String(20), nullable=False)
    other_date = Column(Date, primary_key=True, nullable=False)
    memo = Column(String(200), nullable=True)
    reg_user_id = Column(Integer, nullable=False)
    is_old = Column(Integer, nullable=False,default=0)

#########################################
class FARM_INFO(base):
    __tablename__ = 'FARM_INFO'
    farm_id = Column(String(5), primary_key=True, nullable=False)
    province_id = Column(Integer, nullable=False)
    local_id = Column(Integer, nullable=False)
    local_agent_id = Column(Integer, nullable=False)
    farm_addr = Column(String(100), nullable=False)
    farm_area = Column(DECIMAL(10,2), nullable=False)
    arable_area = Column(DECIMAL(10,2), nullable=False)
    area_unit = Column(Integer, nullable=False)
    farm_user = Column(String(10), nullable=False)
    farm_name = Column(String(45), nullable=False)
    tel_no = Column(String(15), nullable=False)
    email = Column(String(30), nullable=True)
    wechat_id = Column(String(30), nullable=True)
    create_date = Column(Date, nullable=True)
    create_user = Column(String(30), nullable=True)
    update_date = Column(Date, nullable=True)
    update_user = Column(String(30), nullable=True)
    farm_introduction = Column(String(100),nullable=True)
    tgap_no = Column(String(45), nullable=False)

class FIELD_INFO(base):
    __tablename__ = 'FIELD_INFO'
    field_id = Column(Integer, primary_key=True, nullable=False)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    arable_area = Column(DECIMAL(10,2), nullable=False)
    arable_area_unit = Column(Integer, nullable=False)
    field_user = Column(String(10), nullable=False)
    field_facility = Column(String(200), nullable=True)
    Soil_type = Column(Integer, nullable=False)
    fiele_method = Column(Integer, nullable=False)
    create_date = Column(Date, nullable=True)
    create_user = Column(String(30), nullable=True)
    update_date = Column(Date, nullable=True)
    update_user = Column(String(30), nullable=True)
    standard_area = Column(DECIMAL(12,5), nullable=False)
    city_id = Column(Integer, nullable=False)
    town_id = Column(Integer, nullable=False)
    cadastral = Column(String(255), nullable=True)
#####################################
class GACP_LIST_LOG(base):
    __tablename__ = 'GACP_LIST_LOG'
    gacp_no = Column(String(20), primary_key=True, nullable=False)
    farm_id = Column(String(5), primary_key=True, nullable=False)
    region_id = Column(Integer, nullable=False)
    log_table = Column(String(50), nullable=False)
    create_user = Column(String(30), nullable=False)
    create_date = Column(Date, nullable=False)
    update_date = Column(Date, nullable=False)
    update_user = Column(String(30), nullable=False)
    status = Column(Integer,nullable=False, default=1)
    image_addr = Column(String(255), nullable=True)
    purchase_link = Column(String(255),nullable=True)
    purchase_link_name = Column(String(60),nullable=True)
    is_organic = Column(Integer,nullable=False, default=0)
    organic_affidavit = Column(Integer,nullable=False, default=0)
    planning_planting_date = Column(Date, nullable=False)
    ipcam_name = Column(String(255),nullable=True)
    cwb_no = Column(String(6), nullable=True)

class GACP_FORM_LOG(base):
    __tablename__ = 'GACP_FORM_LOG'
    id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    gacp_no = Column(String(20), nullable=False)
    farm_id = Column(String(5), nullable=False)
    field_id = Column(Integer, nullable=False)
    log_table = Column(String(50), nullable=False)
    create_user = Column(String(30), nullable=False)
    create_date = Column(Date, nullable=False)
    update_date = Column(Date, nullable=True)
    update_user = Column(String(30), nullable=True)
    action = Column(String(20),nullable=False)

class LOCAL_AGENT_INFO(base):
    __tablename__ = 'LOCAL_AGENT_INFO'
    local_agent_id = Column(Integer, primary_key=True, nullable=False)
    local_id = Column(Integer, nullable=False)
    province_id = Column(Integer, nullable=False)
    local_agent_name = Column(String(30), nullable=False)
    local_agent_addr = Column(String(100), nullable=False)
    tel_no = Column(String(15), nullable=False)

class PROV_LICE_INFO(base):
    __tablename__ = 'PROV_LICE_INFO'
    proc_lice_id = Column(Integer, primary_key=True, nullable=False)
    province_id = Column(Integer, nullable=False)
    proc_lice_neme = Column(String(30), nullable=False)
    proc_lice_addr = Column(String(100), nullable=False)
    tel_no = Column(String(15), nullable=False)

class LOCAL(base):
    __tablename__ = 'LOCAL'
    local_id = Column(Integer, primary_key=True, nullable=False)
    local_name = Column(String(100), nullable=False)
    local_ne_name = Column(String(100), nullable=False)
    local_abbr = Column(String(10), nullable=True)
    region_id = Column(Integer, nullable=False)
    province_id = Column(Integer, nullable=False)
    local_postal_code = Column(Integer, primary_key=True, nullable=False)
    
class PROVINCE(base):
    __tablename__ = 'PROVINCE'
    province_id = Column(Integer, primary_key=True, nullable=False)
    province_name = Column(String(100), nullable=False)
    province_ne_name = Column(String(100), nullable=False)
    province_abbr = Column(String(10), nullable=True)
    province_group_no = Column(Integer, nullable=False)
    province_postal_code = Column(Integer, primary_key=True, nullable=False)
   
class REGION(base):
    __tablename__ = 'REGION'
    region_id = Column(Integer, primary_key=True, nullable=False)
    region_name = Column(String(100), nullable=False)
    region_en_name = Column(String(100), nullable=False)
    region_abbr = Column(String(10), nullable=True)
    
class CULTIVAR_LIST(base):
    __tablename__ = 'CULTIVAR_LIST'
    cultivar_id = Column(Integer, primary_key=True, nullable=False)
    cultivar_code = Column(Integer, primary_key=True, nullable=False)
    cultivar_name = Column(String(100), nullable=False)

class CULT_WORK_LIST(base):
    __tablename__ = 'CULT_WORK_LIST'
    cult_work_id = Column(Integer, primary_key=True, nullable=False)
    cult_work_code = Column(Integer, primary_key=True, nullable=False)
    cult_work_tw_name = Column(String(100), nullable=False)
    cult_work_cn_name = Column(String(100), nullable=False)

class FERT_CONS_LIST(base):
    __tablename__ = 'FERT_CONS_LIST'
    fert_cons_id = Column(Integer, primary_key=True, nullable=False)
    fert_cons_code = Column(Integer, primary_key=True, nullable=False)
    fert_cons_name = Column(String(100), nullable=False)

class ITEMS(base):
    __tablename__ = 'ITEMS'
    item_no = Column(Integer, primary_key=True)
    item_name = Column(String(45), nullable=False)
    sup_id = Column(Integer, nullable=True)
    type_code = Column(Integer, nullable=False)
    label = Column(String(45), nullable=False)
    memo = Column(String(200), nullable=True)
    organic_material_no = Column(String(255), nullable=True)
    pest_reg_no = Column(String(255), nullable=True)
    fert_type = Column(String(255), nullable=True)
    reg_file_no = Column(String(255), nullable=True)
    row_material = Column(String(255), nullable=True)
    ingredients = Column(String(255), nullable=True)
    cultivar_id = Column(Integer, nullable=True)
    update_user = Column(String(45), nullable=False)

class SUPPLIER(base):
    __tablename__ = 'SUPPLIER'
    sup_id = Column(Integer, primary_key=True)
    sup_name = Column(String(20), nullable=False)
    busi_id = Column(Integer, nullable=True)
    type_code = Column(Integer, nullable=False)
    user_name = Column(String(20), nullable=True)
    tel_no = Column(String(15), nullable=False)
    sup_addr = Column(String(100), nullable=True)
    email = Column(String(100), nullable=True)
    wechat_id = Column(String(30), nullable=True)
    memo = Column(String(200), nullable=True)    
    update_user = Column(String(45), nullable=False)

class SUPPLIER_TYPE_LIST(base):
    __tablename__ = 'SUPPLIER_TYPE_LIST'
    type_code = Column(Integer, primary_key=True, nullable=False)
    type_name = Column(String(200), nullable=False)

class CONTROL_OBJ_LIST(base):
    __tablename__ = 'CONTROL_OBJ_LIST'
    control_obj_code = Column(Integer, primary_key=True, nullable=False)
    control_obj_name = Column(String(200), nullable=False)

class GRADING_CODE_LIST(base):
    __tablename__ = 'GRADING_CODE_LIST'
    grading_code = Column(Integer, primary_key=True, nullable=False)
    grading_code_name = Column(String(20), nullable=False)

class STORAGE_CODE_LIST(base):
    __tablename__ = 'STORAGE_CODE_LIST'
    storage_code = Column(Integer, primary_key=True, nullable=False)
    storage_code_name = Column(String(20), nullable=False)

class SOIL_TYPE_LIST(base):
    __tablename__ = 'SOIL_TYPE_LIST'
    soil_type = Column(Integer, primary_key=True, nullable=False)
    soil_type_name = Column(String(100), nullable=False)
    
class FIELD_METHOD_LIST(base):
    __tablename__ = 'FIELD_METHOD_LIST'
    field_method = Column(Integer, primary_key=True, nullable=False)
    field_method_name = Column(String(100), nullable=False)

class CERTIFICATE_MRAK(base):
    __tablename__ = 'CERTIFICATE_MRAK'
    mark_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    image_addr = Column(String(255), nullable=False)
    effective_date = Column(Date, nullable=False)
    farm_id = Column(String(5), nullable=False)
    field_id = Column(Integer, nullable=False)
    is_old = Column(Integer, nullable=False,default=0)
    certificate_list_id = Column(Integer, nullable=False)
class sensor_test(base):
    __tablename__ = 'sensor_test'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
class CERTIFICATE_LIST(base):
    __tablename__ = 'CERTIFICATE_LIST'
    certificate_list_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    mark_name = Column(String(60), nullable=False)
    mark_image_addr = Column(String(255), nullable=False)
    abbreviation = Column(String(45), nullable=False)
    
class unit_type(base):
    __tablename__ = 'unit_type'
    type_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    type_name = Column(String(45),nullable=False)

class units(base):
    __tablename__ = 'units'
    unit_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    name = Column(String(45),nullable=False)
    type_id = Column(Integer,nullable=False)
    is_standard = Column(Integer,nullable=False)
    standard_zoom = Column(DECIMAL(10,5),nullable=False)

class taiwan_city_list(base):
    __tablename__ = 'taiwan_city_list'
    city_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    name = Column(String(45),nullable=False)

class taiwan_town_list(base):
    __tablename__ = 'taiwan_town_list'
    town_id = Column(Integer, primary_key=True,nullable=False, autoincrement=True)
    city_id = Column(Integer, nullable=False)
    name = Column(String(45), nullable=False)
    postal_code = Column(Integer, nullable=False)

class farm_visible_material(base):
    __tablename__ = 'farm_visible_material'
    item_no = Column(Integer, primary_key=True, nullable=False)
    farm_id = Column(Integer, primary_key=True, nullable=False)
    visible = Column(Integer, nullable=False)

class ipcam_img(base):
    __tablename__ = 'ipcam_img'
    id = Column(Integer, primary_key=True, nullable=False)
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    name = Column(String(20), nullable=False)
    img_path = Column(String(255), nullable=False)

class M101(base):
    __tablename__ = 'm101'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M102(base):
    __tablename__ = 'm102'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M103(base):
    __tablename__ = 'm103'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M104(base):
    __tablename__ = 'm104'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M105(base):
    __tablename__ = 'm105'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M106(base):
    __tablename__ = 'm106'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M107(base):
    __tablename__ = 'm107'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M108(base):
    __tablename__ = 'm108'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2101(base):
    __tablename__ = 'm2101'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2102(base):
    __tablename__ = 'm2102'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2103(base):
    __tablename__ = 'm2103'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2104(base):
    __tablename__ = 'm2104'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2105(base):
    __tablename__ = 'm2105'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2106(base):
    __tablename__ = 'm2106'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2107(base):
    __tablename__ = 'm2107'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2108(base):
    __tablename__ = 'm2108'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2109(base):
    __tablename__ = 'm2109'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2110(base):
    __tablename__ = 'm2110'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M2114(base):
    __tablename__ = 'm2114'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M301(base):
    __tablename__ = 'm301'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M302(base):
    __tablename__ = 'm302'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M303(base):
    __tablename__ = 'm303'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M304(base):
    __tablename__ = 'm304'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M305(base):
    __tablename__ = 'm305'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M306(base):
    __tablename__ = 'm306'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M307(base):
    __tablename__ = 'm307'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M308(base):
    __tablename__ = 'm308'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M309(base):
    __tablename__ = 'm309'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M310(base):
    __tablename__ = 'm310'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M311(base):
    __tablename__ = 'm311'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M312(base):
    __tablename__ = 'm312'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M313(base):
    __tablename__ = 'm313'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M314(base):
    __tablename__ = 'm314'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M315(base):
    __tablename__ = 'm315'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)
    
class M316(base):
    __tablename__ = 'm316'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, ForeignKey('field.id'), primary_key=True, nullable=False)
    value = Column(Float)

class controller_list(base):
    __tablename__ = 'controller_list'
    controller_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    controller_name = Column(String(45),  nullable=False)
    controller_alias = Column(String(45),  nullable=False)
    host_mac = Column(String(45),  nullable=False)
    creator_id = Column(Integer,  nullable=False)

class controller_access(base):
    __tablename__ = 'controller_access'
    access_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    user_id = Column(Integer,  nullable=False)
    controller_id = Column(Integer,  nullable=False)

class relay_icons(base):
    __tablename__ = 'relay_icons'
    icon_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    icon_name = Column(String(45),  nullable=False)
    icon_path = Column(String(255),  nullable=False)
    relay_type = Column(Integer,  nullable=False)

class market_list(base):
    __tablename__ = 'market_list'
    market_id = Column(Integer, primary_key=True, nullable=False, autoincrement=True)
    market_name = Column(String(45),  nullable=False)