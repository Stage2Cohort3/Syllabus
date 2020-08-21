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
| [BLC Vault Rebalancer](<!-- TODO -->) | <!-- TODO --> | Group Project |

## BLC Vault Rebalancer

BluCoin is a physical currency stored in a Vault, with the counts of each of the coins that belong to that account. The coins can be Tuns, Scraposts, Katts, or Kibels.

In order to keep accounts in some sort of meaningful coin count, many customers use our Vault Rebalancing system, where we convert Kibels into Katts, Katts into Scraposts and Scraposts into Tuns.

Currently, the process is very manual, and error prone (due to the conversion rates between all four coins). We want to develop a system with an API that can be hit with an account id, and will rebalance the vault for them. The rebalance needs to happen at some point in the future.

### Coin Conversions

The conversions between the BluCoin coins is as follows:

- 31 Scraposts to a Tun
- 8 Katts to a Scrapost
- 14 Kibels to a Katt

### Example

Account starts with:

- 999 Tuns
- 77 Scraposts
- 59 Katts
- 27 Kibels

After rebalancing, the account should now read:

- 1001 Tuns
- 22 Scraposts
- 3 Katts
- 13 Kibels

In order to do apply the rebalance, the application will need to create two transactions on the account: one to DEBIT the coins that need to be reduced (probably Scraposts, Katts, and Kibels), and one to CREDIT the coins that need to be increased (probably Tuns)

### Things to consider

- What if the account is locked?
- What if the given account isn't BLC?
- What if the given account doesn't exist?
