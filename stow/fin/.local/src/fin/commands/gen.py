from prettytable import PrettyTable, SINGLE_BORDER
from tempfile import TemporaryDirectory
from textwrap import wrap
from . import sum, util
import os, shutil, subprocess

def invoice(c, **kw):
    if kw['id'] is None:
        return
    c.execute('SELECT * FROM income WHERE id IS ' + kw['id'])
    id, date, end_date, counterparty, instrument, gig_type, location, fee, paid_expenses, total, _ = c.fetchone()
    filename = str(date) + ' ' + counterparty.replace(' ', '') + ' ' + location.replace(' ', '').replace('\n', '')

    textdate = util.text_date(str(date))
    shortdate = date == end_date and util.short_date(str(date)) or (util.short_date(str(date))
                                                                    + r'-\\'
                                                                    + util.short_date(str(end_date)))
    location = '\n'.join(wrap(location, 20)).replace('\n', r'\\')

    with TemporaryDirectory() as tmpdir:
        with open(os.path.join(tmpdir, filename + '.tex'), 'w') as tex:
            with open(os.path.join(kw['dir'], 'template.tex'), 'r') as template:
                tex.write(template.read().replace(r'\VAR{textdate}', textdate)
                                         .replace(r'\VAR{id}', str(id))
                                         .replace(r'\VAR{counterparty}', counterparty)
                                         .replace(r'\VAR{instrument}', instrument)
                                         .replace(r'\VAR{gig_type}', gig_type)
                                         .replace(r'\VAR{location}', location)
                                         .replace(r'\VAR{shortdate}', shortdate)
                                         .replace(r'\VAR{fee}', '{:.2f}'.format(fee))
                                         .replace(r'\VAR{paid_expenses}', '{:.2f}'.format(paid_expenses))
                                         .replace(r'\VAR{total}', '{:.2f}'.format(total)))

        subprocess.run(['latexmk', '-pdf', '-cd', tex.name])
        subprocess.run(['zathura', tex.name.replace("tex", "pdf")])

        output = ''
        if input('Would you like the source file? [y/N]: ').lower() == 'y':
            shutil.copy(tex.name, './')
            output += f'Generated {filename}.tex\n'

        if input('Is this correct? [Y/n]: ').lower() != 'n':
            shutil.copy(tex.name.replace('tex', 'pdf'),
                        os.path.join(kw['dir'],'Invoices', 'Sent'))
            output += f'Generated {filename}.pdf\n'

    return output or 'Aborted.'

def report(c, **kw):
    t = PrettyTable()
    t.set_style(SINGLE_BORDER)
    t.header = False
    t.align = 'r'
    t.float_format = '.2'
    if kw['r'] is not None:
        t.title = kw['r']

    t.add_rows([('Income',      sum.income(c,  r=kw['r'])),
                ('Expenditure', sum.expense(c, r=kw['r'])),
                ('Taxable',     sum.taxable(c, r=kw['r']))])
    return t
