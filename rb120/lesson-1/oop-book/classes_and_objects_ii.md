## Class Methods
---

Class methods are called on the class itself, without needing to instantiate objects. 
To define class methods we prepend the reserved word `.self`:

```ruby
# ... rest of code ommitted for brevity

def self.what_am_i         # Class method definition
  "I'm a GoodDog class!"
end
```
To call a class method, we can call the method name directly on the class:
`GoodDog.what_am_i          # => I'm a GoodDog class!`

Class methods are useful when we don't need them to track any states or if we need to add functionality that does not pertain to any particular object. 

### Class Variables
Class variables are variables that track things pertaining to only the class, as opposed to individual objects and they are created with `@@`. 

### Constants
We can use constants if we have variables that we will never need to change. Constants are fined by using all uppercase letters:
`TINY_CONSTANT`

### The `to_s` Method 
The `to_s` method gets automatically called every time we use `puts`; it's essentially like calling `puts sparky.to_s`.  This method by default returns the name of the calling object's class and an encoding object id. When called on an array, it will call on each of the items instead of on the collection itself.

> NOTE: The `to_s` method gets called automatically on the object when we use `puts` or in string interpolation. This will be helpful in the future. 

### More About `self` 
Two rules to remember for now:
  1. When used inside of an instance method, `self` references the instance (or object) that called the method. So, `self.weight=` is the same as `sparky.weight`.

  2. When used outside of an instance method, `self` references the class and can be used to define class methods.


---
## Exercises
1. Add a class method to your MyCar class that calculates the gas mileage of any car.
2. Override the to_s method to create a user friendly print out of your object.
3. When running the following code...
```ruby
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
```
We get the following error...
```ruby
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)
```

Why do we get this error and how do we fix it?
