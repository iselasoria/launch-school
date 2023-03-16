## Classes and Objects- Part I
---

### States and Behavior 
When defining classes, we typically focus on `state` and `behavior`. 
_State_ refers to the data associated with an object, while _behavior_ refers to the actions 
that an object can perform. 

We can have two `GoodDog` objects "Fido" and "Sparky." These two objects have a different
name but can have different information such as weight, height, etc. 
These different characteristics can be tracked with _intance variables_ which is how we track the state of objects. 

Even though "Fido" and "Sparky" are both different objects, they can have similar behavior, typical of a good dog; fetch, play, bark, etc. These behaviors are defined in instance methods. 

> Instance variables track state, while instance methods expose the behavior of an object.


### Initializing a New Object
The code bellow instantiates a new object. Note that the _.new_ method that gets called on the `GoodDog` class is triggering the `initialize` method that was defined inside it. 
In this sense, the _initialize_ method is said to be a `constructor.`-- the method that builds the object. 

```ruby
class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new        # => "This object was initialized!"
```

### Instance Variables
An instance variable is a variable that exists as long as the object instance exists; it does not die until the object instance is destroyed. Instance variables have a `@` symbol at the beginning of the name:

```ruby 
class GoodDog
  def initialize(name)
    @name = name
  end
end
```

The initialize method was defined wtih a parameter, this means we can pass arguments to the initialize method through the `.new` method. 

```ruby
sparky = GoodDog.new("Sparky")
```

Instance variables keep track of the state of objects. In the example above, the `.new` method triggered the `initialize` constructor inside the class. Since in the last code snippet we passed the string "Sparky" to the `.new` method, this means the constructor took that string and assigned it to the `@name` instance variable.

### Instance Methods
Adding behavior to the `GoodDog` class:

```ruby 
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak # => Arf!
```
Notice how our second good dog also performs the same behaviors as `Sparky` 

```ruby
fido = GoodDog.new("Fido")
puts fido.speak             # => Arf!
```
The two objects of the same class might have varying states (the name in this case). but 
they behave the same way. 

Notice how string interpolation can be used with instance variables too:
```ruby
def speak
  "#{@name} says arf!"
end

puts sparky.speak           # => "Sparky says arf!"
puts fido.speak             # => "Fido says arf!"
```
### Accessor Methods

If we wanted to access out object's name:
`puts sparky.name`

we'd get this error:
`NoMethodError: undefined method `name' for #<GoodDog:0x007f91821239d0 @name="Sparky">`

The `NoMethodError` tells us the method is either unavailable or does not exist. We need 
a getter method to retrieve the name.

```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name # this is our getter method
    @name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
```
If we want to change the name, we'll need a setter method:
```ruby
class GoodDog
  def initialize(name)
    @name = name
  end

  def get_name
    @name
  end

  def set_name=(name) # this is the setter method
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.get_name
sparky.set_name = "Spartacus" # this is syntactical sugar for sparky.set_name=("Spartacus")
puts sparky.get_name
```
A more rubyist way of naming the setter and getter methods would be to use the names of the objects they are trying to expose and set. In the exaple above, the getter method `get_name` would be renamed to `name` and the setter method would be renamed to `name=(n)`. 

> NOTE: setter methods always return the value that was passed in as an argument, regardless of what the last line in the method definition is.

It is so common to have these getter and setter methods that Ruby has a built-in way to create them automatically. We can use the `attr_accessor` method.

```ruby
class GoodDog
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak
puts sparky.name            # => "Sparky"
sparky.name = "Spartacus"
puts sparky.name            # => "Spartacus"
```
Notice how the `attr_accessor` method takes a symbol as an argument-- it will use this symbol to name the create the method names for the getter and setter methods it generates. 
If we only need either the setter or the getter method, but not both:
- `attr_reader` --> only retrieves the instance variable
- `attr_writer` --> only gives access to the setter method 
All of the `attr_*` methods take a symbols as arguments and we can use it to track multiple states: 
```ruby
attr_accessor :name, :height, :weight
```
#### Accessor Methods in Action
At the top of the lesson we referenced the instance variable like:
```ruby
def speak
  "#{@name} says arf!"
end
```
Because the `attr_accessor` gives us access to expose and change an object's state, we can use the setter/getter methods from within classes. We can now the `name` getter method instead of access the instance variable directly:
```ruby
def speak
  "#{name} says arf!"
end
```
> NOTE: with that change, we are accessing the instance method instead of the instance variable! 

We can just reference the instance varable but this would mean every change we make would then have to trickle down to every time we use the instance variable. With the instance method, the change trickles down automatically. Think of masking a social security number for example. Whenever we change the instance variable directly in our class, we should use the setter method. 

Let's say we want to add two more states: height and weight. 
`attr_accessor :name, :height, :weight`

The line above gives us all the following
_Setter/Getter Methods:_
- name, name=
- height, height=
- weight, weight=
And the following instance variables:
- @name
- @height 
- @weight 

If we wanted a method to update the three states:
```ruby 
def change_info(n, h, w)
  @name = n
  @height = h
  @weight = w
end
```
And we can change it like this:
```ruby
sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Spartacus weighs 45 lbs and is 24 inches tall.
```

Changing the implementation to make use of the setter methods instead of instance variables:

```ruby
def change_info(n, h, w)
  name = n
  height = h
  weight = w
end
```

However! This doesn't change Sparky's information.
```ruby
sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info      # => Sparky weighs 10 lbs and is 12 inches tall.
```
As it turns out, Ruby thought we were initializing new variables inside the method definition. 

### Calling Methods With Self 
To fix this, we need to use `self.name=` to be explicit that we are calling the setter method and not initializing local variables. 
```ruby 
def change_info(n, h, w)
  self.name = n
  self.height = h
  self.weight = w
end
```
---
## Exercises

1. Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to 
define some instance variables that tell us the year, color, and model of the car. Create an instance variable 
that is set to 0 during instantiation of the object to track the current speed of the car as well. 
Create instance methods that allow the car to speed up, brake, and shut the car off.

```ruby
class MyCar

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  def speed_up(number)
    @current_speed += number
    puts "You push the gas and accelerate #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You push the brake and decelerate #{number} mph."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_down
    @current_speed = 0
    puts "Let's park this bad boy!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'white')
lumina.speed_up(20)
lumina.current_speed
lumina.speed_up(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.brake(20)
lumina.current_speed
lumina.shut_down
lumina.current_speed

```


2. Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor 
method that allows you to view, but not modify, the year of your car.
```ruby
class MyCar
  attr_accessor :color 
  attr_reader :year
  #### rest of the code 
end
lumina.color = 'black'
puts lumina.color
puts lumina.year
```

3. You want to create a nice interface that allows you to accurately describe the action you want your program 
to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.
```ruby
class MyCar
### rest of the code 

  def spray_paint(color)
    self.color = color 
    puts "Your new #{color} paint job loks great!"
  end
end 

lumina.spay_paint('red') # => "Your new red paint job looks great!"
```