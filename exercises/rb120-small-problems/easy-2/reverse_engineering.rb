# write a class that will display 
# ABC
# xyz

class Transform
  

  def initialize(str_in)
    @string_in = str_in
  end
  def uppercase
    @string_in.upcase 
  end

  def self.lowercase(another_str)
    another_str.downcase
  end
end
# when the following code is run:
my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# This is a questions of discerning between class and isntane methods
# Line 22 is the hint we need to know that we need to create a class method 
# called `lowercase`. Class methods do not have access to instance variables 
# so this tells us that it will need to intake it's own data as an argument
# class methods are also known as singleton methods