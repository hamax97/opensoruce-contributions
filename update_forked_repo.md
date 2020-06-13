# Update a Local Fork at the Terminal

1. With a locally cloned repository, you can do the same with git in your CLI as follows. First change to your repository folder, then confirm:

    `git remote -v`

2. Specify a remote upstream repo to sync with your fork:

    git remote add upstream https://github.com/OriginalOwner/OriginalProject.git

3. Verify:

    `git remote -v`

4. Fetch branches and commits from the upstream repo. You’ll be storing the commits to master in a local branch upstream/master:

    `git fetch upstream`

5. Checkout your fork’s local master, then merge changes from upstream/master into it.

    `git checkout master`
    `git merge upstream/master`

6. Push changes to update your fork on Github.

### From: https://rick.cogley.info/post/update-your-forked-repository-directly-on-github/