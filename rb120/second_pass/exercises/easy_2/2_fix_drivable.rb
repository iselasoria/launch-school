=begin
Correct the following program so it will work properly.
Assume that the Car class has a complete implementation;
just make the smallest possible change to ensure that cars
have access to the drive method.
=end

module Drivable
  def drive #remove the self
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
# S:
# including self would mean that the method is a module method
# and will not be available to the instances of the object