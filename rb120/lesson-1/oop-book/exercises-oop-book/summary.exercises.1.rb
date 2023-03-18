=begin
TODO

Create a superclass called Vehicle for your MyCar class to inherit from and 
move the behavior that isn't specific to the MyCar class to the superclass. 
Create a constant in your MyCar class that stores information about the 
vehicle that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass 
that also has a constant defined that separates it from the MyCar class in some way.

=end 
class Vehicle
  def self.gas_milleage(gallons, miles)
    puts "#{miles / gallon} miles per gallon of gas"
  end
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 2
end

class MyTruck < Vehicle 
  NUMBER_OF_DOORS = 4
end 