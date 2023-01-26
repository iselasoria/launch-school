=begin 
* DONE 1m
Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater than 0.


I: integer 
O: array 

=end 

def sequence(int)
  (1..int).to_a
end

# test cases 
p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]