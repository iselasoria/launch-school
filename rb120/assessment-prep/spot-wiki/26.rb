# How do class inheritance and mixing in modules
# affect instance variable scope? Give an example.
# S:
# instance variables initialized in the superclass will be available to any subclasses
# Similarly, the instance variables initialized inside a module will
# be available to the classes where the module was mixed in.

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

homer = Adults.new("Homer", 42)
p homer.tell_joke(homer.name)
# In the code above, the instgance variables @name and @age are both defined in the Simpsons superclass, not in the Adult class and yet instances of Adult have access to them
# Then, the ivar @punchline is defined in a module Funny, and we also have access to it in the class that includes the mixin

