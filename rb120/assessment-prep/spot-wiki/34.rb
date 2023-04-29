module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
p mike.walk

kitty = Cat.new("Kitty")
p kitty.walk

# todo redo

# What is returned/output in the code? Why did it make more sense to use a module as a mixin vs. defining a parent class and using class inheritance?

=begin
In Ruby, class inheritance can be used to represent an "is a" relationship between two classes by creating specialized subclasses of a parent class. In this problem, it does not make sense for a Cat class to inherit from a Person class and vice versa because a Cat is not a Person and a Person is not a class.

We can use interface inheritance (i.e. modules) to represent a "has a" relationship by including modules into multiple classes via mixins. We can mix in a `Walkable` module to different unrelated classes that can walk. Both cats and people have the ability to walk.
# you only get one shot at a super class. don't waste it
=end