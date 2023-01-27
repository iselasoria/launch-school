=begin
Write a method that takes one argument, a positive integer, and returns the sum of its digits.

I: integer
O: integer 

Algorithm:
-get the digits 
  - inject each of the items in the array 
=end

def sum(int)
  digits = int.digits.reverse
  
  digits.inject {|item, sum| item + sum}

end

# test cases
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45


# # For a challenge, try writing this without any basic looping constructs (while, until, loop, and each).