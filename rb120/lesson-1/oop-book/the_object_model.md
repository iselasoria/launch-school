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

Ruby follows a distinct lookup path that it follows each time it wants to search for a method. 
We can see the method lookup path for the `GoodDog` class by calling the `ancestors` method on it:

```ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts "---GoodDog ancestors---"
puts GoodDog.ancestors
puts ''
puts "---HumanBeing ancestors---"
puts HumanBeing.ancestors
```

The code above would output:

```
---GoodDog ancestors---
GoodDog
Speak
Object
Kernel
BasicObject

---HumanBeing ancestors---
HumanBeing
Speak
Object
Kernel
BasicObject
```

As we can see, ruby will first search the current class, `HumanBeing` or `GoodDog`, if it doesn't find the method, it will search in the next custom class above that, the `Speak` module, if it still doesn't find anything, it will search in the `object` class, and so on until it does find it or decided that it cannot locate it at all.

---
### Exercises
1. Create an object in ruby:
```ruby
class ThisClass
end

this_object = ThisClass.new
```
2. What is a module and what's its purpose? How are they used with classes? Create a module for the class you created above and include it properly.

A module allows for shared functionality, much like a class but a module cannot create objects, only classes can. Modules can be used to extend the functionality of a class via mixins but they rely on classes to create objects. We use modules in a class by calling the `include` method followed by the module name. 

```ruby
module Move
  def move(motion)
    puts motion
  end
end

class ThisClass
  include Move
end

this_object = ThisClass.new
```