=begin
Write a method that takes an integer argument, +, -, or 0. 
This method should return true if the number's absolute value is odd.
=end

def is_odd?(number)
  number.abs % 2 != 0 
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true