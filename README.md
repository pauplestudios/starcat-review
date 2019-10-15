## Getting Started with this Repository

1. Install Node Modules: **npm install**
2. Install Composer: **composer install**
3. Run Webpack to compile scripts, styles and assets: **yarn start**
4. Run Tests

---

## Code Organisation

1. There should be **no WordPress code inside /components folder**.
2. Components should only have **\$args** as input, there should be no other dependencies / global settings used inside.
3. Blocks are used only in components and are not directly used anywhere.
4. To recap, Templates->Widget_Makers->Components->Blocks.

---

## HTML, CSS, Javascript

The basic rules

1. Every basic component's id/class should start with **hrp-** prefix
2. Names of elements should be hypenated like **hrp-categories-list**
3. Do not have more than 3 levels of nesting for SCSS files

---

## Development Process

How to work in development

1. Make sure every task you do has an issue in Bitbucket / Jira. If it's not, then create one.
2. After making sure that an issue exists, create a branch with the id and name of that issue.
3. Use **GitFlow Method** of branching ( https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow )
4. Always create Pull Requests for every task/issue

---

## Clone a repository

Use these steps to clone from SourceTree, our client for using the repository command-line free. Cloning allows you to work on your files locally. If you don't yet have SourceTree, [download and install first](https://www.sourcetreeapp.com/). If you prefer to clone from the command line, see [Clone a repository](https://confluence.atlassian.com/x/4whODQ).

1. You’ll see the clone button under the **Source** heading. Click that button.
2. Now click **Check out in SourceTree**. You may need to create a SourceTree account or log in.
3. When you see the **Clone New** dialog in SourceTree, update the destination path and name if you’d like to and then click **Clone**.
4. Open the directory you just created to see your repository’s files.

Now that you're more familiar with your Bitbucket repository, go ahead and add a new file locally. You can [push your change back to Bitbucket with SourceTree](https://confluence.atlassian.com/x/iqyBMg), or you can [add, commit,](https://confluence.atlassian.com/x/8QhODQ) and [push from the command line](https://confluence.atlassian.com/x/NQ0zDQ).
