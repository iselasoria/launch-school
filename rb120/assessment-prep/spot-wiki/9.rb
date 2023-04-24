class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")


# What is output and why? What does this demonstrate about `super`?
# S:
# this throws an error, the reason for this is the super keyword on line 8. It tries to
# look up th inheritance chain to the initialize inherited from Animal. Since that constructor does not take any arguments,
# and super passes by default the arguments passed to the method from where it was called, it is trying to pass
# along the string "black", which breaks it.