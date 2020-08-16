# Unit 7 - Non-REST Applications

## Purpose of Unit

The purpose of Unit Seven is to familiarize students with .NET Core applications that are not REST based. These include Windows Services (workers) and Scheduled Tasks (CRON jobs)

## Topics Covered

## Lessons

| Name | Associated Repo | Type |
|------|-----------------|------|
| [Intro to Scheduled Tasks](<!-- TODO -->) | <!-- TODO --> | Code Along |
| [Reminder Email](<!-- TODO -->) | <!-- TODO --> | Solo Project |
| [Intro to Windows Services](<!-- TODO -->) | <!-- TODO --> | Code Along |
| [Asynchronous Processing](<!-- TODO -->) | <!-- TODO --> | Code Along |
| [WC Vault Rebalancer](<!-- TODO -->) | <!-- TODO --> | Group Project |

## WC Vault Rebalancer

Contdrisk is stored in a Vault, with the counts of each of the coins that belong to that account. The coins can be Fluyts, Falx, Katts, or Drakkars.

In order to keep accounts in some sort of meaningful coin count, many customers use our Vault Rebalancing system, where we convert Drakkars into Katts, Katts into Falx, and Falx into Fluyts.

Currently, the process is very manual, and error prone (due to the conversion rates between all three coins). We want to develop a system with an API that can be hit with an account id, and will rebalance the vault for them. The rebalance needs to happen at some point in the future.

### Coin Conversions

The conversions between the Contdrisk coins is as follows:

- 31 Falx to a Fluyt
- 8 Katts to a Falx
- 14 Drakkars to a Katt

### Example

Account starts with:

- 999 Fluyt
- 77 Falx
- 59 Katt
- 27 Drakkar

After rebalancing, the account should now read:

- 1001 Fluyt
- 22 Falx
- 3 Katt
- 13 Drakkar

In order to do apply the rebalance, the application will need to create two transactions on the account: one to DEBIT the coins that need to be reduced (probably Falx, Katt, and Drakkar), and one to CREDIT the coins that need to be increased (probably Fluyts)

### Things to consider

- What if the account is locked?
- What if the given account isn't CDK?
- What if the given account doesn't exist?
