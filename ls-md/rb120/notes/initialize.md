Also known as the #constructor method, this method is [[private]] by default. This is because initialize often contains functionality to set the values of instance variables and it would be too muddy to expose to the public interface. 

```ruby
class DocAppt
  def initialize(name, day_of_week)
    @name = name
    @day_of_week = day_of_week
  end
end

rosa = DocAppt.new('Rosa', 'Tuesday')
rosa.initialize
```

The code above throws the following error: 
```
NoMethodError: private method `initialize' called for #<DocAppt:0x00007ff258299788 @name="Rosa", @day_of_week="Tuesday">
```
Having a pubic `initialize` would mean we expose the state of the object and that contradicts the idea that objects encapsulate state.

The `::new` keyword takes the arguments passed to it and forwards them to the constructor. 
We can define a class without a explicit definition of `initialize`:
```ruby
class Dog ;end

fido = Dog.new

p fido #<Dog:0x00007fb9869f9a38>
```
If we don't define it, the Dog class can still access an initialize that has been inherited from up _its_ [[inheritance chain]]. So essentially when we define a constructor with `initialize`, we are overriding the inherited method of the same name.