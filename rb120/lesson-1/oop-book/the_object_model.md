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
```ruby
irb :001 > "hello".class
=> String
irb :002 > "world".class
=> String
``` 

Classes define objects-- a class is a blueprint for what its objects should be able to do and what they should be made of. Defining a class is similar to defining a method:

```ruby
class GoodDog
end 

sparky = GoodDog.new
```

This process gives us a new object `sparky` which is said to be an instance of the `GoodDog` class.


### Modules

Modules are collections of behavior that can be used in other classes via `mixins`. We can mix in modules to a class with _include_ as below. In this example, we have a `Speak` module but we want to re-use it for both a human and a dog object:

```ruby
 module Speak
  def speak(sound)
    puts sound 
  end
 end
 
 class GoodDog
   include Speak
 end 

 class HumanBeing
   include Speak
  end 

 sparky = GoodDog.new
 sparky.speak("Arf!") # => Arf!
 bob = HumanBeing.new
 bob.speak("Hello!")  # => Hello!
```

With the code above, both `bob` and `sparky` have access to the `Speak` module's functionality but each use it in their own way. 

### Method Lookup

