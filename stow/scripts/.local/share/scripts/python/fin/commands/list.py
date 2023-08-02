from prettytable import from_db_cursor, SINGLE_BORDER

def list(c, table, **kw):
    sql = 'SELECT * FROM ' + table
    if kw['r'] is not None:
        sql += ' WHERE date BETWEEN ' + kw['r'].replace('-', ' AND ')
    c.execute(sql)
    t = from_db_cursor(c)
    if t is None:
        return
    t.set_style(SINGLE_BORDER)
    t.align = 'r'
    return t

def income(c, **kw):
    return list(c, 'income', r=kw['r'])

def expense(c, **kw):
    return list(c, 'expenditure', r=kw['r'])
