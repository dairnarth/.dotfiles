import re, sys

def get_date(prompt):
    date = input(prompt)
    rgx = re.compile('^\d\d([0][1-9]|1[0-2])([0][1-9]|[12]\d|3[01])$')
    if rgx.match(date):
        return int(date)
    else:
        print('Please use format YYMMDD.', file=sys.stderr)
        get_date(prompt)

def text_date(date):
    monthmap = [
        '',
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
    ]
    y, m, d = re.findall('..', date)
    year = '20' + y
    month = monthmap[int(m.lstrip('0'))]
    day = d.lstrip('0')
    if day.endswith('1'):
        day += '\\textsuperscript{st}'
    elif day.endswith('2'):
        day += '\\textsuperscript{nd}'
    elif day.endswith('3'):
        day += '\\textsuperscript{rd}'
    else:
        day += '\\textsuperscript{th}'
    return f'{day} {month}, {year}'

def short_date(date):
    y, m, d = re.findall('..', date)
    return f'{d}/{m}/20{y}'

def multiline_input(prompt):
    lines = []
    lines.append(input(prompt))
    while True:
        line = input(' ' * len(prompt))
        rgx = re.compile('^$')
        if rgx.match(line):
            break
        else:
            lines.append(line)
    return '\n'.join(lines)
