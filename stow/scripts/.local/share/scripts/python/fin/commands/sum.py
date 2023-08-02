def income(c, **kw):
    sql = 'SELECT SUM(fee) FROM income'
    if kw['r'] is not None:
        sql += ' WHERE date BETWEEN ' + kw['r'].replace('-', ' AND ')
    return c.execute(sql).fetchone()[0]

def expense(c, **kw):
    sql = 'SELECT SUM(amount) FROM expenditure'
    if kw['r'] is not None:
        sql += ' WHERE date BETWEEN ' + kw['r'].replace('-', ' AND ')
    return c.execute(sql).fetchone()[0]

def total(c, **kw):
    sql = 'SELECT SUM(total) FROM income'
    if kw['r'] is not None:
        sql += ' WHERE date BETWEEN ' + kw['r'].replace('-', ' AND ')
    return c.execute(sql).fetchone()[0]

def taxable(c, **kw):
    inc = income(c, r=kw['r'])
    exp = expense(c, r=kw['r'])
    if inc is None or exp is None:
        return None
    else:
        return inc - exp
