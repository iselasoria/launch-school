=begin 
Using the following code, allow Truck to accept a second argument upon instantiation. 
Name the parameter bed_type and implement the modification so that Car continues to 
only accept one argument.

=end 

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type # we need the reader method to be able to grab the value of the isntance variable 

  def initialize(year, bed_type)
    super(year) # here, super will only pass one of the arguments to the Vehicle parent class
    @bed_type = bed_type # but we'll expand the functionality by adding a second argument that only this instance method takes
  end
end

class Car < Vehicle
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type

# expected 
# 1994
# Short