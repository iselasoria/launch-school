# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count #<-- when prepended to a method name, it denotes a class method 
    @@cats_count
  end
end

# In the name of the cats_count method we have used self. What does it refer to in this context?

# S: because it is a class method, the self in this context refers to the class itself 