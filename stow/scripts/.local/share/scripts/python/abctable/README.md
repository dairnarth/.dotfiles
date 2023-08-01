# dairnarth/.dotfiles/scripts/abctable

Simple python script that displays abc metadata in a clear and concise table.

## Usage

```bash
# Using wrapper (../../abctable)
abctable [-h] [-F FORMAT] [-O OUTPUT] [-S SORT] [-v | --verbose | --no-verbose] file [files ...]

# Using just main.py
python -- main.py [-h] [-F FORMAT] [-O OUTPUT] [-S SORT] [-v | --verbose | --no-verbose] file [files ...]
```

| Short opts  | Long opts         | Description                                                                                                        |
|-------------|-------------------|--------------------------------------------------------------------------------------------------------------------|
| `-h`        | `--help`          | show this help message and exit                                                                                    |
| `-F FORMAT` | `--format FORMAT` | Format of the table. Use lower-case abc fields. Default is `xtckrm`.                                               |
| `-O OUTPUT` | `--output OUTPUT` | Characters to use for the box. Options are `ascii`, `csv` `markdown`, `none`, and `unicode`. Default is `unicode`. |
| `-S SORT`   | `--sort SORT`     | Use a single lower-case abc field. Defaults to input order.                                                        |
| `-v`        | `--verbose`       | Show multiple values.                                                                                              |
