module Describable
  def describe_shape
    "I am a #{self.class} and have #{SIDES} sides."
  end
end

class Shape
  include Describable

  def self.sides
    self::SIDES
  end

  def sides
    self.class::SIDES
  end
end

class Quadrilateral < Shape
  SIDES = 4
end

class Square < Quadrilateral; end

p Square.sides
p Square.new.sides
p Square.new.describe_shape


# What is output and why? What does this demonstrate about constant scope?
# What does `self` refer to in each of the 3 methods above?

=begin
Line 25 outputs 4 because it is making a call to the class method sides and then referencing the SIDES from the calling object.
Line 26 outputs 4. This is because `sides` gets called on an instance of Square, which does not override the SIDES constant, so it goes up
the inheritance chain to search and resolves it in the Quadrilateral class.
Line 27 throws an error because since we don't have a sides method definition in Square, we travel up the inheritance chain to the module and try to resolve the
constant there. Here we don't find a definition of SIDES, and once up there, we can't come back down to the class that set us up there to look.
=end
