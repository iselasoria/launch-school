The purpose of the accessor methods is to expose the [[state]] of an object. Accessor methods by convention have the same name as the [[instance variables]] they are trying to expose. By default, the state of an object is encapsulated so this means we don't have access to the [[attributes]] of the object until we define getter and/or setter methods-- accessor methods. 

We can write them ourselves like this:
```ruby
class Dog
  def initialize(name, age, breed)
    @name = name
	@age = age
	@breed = breed
  end
  
  def name
	@name
  end
end

doggy = Dog.new('Fluffy', 4, 'Bichon Frise')
p doggy.name #"Fluffy"
```
We can now add the second type of accessor method-- a setter that will allow us to change the value stored in the instance variables. 
```ruby
class Dog
  def initialize(name, age, breed)
	@name = name
	@age = age
	@breed = breed
  end

  def name
	@name
  end

  def name=(new_name)
	@name = new_name
  end
end

  

doggy = Dog.new('Fluffy', 4, 'Bichon Frise')

p doggy.name= 'Sparky' 
p doggy.name # Sparky
```

Code can be further simplified by making use of the [[attr_*]] methods. 