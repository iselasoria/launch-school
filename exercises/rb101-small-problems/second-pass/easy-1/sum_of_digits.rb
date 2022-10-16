=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes one argument, a positive integer, and returns the sum of its digits.
Don't loop.
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: integer
---------------------------RULES-----------------------------------------
Explicit: 
- add all the digits
Implicit: 
--------------------------EXAMPLES---------------------------------------
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
----------------------------ALGO----------------------------------------
- set an array of the individual numbers
- iterate over the array
  - sum up all the numbers as you iterate

=end

def sum(number)
  digits = number.to_s.chars.map(&:to_i)

  sum = digits.inject {|sum, num| sum + num}
  sum
end

# test cases
p sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45