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

## Element Assignment
This is a destructive action, so the original object is modified
```
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
```

## Iterating Over Strins
`String#size` and `String#length` do the same thing.


## Compacting occurance of a character
`String#squeeze` is used to cmpact the occurance of a character in a string. 
```
"yellow moon".squeeze                  #=> "yelow mon"
"  now   is  the".squeeze(" ")         #=> " now is the"
"putters shoot balls".squeeze("m-z")   #=> "puters shot balls"
```

Notice how passing it some argument results in the string getting squeezed for all multiple occurances that are part of that range.

## `String#count`

