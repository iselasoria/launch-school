# How do class inheritance and mixing in modules
# affect instance variable scope? Give an example.
# S:
# in Ruby, instance variables do not get inherited down the chain-- only behaviors do
# So if an instance variable is initialized inside a method, that method will be available to
# subclasses and then set it's own instnace variables, so it looks like they are inherited but they are not

module Funny
  attr_reader :punchline
  def tell_joke(character)
    @punchline = "#{character} says: I believe that children are our future, unless we stop them now."
  end
end

class Simpsons
  attr_reader :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def introduce
    "Hi my name is #{name} and I'm #{age} years old."
  end
end

class Adults < Simpsons
  include Funny
end

# todo is this only becauwse the ivars come from the constructor?
homer = Adults.new("Homer", 42)
p homer.tell_joke(homer.name)
# In the code above, the instgance variables @name and @age are both defined in the Simpsons superclass, not in the Adult class and yet instances of Adult have access to them
# Then, the ivar @punchline is defined in a module Funny, and we also have access to it in the class that includes the mixin

p Adults.instance_methods
puts "\n"
p Adults.instance_variables

# no matter where on the inheritance chain we are, an object is searching to
# resolve methods as itself.
# instance variables are never inherited, we might inherit behavior that could create ivars but not the ivars themselves
# methods are inherited, but not state