# write a class that will display
# ABC
# xyz

# when the following code is run:

# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def self.lowercase(data)
    data.downcase
  end

  def uppercase
    data.upcase
  end
end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')

# S:
# this problem deals with instance vs. class methods
# on line 29, the method call is applied to the instance/object
# while on line 30, the method call goes to the class.
# this is the reason we have to define the lowercase method with a prepended self