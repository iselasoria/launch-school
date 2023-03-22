=begin 
Using the following code, add the appropriate accessor
methods. Keep in mind that @age should only be visible
to instances of Person.

=end 
class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected 

  attr_reader :age 
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)

# expected output 
# false

# When a method is private, it can only be invoked on self.
# When a method is protected, other instance of the class
# or a subclass can also call it. Thus, we can share sensitive 
# data amongst instance of the same class type.

# In the example above, we need to call older_than? (to read the age)
# on an instance of Person, and then pass in another instance to compare
# we couldn't just compare the ages 
