from prettytable import PrettyTable, SINGLE_BORDER
from tune import Tune
from util import codeToField
import argparse, sys

def main():
    parser = argparse.ArgumentParser()

    parser.add_argument('-F',
                        '--format',
                        dest = 'format',
                        default = 'xtckrm',
                        help = "Format of the table. Use lower-case abc fields. Default is 'xtckrm'.")
    parser.add_argument('-O',
                        '--output',
                        dest = 'output',
                        default = 'unicode',
                        help = "Characters to use for the box. Options are `ascii`, `csv` `markdown`, `none`, and `unicode`. Default is 'unicode'.")
    parser.add_argument('-S',
                        '--sort',
                        dest = 'sort',
                        default = '',
                        help = "Use a single lower-case abc field. Defaults to input order.")
    parser.add_argument('-v', '--verbose',
                        default = False,
                        action = argparse.BooleanOptionalAction,
                        help = 'Show multiple values.')
    parser.add_argument('files', nargs = '+')

    args = parser.parse_args()

    tunes = []
    for arg in args.files:
        if arg.endswith('.abc'):
            file = open(arg, 'r')
            blocks = file.read().split("\n\n")
            file.close()
            for block in blocks:
                tune = Tune(
                    filename = arg,
                    contents = block)
                tune.fromContents(args.verbose)

                tunes.append(tune)
        else:
            print(f'"{arg}" does not appear to be an abc file.', file=sys.stderr)


    fields = []
    for field in args.format:
        fields.append(codeToField(field))

    if len(args.sort) == 1:
        def sortfn(field):
            def _inner(tune):
                return getattr(tune, field)

            return _inner

        tunes.sort(key = sortfn(codeToField(args.sort)))

    if args.output == 'ascii':
        output = PrettyTable()
    elif args.output == 'markdown':
        output = PrettyTable(
            border = False,
            preserve_internal_border = True,
            horizontal_char = '-',
            vertical_char = '|',
            junction_char = '|')
    elif args.output == 'none':
        output = PrettyTable(
            border = False)
    else:
        output = PrettyTable()
        output.set_style(SINGLE_BORDER)

    for field in fields:
        col = []
        for tune in tunes:
            col.append(getattr(tune, field))
        output.add_column(field.capitalize(), col, 'l')

    if args.output == 'csv':
        print(output.get_csv_string())
    else:
        print(output)

if __name__ == '__main__':
    main()
