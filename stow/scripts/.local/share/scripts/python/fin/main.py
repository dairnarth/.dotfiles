import argparse, commands, os, re, sqlite3, sys

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-d', '--directory',
                        dest='dir',
                        default=os.path.join(os.path.expanduser('~'),
                                             'Documents', 'Finances'))
    subparsers = parser.add_subparsers(dest='cmd')
    add_parser = subparsers.add_parser('add')
    add_parser.add_argument('subcmd', choices=['income', 'expense'])

    list_parser = subparsers.add_parser('list')
    list_parser.add_argument('subcmd', choices=['income', 'expense'])
    list_parser.add_argument('daterange', nargs='?', default=None)

    sum_parser = subparsers.add_parser('sum')
    sum_parser.add_argument('subcmd', choices=['income', 'expense', 'total', 'taxable'])
    sum_parser.add_argument('daterange', nargs='?', default=None)

    gen_parser = subparsers.add_parser('gen')
    gen_parser.add_argument('subcmd', choices=['invoice', 'report'])
    gen_parser.add_argument('id', nargs=1)

    args = parser.parse_args()

    cn = sqlite3.connect(os.path.join(args.dir, 'finances.db'))
    c = cn.cursor()

    c.execute('''CREATE TABLE IF NOT EXISTS
                 income(id INTEGER PRIMARY KEY,
                        date INTEGER,
                        counterparty TEXT,
                        instrument,
                        gig_type TEXT,
                        location TEXT,
                        fee FLOAT,
                        paid_expenses FLOAT,
                        total FLOAT GENERATED ALWAYS AS (fee + paid_expenses) VIRTUAL,
                        notes TEXT);''')

    c.execute('''CREATE TABLE IF NOT EXISTS
                 expenditure(id INTEGER PRIMARY KEY,
                             date INTEGER,
                             counterparty TEXT,
                             location TEXT,
                             amount FLOAT,
                             notes TEXT);''')

    try:
        rgx = re.compile(r'^\d\d([0][1-9]|1[0-2])([0][1-9]|[12]\d|3[01])-^\d\d([0][1-9]|1[0-2])([0][1-9]|[12]\d|3[01])$')
        if rgx.match(args.daterange):
            r = args.daterange
        else:
            print('Range should use format YYMMDD-YYMMDD.', file=sys.stderr)
            return False
    except (AttributeError, TypeError):
        r = None

    try:
        id = args.id[0]
    except AttributeError:
        id = None

    cmd = getattr(commands, args.cmd)
    subcmd = getattr(cmd, args.subcmd)
    print(subcmd(c,
                 r=r,
                 id=id,
                 dir=args.dir,
                 progdir=os.path.dirname(__file__)))

    cn.commit()
    cn.close()

if __name__ == '__main__':
    main()
