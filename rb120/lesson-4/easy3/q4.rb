# Given the class below, if we created a new instance of the class and 
# then called to_s on that instance we would get something like "#<Cat:0x007ff39b356d30>"

class Cat
  attr_reader :type
  def initialize(type)
    @type = type
  end

  def to_s 
    "I'm a #{type} cat"
  end
end

# How could we go about changing the to_s output on this method to look like this: I am a tabby cat? 
# (this is assuming that "tabby" is the type we passed in during initialization).

gato = Cat.new("tabby")
puts gato 

# S:
# first, we must override the to_s that is inherited down from the BasicObject class. 
# we also need to provide an attr_reader to create a getter method for ivar type
# it is generally a good idea to name the method something that denotes its use
# such as "display_type" 