=begin 
Create a module that you can mix in to ONE of your subclasses 
that describes a behavior unique to that subclass. 
=end 

module Loadable
  def has_flatbed?
    true
  end
end


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
  include Loadable
  NUMBER_OF_DOORS = 4
end 