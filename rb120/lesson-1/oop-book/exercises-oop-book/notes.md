### class
A way to organize/group common behaviors. Cleaner code, that has changes trickle down as they're made. 

### instance variables
Similar to local var but they live on. Can be extracted from their class. They tell us what the object KNOWS about itself. 

### instance methods
They belong to the object/instance of the class.
   They make an object DO something.
  - `getter` --> returns the value of an individual instance variable of an object 
  - `setters` --> updates the value of an individual instance variable of an object 
  - `attr_reader` --> read only way to display the current value of instance variable. This prevents code from unintentionally changing values. The instance variable becomes inaccessible to other parts of the code.
  - `attr_writer`  --> a way to interface and change the current value of an instance variable.
  - `attr_accessor` --> gives access to both read/write. Under the hood, creates a setter and getter method for the instance variable specified
    Getter/setter methods should have the name of the instance variable they want to interface with. Only setter/getter methods abide by this rule.
```ruby
    def color=(color)
      @color = color 
    end

    def color
      @color
    end
```
### Inheritance 
Classes can inherit or get handed down methods that they can share. 
```ruby
 class Cat < Animal 
 end
 ```
 `superclass`-- the "parent" class that hands down behaviors. Animal superclass could have a move instance method. 
```ruby
  def move
    puts "#{@name} runs fast!"
  end
```
  - `super` -- tells the code to go search in the method lookup path for an  method by the same name. A way to bypass overriding entirely 
 - `subclass`-- the Cat class--> override to specify object-specific behavior fly vs. run vs. slither 

 - `module` -- get added to a class with `include` they expand the functionality of the class. Modules can't instatiate objects, we rely on the class for that.
  module swimable. 

  _is-a_ --> class Inheritance --> noun to noun 

  _has-a_ --> module / mixin. Interface inheritance ---> noun to verb 



### class variables: 
Define with double 'at' ->  `@@number_of_dogs` --> `Animal` class. They don't belong to a specific instance of a class. 
### class methods
Generic behavior that doesn't need to know about the value of instance variables 

- self:
  - self can refer to class or instance Method


```ruby
class Dog
  def initialize(name)    # instance method
    @name = name
  end

  puts self   # as outside of an instance method. self refers DOG class itself

  def this_is_self#
    self # the calling object of this this_is_self instance method
  end
end

dog1 = Dog.new("Fido")    #class method

p dog1
p dog1.this_is_self
```

