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
_Quick Notes_
- Denoted by `@@`
- Scope at the class level

Class variables show these two main behaviors:
- all objects share 1 copy of the class variable, objects can access class variables via their instance methods
- class methods can access a class variable as long as the class variable has been initialized prior to calling the method
```ruby 
class Person
  @@total_people = 0            # initialized at the class level

  def self.total_people
    @@total_people              # accessible from class method
  end

  def initialize
    @@total_people += 1         # reassigned from instance method
  end

  def total_people
    @@total_people              # accessible from instance method
  end
end

Person.total_people             # => 0
Person.new
Person.new
Person.total_people             # => 2

bob = Person.new
bob.total_people                # => 3

joe = Person.new
joe.total_people                # => 4

Person.total_people             # => 4
```

#### Constant Variable Scope 
_Quick Facts_
- accessible through the `namespace resolution operator` `::` 
- they do not get reassigned to a different value, they are constant throughout the code 
- begin with a capital letter but most often have all their letters capitalized ex:) `GREETINGS`
- constants have `lexical scope`  
  - where the constant is defined, determines where it is available

```ruby 
module ElizabethanEra
  GREETINGS = ['How dost thou', 'Bless thee', 'Good morrow']

  class Person
    def self.greetings
      GREETINGS.join(', ')
    end

    def greet
      GREETINGS.sample
    end
  end
end

puts ElizabethanEra::Person.greetings # => "How dost thou, Bless thee, Good morrow"
puts ElizabethanEra::Person.new.greet # => "Bless thee" (output may vary)
```

In the code above, the `GREETINGS` constant is available to the instance methods defined inside the `Person` class. Ruby searches for a reference to the (constant) variable in the code surrounding it and it is able to find it at the beginning of the module.
If the `GREETINGS` constant had been defined in a separate class, it would not be available to the `Person` class. 

