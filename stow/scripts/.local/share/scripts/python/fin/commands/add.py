from .util import get_date, multiline_input

def income(c, **_):
    date          =        get_date('Date:          ')
    counterparty  =           input('Counterparty:  ')
    instrument    =           input('Instrument:    ')
    gig_type      =           input('Gig type:      ')
    location      = multiline_input('Location:      ')
    fee           =     float(input('Fee:           '))
    paid_expenses =     float(input('Paid_expenses: '))
    notes         = multiline_input('Notes:         ')

    if input('Is that correct? [Y/n]: ').lower == 'n':
        return

    c.execute('''INSERT INTO
                 income(date,
                        counterparty,
                        instrument,
                        gig_type,
                        location,
                        fee,
                        paid_expenses''' +
              (notes == '' and
              ''') VALUES(?,?,?,?,?,?,?)''' or
              ''', notes) VALUES(?,?,?,?,?,?,?,?)'''),
              [date,
               counterparty,
               instrument,
               gig_type,
               location,
               fee,
               paid_expenses] +
              (notes != '' and [notes] or []))

def expense(c, **_):
    date         =        get_date('Date:         ')
    counterparty =           input('Counterparty: ')
    location     = multiline_input('Location:     ')
    amount       =     float(input('Amount:       '))
    notes        = multiline_input('Notes:        ')

    if input('Is that correct? [Y/n]: ').lower == 'n':
        return

    c.execute('''INSERT INTO
                 expenditure(date,
                             counterparty,
                             location,
                             amount''' +
              (notes == '' and
              ''') VALUES(?,?,?,?)''' or
              ''', notes) VALUES(?,?,?,?,?)'''),
              [date,
               counterparty,
               location,
               amount] +
              (notes != '' and [notes] or []))
