# 1. Given the below usage of the Person class, code the class definition.
# class definition

class Person
  attr_accessor :name 

  def initialize(name)
    @name = name
  end
end



# expected 
bob = Person.new('bob')
p bob.name                  # => 'bob'
p bob.name = 'Robert'
p bob.name                  # => 'Robert'