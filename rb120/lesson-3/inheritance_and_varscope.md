## Inheritance and Variable Scope
---

### Instance Variables

We have to pay attention to the inheritance chain. For the most part, instance variables behave as expected but not always. In the code below, the constructor method in the `Dog` class overrides the constructor in the superclass `Animal`. Since the superclass constructor is where we define the instance variable `@name` we don't have access to it from inside the instance method `dog_name`.

```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"    # can @name be referenced here?
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name                       # => bark! bark!  bark! bark!
```

The main things to remember are that:
> Instance methods are inherited, but instance variables and their values are not. This makes sense when we consider the fact that an instance of a class as an individual with its set of defining attributes.

> An instance variable must be initialized before we attempt to reference it. Meaning, if an instance method initializes an instance variable but the method itself is never executed, we do not have access to the instance variable because in theory it does not exist!

```ruby 
module Swim
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swim

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
teddy.swim                                  # => nil
```

In the code above, since we reference the instance variable `@can_swim` directly, without having called the constructor that initializes it (the `enable_swimming` instance method), we actually do not have access to it; _uninitialized ivars return nil._


### Class Variables 
Class variables are passed down to subclasses from a parent class. But there is one potentially big problem:
Since a class method is available across every instance of the class, this means instance methods in the subclasses have the potential to override the class method of the superclass and thus disperse the value they gave it to the rest of the inheriting-subclasses! 


```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

Vehicle.wheels                              # => 4

class Motorcycle < Vehicle
  @@wheels = 2
end

Motorcycle.wheels                           # => 2
Vehicle.wheels                              # => 2  Yikes!
```

Keep in the back of your mind (but don't worry about it yet) the concept of _class instance variables_ which are a solution around this problem.

### Constants 
Ruby will first attempt to resolve constants in the lexical scope. If it cannot find a constant, it will then look up the inheritance hierarchy of the structure that referenced the constant.

```ruby 
module FourWheeler
  WHEELS = 4
end

class Vehicle
  def maintenance
    "Changing #{WHEELS} tires."
  end
end

class Car < Vehicle
  include FourWheeler

  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels        # => 4
puts car.maintenance   # => NameError: uninitialized constant Vehicle::WHEELS
```

In the code above, line 103 calls instance method `wheels` on an instance of `Car` class. Ruby looks for the constant
`WHEELS` in the lexical scope and doesn't find it so it goes up to the next closest ancestor; the module `FourWheeler`
where it finds the constants and it uses it. 

However, line 104, the call to `maintenance` method happens on an instance of `Car` _but_ the enclosing structure of the
reference is not the `Car` class, it is the `Vehicle` class because that is where the method is defined that attempts to 
use `WHEELS`. The `Vehicle` class does not have a definition/initialization of `WHEELS` so it looks in _its_ ancestor chain: `Object`, `Kernel` and `BasicObject` and it ultimately does not find it so it throws a `NameError`.

Lastly, Ruby will look in the top level scope. Lexical scope does not include top level scope-- they are different!
```ruby
class Vehicle
  WHEELS = 4
end

WHEELS = 6

class Car < Vehicle
  def wheels
    WHEELS
  end
end

car = Car.new
puts car.wheels        # => 4
```
That code outputs 4, but if we remove the initialization of the constant inside the `Vehicle` class, we can now access top-level scope `WHEELS` as defined on line 121.

**Full Constant Lookup Path**
> lexical scope of the reference -> inheritance chain of enclosing structure -> top level
---
### Summary