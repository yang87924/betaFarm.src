import os
DEBUG = True

FLASK_SECRET_KEY = 'TJERJMIOBTYOQPN' # use random string, for example, "FGHJHGFDSDFGHGFDSWERE" 

# DB_CONFIG = '<database>[+<orm_lib>]://[<user>[:<password>]]<host>[:<port>]/[db_name][?charset=utf8]'
# ex: DB_CONFIG = 'mysql+pymysql://user:pass@localhost:3306/db_name?charset=utf8'
# ex: DB_CONFIG = 'sqlite+pysqlite:///db.sqlite3'
DB_CONFIG = 'mysql+pymysql://root:root@localhost:3306/betaFarm?charset=utf8' 
DB_POOL_RECYCLE = 120
QUERY_LIMIT = 100
REQUEST_TIMEOUT = 60
SESSION_LIFETIME = 30 # day

ONLY_TRACE_MODE = False
TAIWAN_MODE = True

TIAGA_HOST = '192.168.1.5:20004'

ABSOULTE_PATH = os.path.split(os.path.abspath(__file__))[0]

TIAGA_MODULE_MAC_LIST = {
    "004B4C440008":"mysql+pymysql://root:root@localhost:3306/004B4C440008?charset=utf8"
}

TIAGA_MODULE_LIST = {
    "m1":["M101","M102","M103","M104","M105","M106","M106","M107","M108"],
    "m21":["M2101","M2102","M2103","M2104","M2105","M2106","M2107","M2108","M2109","M2110","M2114","M2112","M2113"],
    "m22":["M2201","M2202","M2203","M2204","M2205","M2206","M2207","M2208","M2209","M2210","M2214"],
    "m23":["M2301","M2302","M2303","M2304","M2305","M2306","M2307","M2308","M2309","M2310","M2314"],
    "m24":["M2401","M2402","M2403","M2404","M2405","M2406","M2407","M2408","M2409","M2410","M2414"],
    "m3":["M301","M302","M303","M304","M305","M306","M307","M308","M309","M310","M311","M312","M313","M314","M315","M316"]
}
