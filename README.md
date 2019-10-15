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

## Create a file

Next, you’ll add a new file to this repository.

1. Click the **New file** button at the top of the **Source** page.
2. Give the file a filename of **contributors.txt**.
3. Enter your name in the empty file space.
4. Click **Commit** and then **Commit** again in the dialog.
5. Go back to the **Source** page.

Before you move on, go ahead and explore the repository. You've already seen the **Source** page, but check out the **Commits**, **Branches**, and **Settings** pages.

---

## Clone a repository

Use these steps to clone from SourceTree, our client for using the repository command-line free. Cloning allows you to work on your files locally. If you don't yet have SourceTree, [download and install first](https://www.sourcetreeapp.com/). If you prefer to clone from the command line, see [Clone a repository](https://confluence.atlassian.com/x/4whODQ).

1. You’ll see the clone button under the **Source** heading. Click that button.
2. Now click **Check out in SourceTree**. You may need to create a SourceTree account or log in.
3. When you see the **Clone New** dialog in SourceTree, update the destination path and name if you’d like to and then click **Clone**.
4. Open the directory you just created to see your repository’s files.

Now that you're more familiar with your Bitbucket repository, go ahead and add a new file locally. You can [push your change back to Bitbucket with SourceTree](https://confluence.atlassian.com/x/iqyBMg), or you can [add, commit,](https://confluence.atlassian.com/x/8QhODQ) and [push from the command line](https://confluence.atlassian.com/x/NQ0zDQ).
