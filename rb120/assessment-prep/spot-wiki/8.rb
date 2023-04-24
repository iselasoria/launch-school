class Animal
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class GoodDog < Animal
  def initialize(color)
    super
    @color = color
  end
end

bruno = GoodDog.new("brown")
p bruno


# What is output and why? What does this demonstrate about `super`?
# S:
# the output will be an object of the class GoodDog with attributes for name and color both containing
# the string brown
# the keyword super is used as a way to extend the functionality of a method by making use of its previous
# implementation and also adding on top of it. in Ruby, when used without arguments, super will by default
# redirect/forward all the arguments that were passed to the method from where it was called.
# The code above is extending the functionality of the initialize method that was first defined in the Animal class
# and then adding color only in the GoodDog implementation of initialize.
# This means that when the constructor gets triggered for GoodDog, we first look up the inheritance chain and execute that
# initialize, then come back to the overriding method of initialize in the GoodDog class to add to it, and here we see
# we're adding color. Because we only pass one argument, we are setting that as the value for both of the instance variables