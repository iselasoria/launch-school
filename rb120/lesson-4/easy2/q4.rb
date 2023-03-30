=begin 
What could you add to this class to simplify it and remove two methods 
from the class definition while still maintaining the same functionality?
=end 

class BeesWax
  def initialize(type)
    @type = type
  end

  def type # replaceble with an attr_reader 
    @type
  end

  def type=(t) # replaceable with an attr_writer
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax" # we don't need @type, we can now refernce the attr_reader with type
  end
end

# S: 
# we can replace the getter and setter methods with attr_reader 
# or both with an attr_accessor because we're not extending
# the functionality of either getter/setter and we're not concerned with 
# private/protected methods in this snippet 