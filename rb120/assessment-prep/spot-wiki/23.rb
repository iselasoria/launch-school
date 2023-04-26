# How and why would we implement a fake operator in a custom class? Give an example.
# fake opperators are really methods that use a given instance of the class as te calling
# object, and a separate instance of the same class as the argument passed in. One good reason to implement
# fake opperators is to override the method definition from the superclasses. For example, when adding objects together,
# adding numbers is a mathematical equation, where as adding strins is a concatenation so the implementation of the same methjod
# in these two different classes will behave differently.

class FullName
  def inititialize(name, proffesional_title)
    @name = name
    @proffesional_title = proffesional_title
  end

  def +(other)
    name + other.name
  end
end

#
class Cat
  def initialize(weight)
    @weight = weight
  end

  def ==(other)
    weight == other.weight
  end

  protected

  attr_reader :weight
end

pip = Cat.new(20)
mia = Cat.new(20)

p pip == mia