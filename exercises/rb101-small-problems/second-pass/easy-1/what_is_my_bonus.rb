=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes two arguments, one is a posotive integer and the other
a boolean and calculates a bonus for a given salary. If the boolean is true, the bonus should be half of the salary.
If the boolean is false, the bonus is 0.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
- integer
- boolean
Output: 
- integer
---------------------------RULES-----------------------------------------
Explicit: 
- if boolean is true, there is a bonus that is half the salary
  - else, there is no bonus
Implicit: 
--------------------------EXAMPLES---------------------------------------
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
----------------------------ALGO----------------------------------------
- take the input integer, if the boolean is true
  - return input integer /2
  - else, return 0
=end

def calculate_bonus(amnt, bonus)
  if bonus
    amnt / 2
  else
    0
  end
end

# test cases
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000