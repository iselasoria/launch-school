# Write a method that takes two arguments, a positive integer and a boolean, and
# calculates the bonus for a given salary. If the boolean is true, the bonus
# should be half of the salary. If the boolean is false, the bonus should be 0.

=begin 

Input: positive integer and a boolean
Output: integer 

Rules:
  - when boolean input is true the bonus is half the salary 
  - when boolean is false bonus is 0

Algo:
- check if the boolean is true or false
  - if true
    - bonus is half the first number input 
  - if boolean is false
    - bonus is 0
  - return bonus 
=end 
def calculate_bonus(num, b)
  bonus = 0 
  b == false ?  bonus : bonus = bonus = num / 2
  bonus
end



puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000