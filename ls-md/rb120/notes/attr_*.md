Accessor methods let us interact with and maybe alter the state of the object. In [this example](../sample-code/accessor_methods.md), we added a getter and setter method to interact with the instance of Dog. 
We can further simplify that code by making use of Ruby's `attr_*` methods.

```ruby
class Dog
attr_accessor :name

  def initialize(name, age, breed)
	@name = name
	@age = age
	@breed = breed
  end
end

  

doggy = Dog.new('Fluffy', 4, 'Bichon Frise')
p doggy.name= 'Sparky'
p doggy.name
```
In the code above, `attr_accessor` was used and it gave us access to both a getter, and a setter method.

There is also just the getter:
```ruby
class Dog
  attr_reader :breed

  def initialize(name, age, breed)
	@name = name
	@age = age
	@breed = breed
  end
end

doggy = Dog.new('Fluffy', 4, 'Bichon Frise')
p doggy.name # undefined method `name' for #<Dog:0x00007f6444601508 @name="Fluffy", @age=4, @breed="Bichon Frise">
p doggy.breed # "Bichon Frise"
```
As seen above, we only created a [[getter]] method for the `@breed` instance variable, but not for `@name` and that is why we are able to retrieve the first and not the latter. 

Just like that we can also create just the [[setter]]:

```ruby
class Dog

  attr_writer :breed

  def initialize(name, age, breed)
	@name = name
	@age = age
	@breed = breed
  end
end

doggy = Dog.new('Fluffy', 4, 'Bichon Frise')

p doggy.breed = 'Maltese' # Maltese 
```
One important characteristic of setter methods is they always return the argument that was passed in to them, _not_ the last executed line. If we were to define the setter method in the code above like this:
```ruby
# code ommited ....
def breed=(new_breed)
  @breed = new_breed
  str = "THIS IS NORMALLY THE RETURN VALUE"
end
# code ommited 
```
The return value of that method would still be just the argument we passed into it. 