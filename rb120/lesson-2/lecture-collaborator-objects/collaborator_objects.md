### Collaborator Objects
---
`Collaboration` takes place when one object is added to the `state` of another. It's important to note this happens from the start-- that is, from the moment we design our classes. 

The actual collaborative action might not happen upon instantiation, but the intent was there all along from the moment we defined our classes and their relationships.



#### Example
```ruby
class Person
  attr_accessor :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end
end

bob = Person.new("Robert")

kitty = Cat.new
bud = Bulldog.new

bob.pets << kitty
bob.pets << bud

bob.pets                      # => [#<Cat:0x007fd839999620>, #<Bulldog:0x007fd839994ff8>]
```

In the code above, the class Person is defined as having an initialize instance method-- this triggers the instantiation of the object and defines two instance variables at that time: `@name`, and `@pets`. 

On line 20, when the class method `.new` gets called on the class, the instance method gets triggered and an object of the `Person` class-- `bob` is instantiated. 

On line 22, we instantiate a `Cat` object, then on line 23 we instantiate a `Bulldog` object. 
In the following two lines we push the newly created objects (of the `Cat` and `Bulldog` classes respectively) into the array `@pets` that was defined in the `Person` class.

As we can see, we can now call `.pets` on `bob`. This is possible because `bob` is an instance of the `Person` class which contains the instance variable `@pets`. Here, the objects of `Cat` and `Bulldog` objects are said to be _collaborator objects_ of the `Person` class-- they are objects that are stored as the _state_ of another object. Lastly, collaboration is a relationship of _association_ NOT of inheritance, think _has_a_ vs _is_a_ relationship.