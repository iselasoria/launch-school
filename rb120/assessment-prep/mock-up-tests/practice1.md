

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

module Danceable
  def dance
    "I'm dancing."
  end
end

class Animal
  include Walkable

  def speak
    "I'm an animal, and I speak!"
  end
end

module GoodAnimals
  include Climbable

  class GoodDog < Animal
    include Swimmable
    include Danceable
  end

  class GoodCat < Animal; end
end

good_dog = GoodAnimals::GoodDog.new
p good_dog.walk

```

**What is the method lookup path used when invoking #walk on good_dog?**
The method lookup path will be:
`# GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable`... followed by all the superclasses native to Ruby.

Ruby will first search the enclosing structure, which is the namespaced `GoodAnimals::GoodDog`. It doesn’t find the method, then goes to modules in the enclosing structure in order of last to first added, then up to superclass which in this case is `Animal` , then to the modules mixed in to the superclass.
`GoodAnimals::GoodDog.ancestors = [GoodAnimals::GoodDog, Danceable, Swimmable, Animal, Walkable, Object, PP::ObjectMixin, Kernel, BasicObject]`


---

## 11
```ruby
class Animal
  def eat
    puts "I eat."
  end
end

class Fish < Animal
  def eat
    puts "I eat plankton."
  end
end

class Dog < Animal
  def eat
     puts "I eat kibble."
  end
end

def feed_animal(animal)
  animal.eat
end

array_of_animals = [Animal.new, Fish.new, Dog.new]
array_of_animals.each do |animal|
  feed_animal(animal)
end

```
**What is output and why? How does this code demonstrate polymorphism?**
This code outputs each of the different `eat` sentences for each type of animal. This demonstrates polymorphism by inheritance. We first inherit the behavior, and then we override it but keep the name so as to let all the different objects respond to the same interface-- the `eat` instance method.

---
## 12
```ruby
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

class Pet
  def jump
    puts "I'm jumping!"
  end
end

class Cat < Pet; end

class Bulldog < Pet; end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets.jump
```
**We raise an error in the code above. Why? What do kitty and bud represent in relation to our Person object?**

The code raises an error because the method jump exists for the Person class, but we are calling it on pets which is an array object and it does not have access to it. The fix would be to iterate over the pets array and then call jump on each one of its elements, since they do have access to the jump method.

---


## 13
```ruby
class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name); end

  def dog_name
    "bark! bark! #{@name} bark! bark!"
  end
end

teddy = Dog.new("Teddy")
puts teddy.dog_name

```

The output is `bark! bark!  bark! bark!` and the reason is that we override the initialize method that came from `Animal` class, and in the `Dog` class constructor, we don’t actually set the instance variable. The fix would be to either add a super keyword and let the constructor yield the power to the constructor up the chain of inheritance:

---

## 14
```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

al = Person.new('Alexander')
alex = Person.new('Alexander')
p al == alex # => true
```
The code above returns false because we are currently using the implementation of BasicObject#== which compares whether two objects are literally the same in memory. Instead, what we want to do is override the instance method with out own Person#== that checks whether the values stored in the ivar are the same.
```ruby
def ==(other)
  name == other.name
end
```

---
## 15
```ruby
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "My name is #{name.upcase!}."
  end
end

bob = Person.new('Bob')
puts bob.name
puts bob
puts bob.name
```
**What is output on lines 14, 15, and 16 and why?**

The first call to puts outputs Bob, as it was entered as an argument to `new`.
The second call to puts outputs "My name is BOB!" because we are overriding the to_s method that came from BasicObject and asking it to upcase the name (referencing getter method name). Lastly, when we call `bob.name` again, we now get BOB as the output because the to_s method implementation has a call to the destructive upcase!` Setters are more like reassignment. We don't need a setter in this case because we are not reassigning, we are acting directly on the object and mutating it so all we need is a reference to the getter.


---
## 16

**Why is it generally safer to invoke a setter method (if available) vs. referencing the instance variable directly when trying to set an instance variable within the class? Give an example.**

It is best to use the setter method whenever possible because we can add a layer of protection in the form of validation when updating the value of an ivar. The other reason is, when using methods, we have to be more intentional about how we use them so it is less likely that we’d change something by mistake. With methods, we have to think about what they get called on and this makes us me more mindful.

```ruby
class Teacher
  attr_accessor :schedule

  def initialize(name, main_subject)
    @name = name
    @main_subject = main_subject
    @schedule = []
  end

  def schedule=(course)
    case course
    when 'APUSH' then schedule << 'Advanced Placement U.S. History'
    when 'Euro' then schedule << 'European History'
    when 'Econ' then schedule << 'Economics'
    end
  end
end

josh = Teacher.new('Joshua Chancer', 'U.S. History')
p josh # #<Teacher:0x00007f3280de0ad0 @name="Joshua Chancer", @main_subject="U.S. History", @schedule=[]>
josh.schedule = 'APUSH'
p josh # #<Teacher:0x00007f3280de0ad0 @name="Joshua Chancer", @main_subject="U.S. History", @schedule=["Advanced Placement U.S. History"]>
```

---

## 17

**Give an example of when it would make sense to manually write a custom getter method vs. using attr_reader.**

Using the setter method instead of using the instance variable directly ensures that our code is flexible and can easily be changed in the future. The benefit is more obvious on large codebase where we might have thousands of references to a piece of data. If wanted to change how the data was presented, and we had used the ivars, we’d have to change hundreds of times. However, if we make reference to the setter method we only have to change it in the one place and the change propagates. In the code below, we now have left the data as we entered it, intact and at the same time, we now have a way of retrieving someone’s take home pay and we only had to do it in the getter.

```ruby
class Salary
  def initialize(name, payment)
    @name = name
    @payment = payment
  end

  def payment=(bonus)
    @payment + bonus
  end
end

ed = Salary.new('Ed', 3500)
p ed # #<Salary:0x00007f5c16e595b0 @name="Ed", @payment=3500>
p ed.payment = 1200 # 120
```

---
## 18
```ruby
class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end

```
**What can executing Triangle.sides return? What can executing Triangle.new.sides return? What does this demonstrate about class variables?**

On the first example, Ruby will look to the `Shape` superclass, and since we don’t actually instantiate an object of Triangle, it finds the `sides` in `Shape` and returns `nil`.

On the second one,  we do instantiate an object of the `Triagle` class, so now when we call `sides` on it the constructor defined in the class does get triggered and that is how it outputs 3 sides.

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