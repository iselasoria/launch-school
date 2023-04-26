class Person
  def initialize(n)
    @name = n
  end

  def get_name
    @name
  end
end

bob = Person.new('bob')
joe = Person.new('joe')

puts bob.inspect # => #<Person:0x000055e79be5dea8 @name="bob">
puts joe.inspect # => #<Person:0x000055e79be5de58 @name="joe">

p bob.get_name # => "bob"


# What does the above code demonstrate about how instance variables are scoped?
# S:
# the code demonstrates how instance variables are scoped at the instance level-- the values stored in an intance variable belong only to the instance