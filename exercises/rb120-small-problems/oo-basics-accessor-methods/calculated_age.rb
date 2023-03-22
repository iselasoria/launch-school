=begin 
Using the following code, multiply @age by 2 upon assignment, then multiply @age 
by 2 again when @age is returned by the getter method.

=end 

class Person
  
  def age=(age)
    @age = age * 2
  end 

  def age
    @age * 2
  end

  
end

person1 = Person.new
person1.age = 20
puts person1.age

# expected 
# 80

# we have to write manual getter/setter methods because we need to extend their functionality
# First, the setter-- we need to input age first. We define the instance variable @age as
# input age * 2. Then, the getter method returns another modification-- the age that we just
# multipled, multiplied again by 2