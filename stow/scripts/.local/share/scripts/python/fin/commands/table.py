from prettytable import from_db_cursor, SINGLE_BORDER

def table(c, table, **kw):
    sql = 'SELECT * FROM ' + table
    if kw['r'] is not None:
        sql += ' WHERE date BETWEEN ' + kw['r'].replace('-', ' AND ')
    sql += ' ORDER BY date'
    c.execute(sql)
    t = from_db_cursor(c)
    if t is None:
        return
    t.field_names = list(map(lambda s:s.upper().replace('_', ' '), (t.field_names)))
    t.set_style(SINGLE_BORDER)
    t.align = 'r'
    return t

def income(c, **kw):
    return table(c, 'income', r=kw['r'])

def expense(c, **kw):
    return table(c, 'expenditure', r=kw['r'])

def ledger(c, **kw):
    return table(c, 'ledger', r=kw['r'])
