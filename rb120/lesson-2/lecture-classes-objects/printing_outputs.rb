=begin 
Continuing with our Person class definition, what does the below code print out?



bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"
=end 

# SOLUTION: 
# Given the class below, line 6 instantiates the object, 
# and line 7 would print the class name followed by some encoding. This is how string interpolation works. 
# String interpolation will automatically call to_s on the object and this will output its place in memory. The
# method `to_s` which was inherited from the object class prints this, but we can override. 
# This wouldn't be a problem with string concatenation 
#  puts "The person's name is: " + bob.name   

class Person
  attr_accessor :first_name, :last_name

  
  def initialize(full_name)
    parts = full_name.split
    @first_name = parts.first 
    @last_name = parts.size > 1 ? parts.last : ""
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(full_name)
    parts = full_name.split 
    self.first_name = parts.split 
    self.last_name = parts.size > 1 ? parts.last : "" 
  end 
end

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"