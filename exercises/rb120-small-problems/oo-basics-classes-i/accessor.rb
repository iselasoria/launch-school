=begin 
Using the code from the previous exercise, replace the getter
and setter methods using Ruby shorthand.

=end 

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet

# expected output 
# Hello! My name is Sophie!
# Hello! My name is Luna!