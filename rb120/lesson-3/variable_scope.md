## Viable Scope

---
#### Instance Variable 
_Quick Facts_
- Denoted by `@`
- Scoped at the object level 

Instance variables are used to track an object's state. Unlike local variables, instance variables are accessible to an instance method even if they initialized outside them or not passed to them as arguments. 
```ruby
class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name                     # is the @name instance variable accessible here?
  end
end

bob = Person.new('bob')
bob.get_name                  # => "bob"
```

If we try to access a local variable that has not yet been initialized, we'd get a `NameError`. But if we try to access an instance method that is not yet initialized, we'd get `nil`.

#### Class Variable Scope 

#### Constant Variable Scope 