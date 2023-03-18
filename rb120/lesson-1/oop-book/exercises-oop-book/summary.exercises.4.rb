=begin 
Print to the screen your method lookup for the class that you have craeted.
=end 

class MyVehicle
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


class MyCar < MyVehicle
  NUMBER_OF_DOORS = 2
end

class MyTruck < Vehicle 
  NUMBER_OF_DOORS = 4
end 

puts MyCar.ancestors
puts "\n"
puts MyVehicle.ancestors
puts "\n"
puts MyCar.ancestors
