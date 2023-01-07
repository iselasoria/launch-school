=begin
* DONE 3m
Write a method that takes a positive integer as an argument and returns that number with its digits reversed.
Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. 
For similar reasons, the return value for our fourth example doesn't have any leading zeros.

Input: integer 
Output: integer 

Rules:
  - the numbers are reversed 
=end 

def reversed_number(num)
  num.digits.join.to_i
end

# test cases 
p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1