## Object Oriented Programming
---
### Intro 
The basic premise behind `OOP` is that it helps programmers building larger more complex programs while minimizing the risk of things breaking along the way. When programs become complex, one small change somewhere can trickle down and break multiple things along the chain. `OOP` lets programers make updates that will trickle down to all involved partied minimizing this risk.

`Encapsulation`

Encapsulation refers to the practice of hiding certain pieces of functionality from other parts of the code. This is helpful when trying to prevent unwanted changes as one must be explicitly intentional about the desired outcome. 


`Polymorphysm`

Polymorphysim refers to the flexibility of data to respond to a common interface (method for example). This means that if we had a method `move` it could potentially be re-used on objects that can represent a cat, a car, a person-- as long as the object is compatible with `move`.


### Vocabulary

- `inheritance` -- a class inheriting behavior from another class.
- `superclass`-- the class that "hands down" attributes through inheritance. This typically handles the functionality that can be reused throughout a program.
- `subclass`-- a more granular piece of code that handles specific functionality that likely won't  be reused throughout. 
- `module`-- similar to classes, modules contain shared behavior, the differences is that in a module you cannot create an object. A module must be mixed with a class using _include_ method invocation.
- `mixin`-- a _mixin_ is the mix of a class and a module. Doing this, allows the behaviors declared in the module to become available to the class and its objects.


### Objects 

Objects are created from classes. Classes can be thought of as molds and objects as the things we create using those molds. 

In the example below, we can make two objects, both from the String Class:
```
1| irb :001 > "hello".class
2| => String
3| irb :002 > "world".class
4| => String
``` 
