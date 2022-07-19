This directory contains a subdirectory for each course in the LS curriculum.
Each course directory, in turn, contains more directories for each lesson and project in the course.

There are several naming conventions used for the comments in the repo, as well as the branches. 
Convetions used in the comments are as follows:

#### Naming Convention for commits
- `CH#-E additional comment`---> this denotes the chapter in a book, followed by te `E` tag which indicates the push is related to exercises, and lastly an additional comment if needed.

- `N-` this indicates the commit pertains to notes. This type of commit is used almost exclusevely in the `ls-md` directory.

#### Naming convetion for branches
Branches have the following naming convention:

- Quick Tests
  - `TV1` this naming convention starts with `T` indicating it is a simple, quick test. If more than one is needed after the previous is deleted, the version number goes up, `TV2`, `TV3`, etc.
  - This naming convention will likely be used in exercises, where the change doesnt have major impact

- `P` the `P` denotes that this is a project. Projects, like the mortgage calculator in `RB101`, will have such branches.
  - Ft---> Feature
  - Bug ---> Bug Fix
  
  ## Full Example

|     Branch Name    |      Commit Tag + Comment                    |
| -------------------|:--------------------------------------------:|
| TV1-fibonacci      |    SM-E1 fibonacci sequence                  |
| PFt-mortgage-calc  |    PFt- adding rounding capability           |
| PBug-mortage-calc  |    PBug Fixing program bug with user input   |