=begin
Create a module named Transportation that contains three classes:
Vehicle, Truck, and Car. Truck and Car should both inherit from Vehicle.
=end

module Transportation
  class Vehicle
  end
  class Truck < Vehicle
  end
  class Car < Vehicle
  end
end

# S: modules are used no only for groupoing common methods but also for naespacing -- where similar
# classes are grouped within a module. It helps avoid collision with clkases of the same name
# we can instantiate a class that is contained in a modeule like this:
Transportation::Truck.new