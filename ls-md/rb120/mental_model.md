### Mental Model (so far)
- `class` --> encapsulates behavior, it holds behavior for a kind of object 
- `instance methods`--> are the behavior, public instance methods are the public interface of the class 
- `instance variables`--> hold the value of the state of objects 
state-- instance variables and their values. not shared

- `inheritance` --> behaviors gets passed down to similar subclasses from a superclass 
- `superclass` --> hands down methods 
- `subclass` --> inherits behaviors from a parent class via _single inheritance_ with an _is_a_ relationship 
- `mixin modules` --> Ruby's response to work around multiple inheritance --> _has_a_ relationship mixins get added by invoking include--> interface inheritance
- `super`- this keyword allows us to access the superclass's methods from a re-defined/overriding method 
  - with no arguments, it passes(or forwards) all the arguments given to the method from where it is called
  - if we want to call it withour any argumetns, we must use it as `super()`
```ruby
  def my_method(first_name, last_name)
    super() 
  end 
end 
```
- `lookup path` --> the order in which ruby searches for methods can be accessed by calling 
`.ancestors` on the class 

  >class -> modules(reverse order) -> superclass -> Kernel -> BasicObject
- `self` --> refers to the class itself, in a class method definition or is used when calling a setter method

  var that points to caller of the method that it's called in 
  self.my_method

```ruby
module Snakeable
end

module CoolStuff
end

module Runnable
  def method
    self
  end
end

class Being
  include Runnable
end

class Animal < Being
end

class Dog < Animal
  include CoolStuff
  include Snakeable
end

dog = Dog.new
p dog.method
p Dog.ancestors
```

