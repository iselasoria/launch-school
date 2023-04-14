# attr_*

# attr_reader--> getter
# attr_writer --> setter
# attr_accessor --> setter/getter

# class Mammal
#   attr_accessor :name, :give_nickname # setter/getter shorthand
#   # ivars are initialize to nil by default

#   # def initialize(name)
#   #   @name = name
#   # end

#   # def give_nickname(nickname)
#   #   self.name = nickname
#   # end
# end

# class Cat < Mammal
#   def initialize(name)
#     @name = name
#   end
# end

# class Dog < Mammal

# kitty_cat = Cat.new("Breadcrumbs")
# #p kitty_cat.give_nickname("breadycrumbs")
# p kitty_cat.name

### Instance variables, class variables, and constants, including the scope

module Fuel
  @gas = "86"
  @@test = "test"
  GAS = "Diesel"
end

module FuelExpensive
  GAS = "91 Gasoline"
end

GAS = "86 gasoline"

class Car
  # GAS = "Gasoline"
  include Fuel
  include FuelExpensive

  attr_reader :engine_block

  @@num_wheels = 4

  def self.wheels_info
    @@num_wheels
  end

  def type_of_gas?
    GAS
  end
  # def test_check
  #   @@test
  # end



  # def wheels
  #   @@num_wheels = 3
  # end

  def initialize
    @engine_block = "v8"
  #  @Engine_Block
  end
end

class SixWheeler < Car
  @@num_wheels = 6

  #  def type_of_gas?
  #   GAS
  # end
end

# p audi = Car.new
# p audi.engine_block
# # two = SixWheeler.new
# # p SixWheeler.wheels_info
# p Car.wheels_info
# #p audi.test_check # NoMethodError
# #p audi.gas # NoMethodError
# p audi.type_of_gas?

# class Test
#   def initialize
#     @testing = "test_test"
#   end
# end

# #p Test.new.initialize #nomethoderror bc is private by default...
# module Playable
#   def self.play
#     "fetching a ball"
#   end
# end

# class Dog
#   def speak
#     puts "Bark!"
#   end

#   def self.interact
#     puts "Wags tail"
#   end
# end

# class Poodle < Dog
# include Playable

# end

# sparky = Poodle.new
# # p sparky.play

# p Poodle.play

#### Method Access Control
class Snake
  def initialize(size)
    @size = size
  end

  def slither
    "Slither"
  end

  def attack
    self.bite
  end

  def larger_than(other)
    size > other.size
  end

  protected
  # private

  attr_reader :size

  private

  def bite
    "Bite!"
  end
end

class Test < Snake
  def test
    self.bite
  end
end

python = Snake.new(4)
p python.slither
# p python.bite
p python.attack
cobra = Snake.new(3)
p python.larger_than(cobra)

# protected methods can interact with other objects of a class (as the receiver or as arguments), whereas private methods can only interact with the current object

coral_snake = Test.new(2)
p coral_snake.attack
p coral_snake.test
p Test.ancestors
# p Test.instance_methods
# p Snake.instance_methods

