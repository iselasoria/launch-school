# Add a class method to your MyCar class that calculates the gas mileage of any car.
class MyCar
  attr_accessor :color 
  attr_reader :year 

  def initialize(year, color, model)
    @current_speed = 0
    @year = year 
    @color = color 
    @model = model 
  end

  def speed_up(number)
    @current_speed += number
    puts "You pushed the gas pedal and accelerated #{number} mph."
  end

  def brake(number)
    @current_speed -= number
    puts "You pushed the break and decelerated #{number}."
  end

  def current_speed
    puts "You are now going #{@current_speed} mph."
  end

  def shut_off
    @current_speed = 0 
    puts "Let's park!"
  end

  def spray_paint(color)
    self.color= color
    puts "Your new #{color} paint job looks great!"
  end

  def self.gas_milleage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas."
  end
end

MyCar.gas_milleage(13, 351)
