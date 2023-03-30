# If we have a class below, what would you need to call to create a new instance of this class?

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# S:
baggy = Bag.new("red", "velvet")

# the new keyword will trigger the initialize method/constructor
# initialize takes two arguments so we must pass two at the time 
# we instantiate a new object 