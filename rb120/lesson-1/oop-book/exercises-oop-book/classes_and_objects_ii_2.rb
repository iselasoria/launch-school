# Override the to_s method to create a user friendly print out of your object.

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

  def to_s
    "My car is a #{color}, #{year}, #{model}" # TODO why does this have to use "@" in the model in order for it to work
  end
end

my_car = MyCar.new(1967, 'dodge dart', 'red')

puts my_car