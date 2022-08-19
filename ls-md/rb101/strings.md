here docs allow us to write multi line strings

multistring <<-MSG
string goes here
MSG

### Strings are not objects, they are not true collections 

Reference [collections page](https://launchschool.com/lessons/85376b6d/assignments/39c98ed0) 

Strings behave similar to collections but they are not. When you access a single character in a string, the return value is a brand new string. If it were a real collection the calls to individual characters would reference the same object.
```
char1 = str[2]                     # => "c"
char2 = str[2]                     # => "c"
char1.object_id == char2.object_id # => false
```
