module Drivable
  def drive
    puts "I'm driving!"
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
# Car.drive
#Drivable.drive
bobs_car.drive



# What is output and why? What does this demonstrate about how methods need to be defined in modules, and why?

=begin esther
A no method error will be output.  This is because the `self.drive` method in the `drivable` module is a method that can be called only on the module.  If we want to allow access to the `self.drive` method in the `Car` class, we would need to use the `extend` keyword underneath `include Drivable`.

class Car
  include Drivable
  extend Drivable
end
_______________________JUSTIN__________________________
A NoMethodError is thrown and output to the console because Ruby is searching for an instance method that is not defined in the class hierarchy of the `bobs_car` instance.

Methods should be defined within modules without `self` prepended if they want to be invoked by instances of a class.

=end


