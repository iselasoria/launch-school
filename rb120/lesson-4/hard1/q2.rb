=begin 
Building on the prior vehicles question, we now must also track a basic motorboat. 
A motorboat has a single propeller and hull, but otherwise behaves similar to a catamaran. 
Therefore, creators of Motorboat instances don't need to specify number 
of hulls or propellers. How would you modify the vehicles code to incorporate 
a new Motorboat class?

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
# we moved the moved the attr_readers and the Movable mixin to a new class called Seacraft
# these are shared among the water vehicles. The propeller count and hull count are set separately 
# because the is the Motorboat class that only needs 1 of each. The remaining two attributes reference
# their setter methods inherited from the mixin module
# Motorboat then inherits from Seacraft and we alter the ivars that get passed to super.
# the Catamaran class can be empty because writing super with the same arguments is redundant, super
# automatically forwards all the args passed in to the instance method from where it was called 
# since super with no arguments is the equivalanet of passing all of them 
# we could just have super, but then that means there is nothing to override so we might as well leave the class empty 