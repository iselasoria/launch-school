## Class Methods
---


### Class Variables

### Constants

### The `to_s` Method 


### More About `self` 

### Summary 

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
