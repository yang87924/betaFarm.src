import datetime
import string

def row2dict(row, str_datetime=True):
    """Convert query object by sqlalchemy to dictionary object."""
    if not row:
        return None

    d = {}
    for column in row.__table__.columns:
        d[column.name] = getattr(row, column.name)
        #if str_datetime and isinstance(d[column.name], datetime.datetime):
        #    d[column.name] = str(d[column.name])
        if str_datetime and ("_date" in column.name) and d[column.name]:
            d[column.name] = d[column.name].strftime("%Y/%m/%d")
    return d

def row2dict_extra(row,extra,str_datetime=True):
    """Convert query object by sqlalchemy to dictionary object."""
    if not row:
        return None

    d = {}
    extra_key = "not found"
    for column in row.__table__.columns:
        if column.name == extra:
            extra_key = getattr(row, column.name)
        d[column.name] = getattr(row, column.name)
        if str_datetime and ("_date" in column.name) and d[column.name]:
            d[column.name] = d[column.name].strftime("%Y/%m/%d")
    return {extra_key:d}


