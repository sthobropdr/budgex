# BudgEx

Terminal app written in Ruby for Coder Academy T1A3 assignment

Track incoming and outgoing money by inputting expense/income transactions and setting up transaction schedules. Check a future date's balance, check for possible debt dates. Work towards a savings goal or avoid falling further into debt - at the very least, see where you spend your money. Multi-user functionality.

---

## Requirements

- Mac/Windows/Linux computer with at least 4GB RAM

- Bash scripting shell: Terminal (Mac), Ubuntu (Windows), Bash (Linux)

- Ruby (~v2.7.1 or higher)
- [Bundler](https://bundler.io/)

### Dependencies

There are several Ruby Gems required that will be installed when the Installation process is run:

- tty-prompt
- tty-table
- tty-font
- rainbow
- recurrence
- optparse

---

## Installation & Running

1. Clone [GitHub repository](https://github.com/sthobropdr/budgex.git)

    - To clone the GitHub respository, create a new folder for the app where you would like the app to be stored, and in your computer's command line terminal, type `git clone https://github.com/sthobropdr/budgex.git` and press enter

2. After cloning the repository, there should now be a new folder named 'budgex' in the folder you added in step 1
    - Go into the new 'budgex' folder by typing `cd budgex`
    - Make sure there is a file in 'budgex' named `budgex_install.sh`

3. Install the app by typing `sh budgex_install.sh`
    - All dependencies will install at this time
    - To run the app in future after initial installation, you can type `ruby main.rb` from the root 'budgex' folder

If you have any issues with downloading, installing or running the app, please email cab022014@coderacademy.edu.au

---

## Usage

The app works by adding transactions with a date, an amount, a description and a category as a minimum

### Date

Dates are entered in the following format: `YYYY-MM-DD`

This means a date for December 31st 1999 would be entered as `1999-12-31`

Dates provided for adding transactions should be the date the transaction took place, or is expected to take place.

### Amount

Amounts are entered as positive whole numbers or decimals  e.g. `25`, `9.25`

There is a prompt for whether or not the transaction is income (money received) or an expense (outgoing money/purchase)

### Description

Used to identify individual transactions

### Category

A category tag for generic transaction types

For example, two different transactions may have descriptions of "lunch" and "dinner out with friends", but the category for both could be grouped under "FOOD/DRINK"

This can be used for searching or analysing transactions

### Recurring transactions

Transactions can be setup to be recurring into the future - for example, adding the rent payments that are due each month

On top of the start date, amount, description & category - a recurrence end date and the recurrence intervals will be required

### Recurrence Intervals

#### Requires further development to be more user-friendly

There are 2 prompts to enter the recurrence intervals information

The first is for the interval itself, and there are 3 options:

- Week
- Month
- Year

By selecting week, for example, it means the schedule will recur every X number of weeks - the next prompt will ask for how frequently the interval will recur

By entering a 1 at this stage, and having selected Week at the previous prompt - you would be setting up a recurring schedule that occurs every 1 week (i.e. weekly)

If you entered a 2, you would be setting transactions up fortnightly (every 2 weeks)

### Editing Transactions

Transactions can be edited or deleted after they have been setup - to do so, search for a transaction using the search feature, find the transaction you want and enter the ID and date in order to access the editing options

### Balance & Debt Check

Search future balances and check to see if there is a point in the future where your expenses exceed available funds

---

## Command Line Arguments

After successfully signing up in BudgEx, you will have access to the optional command line arguments when launching the app.

### Argument options

Pre-login with `-l` or `--login` and provide username and password:

`ruby main.rb -l username password`

Get current balance with `-b` or `--balance` and provide username and password:

`ruby main.rb -b username password`

These options can also be viewed with the `-h`/`--help` option when launching from CLI e.g. `ruby main.rb -h`
