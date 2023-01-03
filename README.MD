This directory contains a subdirectory for each course in the LS curriculum.
Each course directory, in turn, contains more directories for each lesson and project in the course.

---

## Directory break-down

**`ls-md`** 

The materials listed under the directory `ls-md` are all notes on the various topics covered. Notes here are not organized by class or lesson but rather by concept. The best view of these is the local Obsidian valut for personal use.

**Class Directories**


The directory labeled with the class name, `rb101` for example, contains exercises that are embeded in the course material as well as projects.

There are several naming conventions used for the comments in the repo, as well as the branches. 
Convetions used in the comments are as follows:


## Naming Convention for commits
- `CH#-E additional comment`---> this denotes the chapter in a book, followed by te `E` tag which indicates the push is related to exercises, and lastly an additional comment if needed.

- `N-` this indicates the commit pertains to notes. This type of commit is used almost exclusevely in the `ls-md` directory.
- `MP-` Mastery Practice: this is the code used to identify commits that are related to material used to master the fundamentals. This material is not necessarily related to any one class but rather to the mastery of the fundamental concepts presented in RB101.

## Naming convetion for branches
Branches have the following naming convention:

- Quick Tests
  - `TV1` this naming convention starts with `T` indicating it is a simple, quick test. If more than one is needed after the previous is deleted, the version number goes up, `TV2`, `TV3`, etc.
  - This naming convention will likely be used in exercises, where the change doesnt have major impact

- `P` the `P` denotes that this is a project. Projects, like the mortgage calculator in `RB101`, will have such branches.
  - Ft---> Feature
  - Bug ---> Bug Fix
  
---

### Full Example

|     Branch Name    |      Commit Tag + Comment                    |
| -------------------|:--------------------------------------------:|
| TV1-fibonacci      |    SM-E1 fibonacci sequence                  |
| PFt-mortgage-calc  |    PFt- adding rounding capability           |
| PBug-mortage-calc  |    PBug Fixing program bug with user input   |