# Databases

## Purpose of Unit

The purpose of Unit One is to familiarize students with SQL, relational databases, and the tool used to interact with them.

## Topics Covered

### Tools

- SSMS
- MSSQL

## Lessons

| Name | Associated Repo | Type |
|------|-----------------|------|
| [Intro to SQL](<!-- TODO -->) | <!-- TODO --> | Code Along |
| [Intro to ERDs](<!-- TODO -->) | <!-- TODO --> | Code Along |
| [School ERD Exercise](<!-- TODO -->) | <!-- TODO --> | Group Project |
| [Mystery in SQL City](<!-- TODO -->) | <!-- TODO --> | Solo Project |
| [Provisioning a SQL Server on Azure](<!-- TODO -->) | <!-- TODO --> | Code Along |
| [DAO's in C#](<!-- TODO -->) | <!-- TODO --> | Code Along |
| [Mock-e-dex with persistance](<!-- TODO -->) | <!-- TODO --> | Solo Project

### Mystery in SQL City

sql_mystery.bak is a sql server version of the original SQL City Mystery.

1. Open SSMS and connect to `(localdb)\MSSQLLocalDB`
1. Right click `Databases`
1. `Restore Databases`
1. Set the `Source` to Device, and add the sql_mystery.bak file as a backup device
1. Click Ok. After a second, the mysteries database should now exist for that user!
