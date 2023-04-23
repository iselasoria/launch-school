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