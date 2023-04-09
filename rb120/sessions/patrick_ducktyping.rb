# POLYMORPHISM!!!
# Inheritance
## is_a relationship--> linear inheritance
## has_a relationship --> module mixin/ interface inheritance
# Duck Typing

module Movable
  def move
   puts "I'm moving at 80km/h in a SW direction"
  end
end

class Animal
  def move
    puts "I'm an animal with legs, and I can walk"
  end
end

class Cat < Animal
end

class Snake < Animal
  def move
    puts "No legs, I slither"
  end
end

class Bird < Animal
  def move
    puts "I fly!"
  end
end

class Train
  include Movable
end

class Car
  include Movable
end

class FrisbeePlayer
  def move
    puts "i'm running!"
  end
end

class Company
  def move
    puts "We're relocating to Oaxaca!"
  end
end

things_that_move = [Cat.new, Snake.new, Bird.new, Train.new, Car.new, FrisbeePlayer.new]
# inheritance through class on Cat, Snake, Bird, interface inheritance for Train and Car and duck-typing for the FrisbeePlayer

things_that_move.each {|t| t.move }