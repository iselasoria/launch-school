=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a methoid that takes one integer argument, which may be positive, negative, or zero.
This method returns `true` if the numbers absolute value is idd. You may assume that
the argument is a valid integer value. DO NOT use odd? or even?
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
- integer +, -, or 0
Output: boolean
---------------------------RULES-----------------------------------------
Explicit: 
- if absolute value of number is odd, method returns true,
- if the absolutel value is even, it returns false
- if it is 0, the method will also return false
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
- read the ineger
- store the absolute value in a variable
  - if the number is negative, multiply it by -1 to get a positive (its absolute value)
  - if the number is positive, just store it directly 
- if the number is odd? return true if not, return false
=end


def is_odd?(num)
  number = num < 1 ? num * -1 : num

  number % 2 != 0 ? true : false

end


# test cases
puts is_odd?(2) == false   # => false
puts is_odd?(5)  ==true   # => true
puts is_odd?(-17) == true  # => true
puts is_odd?(-8) == false  # => false
puts is_odd?(0) == false   # => false
puts is_odd?(7)  ==true  # => true

# DONE