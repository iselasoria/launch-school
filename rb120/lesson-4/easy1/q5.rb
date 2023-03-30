=begin
Which of these two classes would create objects that would have an
instance variable and how do you know?
=end 

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# S:
# Only the Pizza class would have instance variable, @name. 
# This is obvious by the `@`, the `name` on line 8 in the Fruit class is
# actually a local variable. We can also call .instance_variables on an instance to find out