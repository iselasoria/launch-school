=begin 

3. You want to create a nice interface that allows you to accurately describe 
the action you want your program to perform. Create a method called spray_paint
that can be called on an object and will modify the color of the car.
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

  def spray_paint(color)
    self.color= color
    puts "Your new #{color} paint job looks great!"
  end
end

lumina = MyCar.new(1997, 'chevy lumina', 'red')
lumina.spray_paint('pink')