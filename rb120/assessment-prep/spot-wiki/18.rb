class Shape
  @@sides = nil

  def self.sides
    @@sides
  end

  def sides
    @@sides
  end
end

class Triangle < Shape
  def initialize
    @@sides = 3
  end
end

class Quadrilateral < Shape
  def initialize
    @@sides = 4
  end
end


# What can executing `Triangle.sides` return? What can executing `Triangle.new.sides`
# return? What does this demonstrate about class variables?

p Triangle.sides
# here we look to the Shape superclass, since we are not even intantiating a new object of Triangle
# it finds the sides in shape and returns that value which is nil
p Triangle.new.sides
# this time we do initialize a new instance, and now the initialize does execute, so this is why
# we have sides as 3.
# it gets parsed anc changed if it is at the top level scope, but if there is an initialize and then the class var
# inside it, then a new instance does need to be instantiated.