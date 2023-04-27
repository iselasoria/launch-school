

## 1
```ruby
class Person
  attr_reader :name

  def set_name
    @name = 'Bob'
  end
end

bob = Person.new
p bob
p bob.set_name
bob.name
```

**What is output and why? What does this demonstrate about instance variables that differentiates them from local variables?**


The code outputs nil. The class method `new` triggers the constructor that instantiates the object, however,
since the instance variable gets set inside the set_name instance method (not in the initialize) and we never actually call that, the ivar is never set.
By default, Ruby will give uninitialized instance variables a value of nil. This differs from local variables, calling
an uninitialized local variable will raise an error.

---
## 2

```ruby
module Swimmable
  def enable_swimming
    @can_swim = true
  end
end

class Dog
  include Swimmable

  def swim
    "swimming!" if @can_swim
  end
end

teddy = Dog.new
p teddy.swim
```

**What is output and why? What does this demonstrate about instance variables?**

This code will output `nil` because the `@can_swim` instance variable gets set inside the `enable_swimmign` instance method and it never gets called. This demonstrates that instance variables are NOT inherited, only the beviours are. A simple check with `p Dog.instance_methods` will show that we do have access to the method, but not to the instance variable it initializes.
```ruby
[:swim, :enable_swimming, :pry, :__binding__,....]
```
---

## 3
```ruby
module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape
```

**What is output and why? What does this demonstrate about constant scope? What does self refer to in each of the 3 methods above?**

The first print will output `4` because the call to sides is happening on the class `Square` which means we look for a class method up the inheritance chain and we find that defined in `Shape` and passed down to `Quadrilateral` and in turn passed down again to `Square`.
The second print will also output 4, but this time we are instantiating a `Square` object first, and then calling the `sides` instance variable on the instance. If we look closely at the implementation of `sides` instance method, it pretty much does what the class method did-- tries to resolve the constant by namespacing at the class level and again, it is able to resolve the constant in the `Quadrilateral` class.
Lastly, when we instantiate a `Square` and then call `describe_shape` we get an error because the `SIDES` constant is not namespaced and Ruby looks it up in the inheritance chain above the module and can't resolve it.

---
## 4
```ruby
class AnimalClass
  attr_accessor :name, :animals

  def initialize(name)
    @name = name
    @animals = []
  end

  def <<(animal)
    animals << animal
  end

  def +(other_class)
    animals + other_class.animals
  end
end

class Animal
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

mammals = AnimalClass.new('Mammals')
mammals << Animal.new('Human')
mammals << Animal.new('Dog')
mammals << Animal.new('Cat')

birds = AnimalClass.new('Birds')
birds << Animal.new('Eagle')
birds << Animal.new('Blue Jay')
birds << Animal.new('Penguin')

some_animal_classes = mammals + birds

p some_animal_classes
```
**What is output? Is this what we would expect when using `AnimalClass#+`? If not, how could we adjust the implementation of `AnimalClass#+` to be more in line with what we'd expect the method to return?**

The code gives us an array object. This is unexpected because from an addition method, we'd expect that same object type to be returned. ex) apples + apples cannot equal pears.
We can adjust the implementation of the addition method to instantiate a temp `AnimalClass` structure and then pushing the animals from both categories into that temp structure and returning it.
```ruby
def +(other)
  temp_animal_list = AnimalClass.new('All animals')
  temp_animal_list << animals + other.animals
  temp_animal_list
end
```
---
## 5

```Ruby
class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
  end

  def change_info(n, h, w)
    name = n
    height = h
    weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end
end


sparky = GoodDog.new('Spartacus', '12 inches', '10 lbs')
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info
# => Spartacus weighs 10 lbs and is 12 inches tall.
```

**We expect the code above to output ”Spartacus weighs 45 lbs and is 24 inches tall.” Why does our change_info method not work as expected?**

The code as it was was initializing local variables for name, height and weight inside the `change_info` instance method.
The fix is to append self to ensure we are using the setter methods for those ivars.

---
## 6
```ruby
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def change_name
    name = name.upcase # bug
  end
end

bob = Person.new('Bob')
p bob.name
bob.change_name
p bob.name

```
**In the code above, we hope to output 'BOB' on line 16. Instead, we raise an error. Why? How could we adjust this code to output 'BOB'?**

The issue is that the `change_name` method is not actually making a reference to the `name` setter method, it is initializing a local variable by that same name.
The solution is to prepend the keyword `self` to name inside the `change_name`
method so we can be sure we are using the setter.

---
## 7
```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels

class Motorcycle < Vehicle
  @@wheels = 2
end

p Motorcycle.wheels
p Vehicle.wheels

class Car < Vehicle; end

p Vehicle.wheels
p Motorcycle.wheels
p Car.wheels
```
**What does the code above output, and why? What does this demonstrate about class variables, and why we should avoid using class variables when working with inheritance?**

The code will output 4 the first time it is called (line 9) and then 2 for all the other print statements. Class variables are shared amongst all instances of the class and the subclasses. We should avoid using them because changing it in one place will change it and impact all the instances that have access to it.

---
## 8
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

bruno = GoodDog.new("brown")
p bruno
```
**What is output and why? What does this demonstrate about super?**

The code above will output a string representation of an instance of `GoodDog` which will contain instance variables `@name` and `@color`, both having the value "brown". The subclass `GoodDog`inherits from `Animal` and the superclass has a constructor that takes a name only. So when we initialize a `GoodDog` object, we are first letting the constructor go search for the constructor in the superclass, run it, then come back and add to it. Since we pass only the color "brown" as the argument to the constructor, the `super` keyword (without arguments) will forward that argument to the superclass constructor and in turn the constructor will use it to set the name, then when we come back to the constructor in the subclass, it will use the argument to extend the functionality and set the `@color` to that too.

---
## 9
```ruby
class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")

```
**What is output and why? What does this demonstrate about super?**
This code will raise an ArgumentError. The use of the `super` keyword in the initialize in `Bear` class yields the spotlight to the initialize in the `Animal` class which does not take any arguments. So since we passed "black" as an argument, and `super` without arguments by default forwarded the string "black" to the constructor in the initialize method, we get an error that it got an argument and was not expecting any.

---


## 10
---

## 11
---
## 12
---



## 19

**What is the attr_accessor method, and why wouldn’t we want to just add attr_accessor methods for every instance variable in our class? Give an example.**

attr_accessor gives us access to a getter and a setter method at once. One good reason to not use attr_accessor everywhere is (in the spirit of encapsulation), it is best to keep certain sections of the code hidden from the rest of the codebase. This makes every change a lot more intentional and adds a layer of protection. We should only expose the bare minimum amount of code to other sections of the codebase as is necessary for them to function. For example, in the code below, we hide away the setter method, this prevents Blanche from lying about her age.

```ruby
class GoldenGirls
  attr_reader :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  private
  attr_writer :age
end

blanche = GoldenGirls.new('Blanche', 55)
p blanche.age # 55
p blanche.age = 39 # private method error
```
---
# 20
**What is the difference between _state_ and _behavior_?**

State is the collection of instance variables and their values. Behaviors are the methods that objects of a given class have access to.