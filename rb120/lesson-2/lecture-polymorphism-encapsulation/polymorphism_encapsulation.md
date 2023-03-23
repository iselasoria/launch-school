## Lecture: Polymorphism and Encapsulation
---

### Polymorphism
Objects of different data types responding to a common interface. In polymorphism, it is not important what kind of object goes in, what matters is that it can perform a given behavior that is shared amongst other objects. It's important to note that polymorphism can involve inheritance but it is not strictly necessary. 

_EXAMPLE_
A method that expects an object that has the ability to move using a `move` method. The objects that go in might be human, cat, fish, or even train-- they all have the ability to move. 

#### Two Major Types of Polymorphism

##### Polymorphism Through Inheritance
Behaviours can be inherited from a superclass down to a subclass. If different objects inherit a common method, they might either let the inherited method run, or override it in their own definitions. Consider the code below, the `Animal` class hands down the `move` method to the subclasses `Cat`, `Fish`, `Sponge` and `Coral`. The last two don't have a method in their definition, so they don't override it. When move gets called on them, it is the `Animal` class's `move`.

The `Fish` and `Cat` objects do override the `move` method in their definition. This means that when `move` gets called on them, the method that runs is the one defined within their boundaries, and NOT the one inherited from `Animal`. 

##### Duck (typifying) Typing
When objects from unrelated types respond to a common method of the same name.
> _If it quacks like a duck, we can treat it as one._

If objects involved use the same method name and number of arguments, we can treat them as belonging to the same category. For example, objects that are clickable whether they be text boxes or checkboxes. 

### Encapsulation
Encapsulation lets us hide parts of our code and only grant access to methods and properties that users of an object will need. 

We can use method access control to expose properties and methods through the public interface-- the public methods. 
In the code below, attempting to call `dog.nickname= 'Barny'` on an instance of the `Dog` class would raise an error because the the `nickname` setter method has been encapsulated-- that is, hidden from interactions outside of the class. 
```ruby
class Dog
  attr_reader :nickname

  def initialize(n)
    @nickname = n
  end

  def change_nickname(n)
    self.nickname = n
  end

  def greeting
    "#{nickname.capitalize} says Woof Woof!"
  end

  private
    attr_writer :nickname
end

dog = Dog.new("rex")
dog.change_nickname("barny") # changed nickname to "barny"
puts dog.greeting # Displays: Barny says Woof Woof!