# Fix the following code so it works properly

class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles
    self.mileage = total # we need to reference the setter method directly, this way we still make use of extended functionality in the setter
  end # note that we could also do @mileage but when we bypass the setter method and go directly to the instance var. Problematic if the setter has validation

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678