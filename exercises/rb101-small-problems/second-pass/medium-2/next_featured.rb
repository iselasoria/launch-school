=begin 
* DONE 20m46s

A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

Rules:
- a featured number:
  - is a multiple of 7
  - its digits are all unique 

Goal: return the next featured number that is greater than the input number or error message if not possible 

Examples:
input: 12
 12
 13
 14
 ...
 until I find a featured number and return that number 


input: 20 
  21 ---> featured num! 

input: 1029 
 1030
 1031
 1032
 ...
 until it finds featured number 

Data Structures:
I: Integer
Interim: integer 
O: integer 

Algorithm:
Helper Method: is_featuerd?(n) ---> boolean
  - check that a number is divisible by 7 AND odd AND its digits are unique 

Main Method: featured(num)
- look at every number starting at num and break when I find is_featuerd? == true 

- init current_num to num 

- enter a loop 
  - check if current_num is_featuerd? 
    - if it is, return current_num 
  - otherwise 
    - current_num + 1 

=end 

def is_featuerd?(n)
  n.odd? && n % 7 == 0 && n.digits.uniq.size == n.digits.size
end

def featured(num)
  return "There is no possible featured number" if num.digits.size > 9
  current_num = num

  loop do 
    return current_num if is_featuerd?(current_num) && current_num != num
    current_num += 1
  end

end


p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987 ###
p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements