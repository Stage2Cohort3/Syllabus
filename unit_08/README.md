# Unit 8 - Final Project

## Purpose of Unit

The purpose of Unit Eight is to give students familiarity with building a project from scratch. This will include working with other team members to distribute work, and will have changing requirements as the project proceeds. The sessions will be used by students to work on the project, with mentors on hand to answer questions but not to lead a lecture.

## Project Summary

### Financial Advisor Assignments

The company provides a special feature that other banks don't provide. Every account holder is assigned to a real Financial Advisor. This Financial Advisor keeps an eye on the account holder's transactions and makes recommendations for things like new or different account types to best use their money, or how to improve their Account Score, or planning for retirement and vacations.

#### Terminology and Abbreviations

| Term | Definition |
|:------:|------------|
| FA | Financial Advisor |
| AH | Account Holder |
| GCS | Galactic Currency Standard |
| BLC | BluCoin |

#### Base Requirements

We need a system that tracks and assigns Financial Advisors with the following requirements:

1. New Accounts are automatically assigned an FA
    - If the new account belongs to an existing AH with an assigned FA, don't assign again!
1. FAs are emailed when they have been assigned a new AH
1. FAs are emailed when an existing AH they are assigned to creates a new account
1. AHs are emailed when they have been assigned a new FA
1. Account assignments are evenly distributed among available FAs
    - Try to keep FAs to a maximum of 100 accounts, but if all FAs are at max capacity, we will have to assign them more than 100 accounts
    - If new FAs become available, reassign accounts to new FAs to reduce the workload of overburdened FAs
    - If an existing FA becomes inactive, reassign all of their accounts to new FAs
    - Any reassignments should have all emails re-sent with current details

#### Stretch Requirements

1. FAs are emailed on the following conditions:
    - Account goes negative
    - Account total CREDIT transactions changes by 10% from previous 6-month average
    - Account transaction contains a `FRAUDULENT` keyword (to be defined)
1. Accounts receive a one-time CREDIT at 6-months of continuous positive balance
1. FAs are designated as either GCS or BLC Advisors, and are only assigned accounts with those currencies
    - What happens if an existing AH creates a new account in a different currency?

### Recommended Architecture

1. FAAssignments API
    - This is the persistence of FA assignments, and the domain is the FAs and their current assignments
1. Schedule Tasks for
    - Changes in BankersChoice (new accounts, new transactions, etc)
    - Changes in PersonablePeople (FA changes)
    - Scheduled tasks should only queue up work for workers to complete
1. Worker applications for
    - New Accounts
    - FA Balancing
    - Sending Emails
    - Updating Accounts?
1. Two databases:
    1. FAAssignments domain database
    1. Worker queues (instead of a Rabbit)
