=begin 
Using the code from the previous exercise, move the greeting from 
#initialize method to an instance method named #greet that prings a
greeting when invoked.
=end 

class Cat
  def initialize(name)
    @name = name
  end
  def greet 
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet