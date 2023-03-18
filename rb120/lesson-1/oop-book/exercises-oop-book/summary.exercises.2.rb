=begin 
Add a class variable to your superclass that can keep track 
of the number of objects created that inherit from the superclass. 
Create a method to print out the value of this class variable as well.

=end 

class Vehicle
  @@children_vehicles = 0

  def self.children_vehicles
    puts "This program has craeted #{@@children_vehicles} "
  end

  def self.gas_milleage(gallons, miles)
    puts "#{miles / gallon} miles per gallon of gas"
  end

  def initialize
    @children_vehicles += 1
    
  end
end


class MyCar < Vehicle
  NUMBER_OF_DOORS = 2
end

class MyTruck < Vehicle 
  NUMBER_OF_DOORS = 4
end 