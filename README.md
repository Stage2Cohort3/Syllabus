# AAB .NET Core Syllabus

A 5-month Course in .NET Core, OOP, and Backend Software Development

## Units

| Unit Name                                               | Topics                                                                      | Timeframe |
|---------------------------------------------------------|-----------------------------------------------------------------------------|-----------|
| [Hello World](./hello_world/README.md)                  | git, GitHub, Visual Studio, .NET Core Console App                           | 2 Weeks   |
| [OOP Basics](./oop_basics/README.md)                    | C#, Encapsulation, Data Abstraction, Polymorphism, Inheritance, Composition | 3 Weeks   |
| [Consuming REST Interfaces](./consuming_rest/README.md) | HTTP, REST, JSON                                                            | 3 Weeks   |
| [Building REST Interfaces](./building_rest/README.md)   | WebAPI, ASP .NET                                                            | 3 Weeks   |
| [Databases](./databases/README.md)                      | SQL, ERD                                                                    | 2 Weeks   |
| [Windows Services](./windows_services/README.md)        | Building dotnet core Worker Services                                        | 2 Weeks   |
| [Final Project](./final_project/README.md)              | All of the above                                                            | 4 Weeks   |

## Calendar

|   Week | Unit                      | Lesson                                         | Assignment (Overview)        |
|-------:|---------------------------|------------------------------------------------|------------------------------|
|  Jan 8 | Hello World               | Development Setup                              | git Todo and Hello World     |
| Jan 15 | Hello World               | ---                                            | Banking App                  |
| Jan 22 | OOP Basics                | Intro to OOP                                   | Pet Store                    |
| Jan 29 | OOP Basics                | OOP Practice                                   | Rick's Guitar App            |
|  Feb 5 | OOP Basics                | ---                                            | Upgraded Banking App         |
| Feb 12 | Consuming REST Interfaces | GET                                            | AAB Account Balance Report   |
| Feb 19 | Consuming REST Interfaces | POST/PUT                                       | Account Maker App            |
| Feb 26 | Consuming REST Interfaces | ---                                            | MailCat Email Console Viewer |
|  Mar 5 | Building REST Interfaces  | Getting started with ASP.NET                   | Mock-e-dex                   |
| Mar 12 | Building REST Interfaces  | Query Parameters                               | Searchable Mock-e-dex        |
| Mar 19 | Building REST Interfaces  | ---                                            | Task API                     |
| Mar 26 | Databases                 | Intro to SQL/ERD                               | Mystery in SQL City          |
|  Apr 2 | Databases                 | Entity Framework and .NET Core ORM             | Persistent Task API          |
|  Apr 9 | Windows Services          | Intro to Windows Services                      | Timer and Worker             |
| Apr 16 | Windows Services          | ---                                            | BLC Vault Rebalancer         |
| Apr 23 | Final Project             | Final Project Description and Initial Planning | Final Project Work Session   |
| Apr 30 | Final Project             | ---                                            | Final Project Work Session   |
|  May 7 | Final Project             | ---                                            | Final Project Work Session   |
| May 14 | Final Project             | ---                                            | Presentation                 |

## Assignments and Projects

All assignments will be done through GitHub.

### GitHub Flow for Single Assignments

1. Instructor makes GitHub Repo for assignment
    - Skip this step when using previously created assignments
1. Students fork the repo into their personal GitHub
1. Students clone their repo locally and work on the assignment
    - Questions about their own code or solutions should be made as issues on their personal fork of the repo
    - Questions about the assignment or for clarification of details should be made as issues on the original repo
1. When a student is finished with their assignment, they will Pull Request it back to the original repo
    - Students should work and commit in master
1. Teachers give feedback on the Pull Request
    - Leave comments, code review in the code itself
1. As Students receive feedback, they can continue to make changes they commit to their master branch. This will update the Pull Request
1. Once the teacher thinks the assignment is complete to their liking, they can close the Pull Request

### GitHub Flow for Longer Projects

Longer group projects will be hosted in an organization GitHub repo. The teacher will create the empty repo and ensure all group members have appropriate access to it.

Students will use branching to add features. Teachers and Students will add Issues that need to be addressed, and referenced by number in commit messages.
