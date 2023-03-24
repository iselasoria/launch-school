=begin 
Correct the following program so it will work properly. Assume that the Car class has 
a complete implementation; just make the smallest possible change to ensure that cars
have access to the drive method.
=end 

module Drivable
  def drive # removed the .self 
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive

# Methods in mixin modules should be defined withour .self, otherwise the class that 
# includes the module will only have access to the method by calling the module fist
# `Drivable.drive` and it will not be available as an instance method to objects