# gitTodo

- Type: Code Along
- Associated Repo: <https://github.com/Stage2Cohort3/git_todo>

## Prerequisites

- Personal GitHub Account
- git installed
- GitKraken installed

## Instructions

### README on GitHub

1. Have all students sign up for personal GitHub accounts
    - Existing accounts are perfectly fine
1. Give tour of GitHub
    - Repos
    - Issues
    - Forks
    - Pull Requests
1. Direct students to the gitTodo repo

Walk the Students through the following:

1. Fork the repo into their own GitHub account
1. Make a `README.md` file in GitHub
    - `README.md` needs at least three ToDo items with a checklist
1. Commit the file to their master repo
1. Pull Request back into the main repo

Once pull requests start showing up, teachers should start adding comments and requesting changes to the ToDo list through the pull request. Students should respond to the comments and make agreed upon changes in their master branch. The pull request will automatically show the changes made in their master branch.

After some back and forth in the pull requests, teachers should close the pull request.

### git Customization

Use "main" as the default initial branch name.

> `git config --global init.defaultBranch main`

### README through git with GitKraken

1. Explain that git just keeps track of changes to text files, but they are really just files.
1. Demonstrate the following:
    1. Clone a repo locally with GitKraken
    1. See the files in Windows Explorer
    1. Open the `README.md` file with Notepad
    1. Edit the `README.md` file
    1. Save the file, commit the file locally
    1. Show that the change isn't reflected in GitHub
    1. Push the changes up to GitHub
    1. Show that the changes now show up in GitHub
    1. Open a new Pull Request to the main repo
1. Have the students follow the same procedure
1. Ask them to list the instructions for pulling an assignment, and to put that in their `README.md`. Keep requesting changes in the pull request until the list is correct and is well formatted.
    - At a minimum, the list is: Fork main repo -> Clone locally -> Make changes to files -> Commit locally -> Push up to repo -> Pull Request into main repo
    - Advanced: Add screenshots to accompany instructions. Images need to be added and committed to the repo, and the `README.md` needs use relative paths to the images.
1. Once the student's repo looks correct, close the Pull Request.
