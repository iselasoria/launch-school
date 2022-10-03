`git add .`

`git commit -m "Your comment here"`

Remove a file from the tracked list:
`git reset <file_name>`  

Remove a whole folder:
`git rm -r --cached <folder>` [Making `git` forget](https://stackoverflow.com/questions/1274057/how-do-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore)

Search for a word in a commit:
Here, the part after `grep=` is our search term
`git log -g --grep=remember`



## Getting back to a given commit
You have a few changes in a secondary branch, you come back to master and want to merge with a commit comment and find out that the branches are diverged, that you have several commits in one and 1 in the remote branch. You need to get back to a working version of the code and work from there.

Look on the log using `git log` or viewing it on git lens on  VS Code.  Identify the
point in which your code was working, and note the commit number. 
To revert back to this point use, `git reset --hard commitnumberhere`

Check the remote repo back and forth where the change occurred. `git` might suggest running a git pull, now probably you will have a single commit ahead, which corresponds to the commit of the merge. Now you can do a `git pull`. Flip back and forth between the remote and the local repo to ensure that the changes are as expected. Now check the secondary branch, flip back to master and do the merge then. No issues should come up this way now.