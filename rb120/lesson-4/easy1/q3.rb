=begin 
In the last question we had a module called Speed which 
contained a go_fast method. We included this module in the Car class as shown below.


=end 

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

=begin 
When we called the go_fast method from an instance of the Car class 
(as shown below) you might have noticed that the string printed 
when we go fast includes the name of the type of vehicle we are using.
How is this done?

>> small_car = Car.new
>> small_car.go_fast
I am a Car and going super fast!
=end 

# S: 
# When we use the self keyword on line 10, self is refering to the enclosing structure
# Since small_car; an instance of the Car class, is the one calling `go_fast`, self refers to it