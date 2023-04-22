The range of reach that a given variable covers. 

|   **Variable Type**  | **Denoted by** |     **Example**   | **Rules**|
| ---------------- |:----------:|:--------------:|:-------|
| local variable   | just text  |   `answer`     |     local variables live as long as the method lives.    |
| instance variable| `@`          |  `@answer`    |    ivars live on after the method definition, they live as long as the object lives. They are object specific and therefore _NOT_ shared amongst instance of the same class. |
| [[class variables]]   | `@@`         |   `@@answer`    |   class variables are available and shared amongst all instances of the class.     |
| constant variable| capital letters| `ANSWER` | constants are available first lexically, then via the inheritance chain, and lastly, by top-level scope. Using the namespace resolution operator prevents the lookup path from going all the way up to top-level.    |
| global variable  | `@@`    | `$answer`|  TBD         |
 
tags: #major 