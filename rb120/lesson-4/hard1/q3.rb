=begin 
The designers of the vehicle management system now want to make an adjustment for 
how the range of vehicles is calculated. For the seaborne vehicles, due to prevailing 
ocean currents, they want to add an additional 10km of range even if the vehicle is 
out of fuel.

Alter the code related to vehicles so that the range for autos and motorcycles 
is still calculated as before, but for catamarans and motorboats, the range method 
will return an additional 10km.

=end 

module Movable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency
  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Seacraft
  include Movable

  attr_reader :hull_count, :propeller_count

  def initialize(num_propellers, num_hulls, fuel_efficiency, fuel_capacity)
    @propeller_count = num_propellers # these are set separately to account for the class that only needs 1
    @hull_count = num_hulls # these are set separately to account for the class that only needs 1
    self.fuel_efficiency = fuel_efficiency # setter comes from the mixin
    self.fuel_capacity = fuel_capacity # setter comes from the mixin 
  end

  def range 
    super + 10
  end
end


class WheeledVehicle
  include Movable
  attr_accessor :speed, :heading

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    @fuel_efficiency = km_traveled_per_liter
    @fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran < Seacraft

end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    # only hull and one propeller
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# S:
# we can just override the range instance method in the Seacraft class.
# We can use the same calculation with a call to super which will grab range from the 
# Movable module but then we can add an additional 10