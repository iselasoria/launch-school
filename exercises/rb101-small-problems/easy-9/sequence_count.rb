=begin
-----------------------INSTRUCTIONS--------------------------------------
Create a method that takes two integers as arguments. The first is a count,
the second is the first number in a sequence that your method will create.
The method should return an array that contains the same number of elements
as the count argument, while the values of each element will be multioples
of the starting number.
--------------------------PROBLEM----------------------------------------
Questions:
Input: two integers
Output: an array of integers
---------------------------RULES-----------------------------------------
Explicit: 
- the first argument is the length of the returning array
- the second argument is the number whose multiples we are going to populate the array
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
- read the first value, this is the breaking condition
- read second value, find multiples of this number
=end

def sequence(size, multiples_of)
  starting_arre = (multiples_of..size).to_a
 
  
end

# test cases
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) #== [-7, -14, -21, -28]
p sequence(3, 0) #== [0, 0, 0]
p sequence(0, 1000000) == []