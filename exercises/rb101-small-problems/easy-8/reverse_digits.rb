=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a positive integer as argument and returns that
number with its digits reversed.
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: integer
---------------------------RULES-----------------------------------------
Explicit: re-arrange the digits so that the first is now the last,
second to last is now second and so on
Implicit: by the immutability of integers, the return must be a new object
--------------------------EXAMPLES---------------------------------------
number = 1234
number.to_s.chars
number.to_s.chars.reverse
number.to_s.chars.reverse.join
----------------------------ALGO----------------------------------------
- set a variable to hold the input number in the form of a collection
- read the integer and turn it into a collectin
  - reverse collection
  - join the reversed collection
- return the variable containing the reversed collection converted back into an integer
=end

def reversed_number(number)
  num_collection = number.to_s.chars.reverse.join
  num_collection.to_i
end

p reversed_number(12345) #== 54321

# test cases
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1

# DONE