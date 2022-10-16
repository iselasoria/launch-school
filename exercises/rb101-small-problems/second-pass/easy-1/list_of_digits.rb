=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes one argument, a positive integer, and
returns a list of digits in the number.
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: an array of numbers
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
=end

def digit_list(number)
  number.to_s.chars.map(&:to_i)
end

# test cases
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true