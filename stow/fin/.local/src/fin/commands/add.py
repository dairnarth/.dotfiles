from .util import get_date, multiline_input

def income(c, **_):
    date          =        get_date('Start date:    ')
    end_date      =        get_date('End date:      ', empty=True)
    counterparty  =           input('Counterparty:  ')
    instrument    =           input('Instrument:    ')
    gig_type      =           input('Gig type:      ')
    location      = multiline_input('Location:      ')
    fee           =     float(input('Fee:           '))
    paid_expenses =     float(input('Paid expenses: '))
    notes         = multiline_input('Notes:         ')

    if end_date == '':
        end_date = date

    if input('Is that correct? [Y/n]: ').lower == 'n':
        return 'Aborted.'

    c.execute('''INSERT INTO
                 income(date,
                        end_date,
                        counterparty,
                        instrument,
                        gig_type,
                        location,
                        fee,
                        paid_expenses''' +
              (notes == '' and
              ''') VALUES(?,?,?,?,?,?,?,?)''' or
              ''', notes) VALUES(?,?,?,?,?,?,?,?,?)'''),
              [date,
               end_date,
               counterparty,
               instrument,
               gig_type,
               location,
               fee,
               paid_expenses] +
              (notes != '' and [notes] or []))

    return f'Inserted into income with id {c.lastrowid}.'

def expense(c, **_):
    date         =        get_date('Date:         ')
    counterparty =           input('Counterparty: ')
    location     = multiline_input('Location:     ')
    amount       =     float(input('Amount:       '))
    notes        = multiline_input('Notes:        ')

    if input('Is that correct? [Y/n]: ').lower == 'n':
        return 'Aborted.'

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

    return f'Inserted into expenditure with id {c.lastrowid}.'
