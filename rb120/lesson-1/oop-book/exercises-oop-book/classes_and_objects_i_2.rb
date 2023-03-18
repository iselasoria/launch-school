=begin 
2. Add an accessor method to your MyCar class to change and view the color of your car. 
Then add an accessor method that allows you to view, but not modify, the year of your car.
=end 

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
end

lumina = MyCar.new(1997, 'chevy lumina', 'red')
puts lumina.color = 'blue'
puts lumina.year