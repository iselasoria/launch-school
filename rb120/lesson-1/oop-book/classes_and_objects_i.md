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

  def get_name
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

#### Accessor Methods in Action

### Calling Methods With Self 

---
## Exercises

1.
2.
3.