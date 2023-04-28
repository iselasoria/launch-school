class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    # name == other.name # String#==
    self.class == other.class
  end
end

class Dog
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def ==(other)
    # name == other.name # String#==
    self.class == other.class
  end
end

whiskers1 = Cat.new('whiskers')
whiskers2 = Dog.new('whiskers')
# ginger = Cat.new('ginger')
# paws = Cat.new('paws')



p whiskers1 == whiskers2
p whiskers1.name == whiskers2.name


# If we use `==` to compare the individual `Cat` objects in the code above, will the return value be `true`? Why or why not? What does this demonstrate about classes and objects in Ruby, as well as the `==` method?

# in custom classes, if we want to use a fake operator, we either:
# 1. don't have access to it at all
# 2. have inherited from up the inherirance chain, usually from BasicObject
# and the implementation that was inheruted, yield unexpected resuls