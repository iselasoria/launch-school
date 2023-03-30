# if we have the following class:
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. 
# What code would you need to write to test your theory?

# S:
# the @@cats_count class variable essentially takes a tally of the number 
# of instance of the class Cat. Each time a new object is instantiated and initialize gets
# calledm the @@cats_count class varable is incremented by 1. It's important to note that
# with class variables, their value is shared by all instance of the class, unlike the instance variables
# that are not shared at all. 