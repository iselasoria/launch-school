=begin 
Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. 
Truck and Car should both inherit from Vehicle.

=end 

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  
  end

  class Car < Vehicle
    
  end
end

# modules are a great way to group classes that are similar-- this is called namespacing!
# we can instantiate a class that's contained in a module like this:
Transportation::Truck.new