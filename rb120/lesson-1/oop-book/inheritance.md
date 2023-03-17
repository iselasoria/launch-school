## Inheritance
---

The concept of inheritance refers to a class's ability to inherit behavior from another class. Inheritance allows us to extract code to superclasses when we have objects that can share it.


### Class Inheritance
The code bellow shows how inheritance is implemented:
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal # the `<` symbol shows that GoodDog inherits from the Animal class
end

class Cat < Animal
end

sparky = GoodDog.new
paws = Cat.new
puts sparky.speak           # => Hello!
puts paws.speak             # => Hello!
```

We could choose to override the `speak` method in the `Animal` class by simply defining another with the same name inside `GoodDog` class. Ruby looks up methods in a linear chain and so it will first look in the current class where the object is, and then any ancestor classes. 
### super 
What if we wanted to also use the superclass's method? We can do this by calling `super` and expanding the functionality of a class. 
```ruby
class Animal
  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  def speak
    super + " from GoodDog class"
  end
end

sparky = GoodDog.new
sparky.speak        # => "Hello! from GoodDog class"
```
In the code above, ruby finds the `GoodDog` `speak` method first, but this method calls `super` so this means Ruby is now going to go to the superclass to find another method by that name.

`super` can also be called from `initialize` and if this is the case, it will forward the arguments from the method from which it was called. This is why we end up with `@name="brown"`.

```ruby
class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")        # => #<GoodDog:0x007fb40b1e6718 @color="brown", @name="brown">
```


### Mixing in Modules  (napespace too)
Inherited behavior isnt always so linear; sometimes we want some horizontality. 

For example, we can have an `Animal` superclass, right bellow that a `Fish` class and horizontal to that, a `Mammals` class. 
If we had a `swim` method, that might not be exclusive to the `Fish` class-- some mammals can swim. In cases like these, we can make use of `mixins`. `Mixins` allow us to share methods amongst classes that don't have a linear inheritance. 
```ruby
module Swimmable
  def swim
    "I'm swimming!"
  end
end

class Animal; end

class Fish < Animal
  include Swimmable         # mixing in Swimmable module
end

class Mammal < Animal
end

class Cat < Mammal
end

class Dog < Mammal
  include Swimmable         # mixing in Swimmable module
end
```
The above code means that now both  objects in the `Fish` and `Dog` classes can swim, but `Cat` objects cannot. 
### Inheritance vs Modules 
| Inheritance                |          Modules          |
| -------------------------- |:-------------------------:|
| class inheritance          | interface inheritance     |
| linear                     | horizontal                |
| inherits from 1 class      | mix in as many modules    |
| `is-a` relationship        | `has-a` relationship      |
| can intantiate objects     | cannot make objects       |

`namespacing` refers to organizing similar classes under a module. 
### Method Lookup Path 
The order in which include modules matters. Ruby will first look in the _last_ module we included in our code. 
```ruby
module Walkable
  def walk
    "I'm walking."
  end
end

module Swimmable
  def swim
    "I'm swimming."
  end
end

module Climbable
  def climb
    "I'm climbing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end
```
Adding this means that `GoodDog` objects have access to not only the `Animal` methods but also methods in the `walkable` module since this was included in the `Animal` superclass.
```ruby
class GoodDog < Animal
  include Swimmable
  include Climbable
end

puts "---GoodDog method lookup---"
puts GoodDog.ancestors
```


### Private, Protected, and Public 

### Accidental Method Overriding 

---
## Summary 
