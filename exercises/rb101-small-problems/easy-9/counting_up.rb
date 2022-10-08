=begin
-----------------------INSTRUCTIONS--------------------------------------
Wrirte a methid tghat takes anb integer argument, and returns an array of all
integers, in sequence, between 1 and the argument. You may assume that the 
input will always be a valid positive integer.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
- integer
Output: 
- array
---------------------------RULES-----------------------------------------
Explicit: 
- the array must range between 1 and the input integer, in increments of 1
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
- create a range of integers
- return the range
=end


def sequence(num)
  arre = (1..num).to_a

end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]

# * DONE