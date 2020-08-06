# `hello world`

- Type: Code Along 
- Associated Repo: **<!-- TODO -->**

## Prerequisites 

- Personal GitHub Account
- GitKraken Free Edition installed
- Visual Studio Enterprise Edition 2019 installed

## Instructions

1. Direct students to the main repo, fork it, clone it locally, and read the `README.md` file

## Code Along

1. Create a new solution (.NET Core Console App)
    - Be clear about:
        - Which template to select, including language (no VB!)
        - What directory to pick
1. Find Program.cs
1. Explain the `using`'s at the top
    - "They are like the `#include` you've seen in your C programs"
1. Explain the `namespace`
    - "It's like a bucket for code that all belongs to a similar thing. This helps us to keep all the related code together, and also makes naming things easier because names only have to be unique in a namespace, not an entire application"
1. Explain `void main()`
    - "This is the code that will run when the application is run."
1. Write the phrase "Hello World!" to the terminal
    - `Console.WriteLine("Hello World!");`
1. Run the program and make sure the terminal prints the phrase.
1. Add the Visual Studio `.gitignore`
    - Explain that a gitignore file tells git what files to ignore when committing them. This is useful for keeping build files, binary files, and secrets out of GitHub.
    - You will likely need to show how to show hidden files and folders to see the .gitignore (Start -> "Show Hidden Files and Folders" -> Select `Show hidden files, folders, and drives` and un-check `Hide extensions for known file times`)
    - <https://raw.githubusercontent.com/github/gitignore/master/VisualStudio.gitignore>
1. Commit the code to your local git repo using GitKraken
1. Push the code up to GitHub, and double check that it made it!
1. Add the following features:
    - Ask for the user's name, and say hello to them
    - Display a menu with various greetings, and let the user pick their greeting of choice (if statements to decide which greeting to give)
(greeter app?)