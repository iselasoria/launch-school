# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older # <-- this is an instance method, as such it can only be called on instance of Cat
    self.age += 1 # <-- knowing the above, we know this references the instance that called it
  end
end

# You can see in the make_one_year_older method
# we have used self. What does self refer to here?

# S: 
# self on line 12 refers the instance that called it