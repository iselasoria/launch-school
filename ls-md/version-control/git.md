`git add .`

`git commit -m "Your comment here"`

Remove a file from the tracked list:
`git reset <file_name>`  

Remove a whole folder:
`git rm -r --cached <folder>` [Making `git` forget](https://stackoverflow.com/questions/1274057/how-do-i-make-git-forget-about-a-file-that-was-tracked-but-is-now-in-gitignore)

Search for a word in a commit:
Here, the part after `grep=` is our search term
`git log -g --grep=remember`