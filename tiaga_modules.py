from sqlalchemy import (Boolean, Column, DateTime, Float, ForeignKey,
                        Integer, String, Text, UniqueConstraint, DECIMAL, Date)
from sqlalchemy.ext.declarative import declarative_base

base = declarative_base()

class FarmModuleTable(base):
    __tablename__ = 'FarmModuleTable'
    FieldID = Column(Integer, primary_key=True, nullable=False)
    FarmID = Column(Integer, nullable=False)
    ApplicationID = Column(Integer, nullable=False)
    ModuleName = Column(String(50), nullable=True)
    MACAddr = Column(String(13), nullable=True)
    ModuleID = Column(String(50), nullable=True)
    TimeStamp = Column(Date, nullable=False)

class RelayScheduleTable(base):
    __tablename__ = 'RelayScheduleTable'
    ScheduleID = Column(Integer, primary_key=True, nullable=False)
    FieldID = Column(Integer, nullable=False)
    FarmID = Column(Integer, nullable=False)
    ApplicationID = Column(Integer, nullable=False)
    ModuleName = Column(String(50), nullable=True)
    MACAddr = Column(String(13), nullable=True)
    ModuleID = Column(String(50), nullable=True)
    TimeStamp = Column(Date, nullable=False)
    PinNo = Column(Integer, nullable=False)
    RelayType = Column(Integer, nullable=True)
    RelayMemo = Column(String(50), nullable=True)
    TimerSet = Column(Integer, nullable=True)
    OnTime = Column(Date, nullable=True)
    OffTime = Column(Date, nullable=True)

class RelayTable(base):
    __tablename__ = 'RelayTable'
    RelayItemID = Column(Integer, primary_key=True, nullable=False)
    FieldID = Column(Integer, nullable=False)
    FarmID = Column(Integer, nullable=False)
    ApplicationID = Column(Integer, nullable=False)
    ModuleName = Column(String(50), nullable=True)
    MACAddr = Column(String(13), nullable=True)
    ModuleID = Column(String(50), nullable=True)
    TimeStamp = Column(Date, nullable=False)
    PinNo = Column(Integer, nullable=False)
    RelayType = Column(Integer, nullable=True)
    RelayMemo = Column(String(50), nullable=True)
    TimeStamp = Column(Date, nullable=False)
    LastStatus = Column(String(10), nullable=True)

"""class TIAGAModuleTable(base):
    __tablename__ = 'TIAGAModuleTable'
    ModuleName = Column(String(50), nullable=True)
    IPAddr = Column(String(20), nullable=True)
    PortNo = Column(String(10), nullable=True)
    FieldCount = Column(Integer, nullable=True)
    FieldNameSet = Column(String(800), nullable=True)
    TimeStamp = Column(Date, nullable=False)"""


class M101(base):
    __tablename__ = 'M101'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M102(base):
    __tablename__ = 'M102'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M103(base):
    __tablename__ = 'M103'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M104(base):
    __tablename__ = 'M104'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M105(base):
    __tablename__ = 'M105'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M106(base):
    __tablename__ = 'M106'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M107(base):
    __tablename__ = 'M107'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M108(base):
    __tablename__ = 'M108'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2101(base):
    __tablename__ = 'M2101'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2102(base):
    __tablename__ = 'M2102'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2103(base):
    __tablename__ = 'M2103'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2104(base):
    __tablename__ = 'M2104'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2105(base):
    __tablename__ = 'M2105'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2106(base):
    __tablename__ = 'M2106'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2107(base):
    __tablename__ = 'M2107'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2108(base):
    __tablename__ = 'M2108'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2109(base):
    __tablename__ = 'M2109'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2110(base):
    __tablename__ = 'M2110'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M2114(base):
    __tablename__ = 'M2114'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M301(base):
    __tablename__ = 'M301'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M302(base):
    __tablename__ = 'M302'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M303(base):
    __tablename__ = 'M303'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M304(base):
    __tablename__ = 'M304'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M305(base):
    __tablename__ = 'M305'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M306(base):
    __tablename__ = 'M306'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M307(base):
    __tablename__ = 'M307'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M308(base):
    __tablename__ = 'M308'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M309(base):
    __tablename__ = 'M309'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M310(base):
    __tablename__ = 'M310'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M311(base):
    __tablename__ = 'M311'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M312(base):
    __tablename__ = 'M312'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M313(base):
    __tablename__ = 'M313'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M314(base):
    __tablename__ = 'M314'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M315(base):
    __tablename__ = 'M315'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)
    
class M316(base):
    __tablename__ = 'M316'
    timestamp = Column(DateTime, primary_key=True, nullable=False)
    field = Column(Integer, primary_key=True, nullable=False)
    value = Column(Float)