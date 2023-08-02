# dairnarth/.dotfiles/scripts/fin

Simple tool for interacting with an income/expenditure database.

## Usage

```bash
# Using wrapper (../../fin)
fin [-h] [-d DIR] {add,list,sum,gen} ...

# Using just main.py
python -- main.py [-h] [-d DIR] {add,list,sum,gen} ...
```

### Commands

#### Add

```bash
fin add [-h] {income,expense}
```

| Subcommand | Description                           |
|------------|---------------------------------------|
| `income`   | Adds a row to the 'income' table      |
| `expense`  | Adds a row to the 'expenditure' table |

#### List

```bash
fin list [-h] {income,expense} [daterange]
```

| Subcommand | Description                                                              |
|------------|--------------------------------------------------------------------------|
| `income`   | Lists all rows (or just those in `datarange`) in the 'income' table      |
| `expense`  | Lists all rows (or just those in `datarange`) in the 'expenditure' table |

#### Sum

```bash
fin sum [-h] {income,expense,total,taxable} [daterange]
```

| Subcommand | Description                                                                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| `income`   | Sum the 'fee' column in all rows (or just those in `datarange`) in the 'income' table                                                                 |
| `expense`  | Sum the 'amount' column in all rows (or just those in `datarange`) in the 'expenditure' table                                                         |
| `total`    | Sum the 'fee' and minus the sum of the 'paid_expenses' column in all rows (or just those in `datarange`) in the 'income' table                        |
| `taxable`  | Sum the 'fee' column in all rows (or just those in `datarange`) in the 'income' table and minus the sum of 'amount' column in the 'expenditure' table |

#### Gen

```bash
fin gen [-h] {invoice,report} id
```

| Subcommand | Description                                                                                                                  |
|------------|------------------------------------------------------------------------------------------------------------------------------|
| `invoice`  | Selects data from a row (`id`) of the 'income' table and generates an invoice based on a template stored in `DIR`.           |
| `report`   | Present the values of `sum income`, `sum expense`, and `sum taxable` for all rows (or just those in `datarange`) in a table. |
