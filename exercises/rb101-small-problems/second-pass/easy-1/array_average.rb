=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes one arguments, an array of integers, and returns the average
of all numbers in the array. The array will never be empty and the numbers will always be 
positive integers. Your result should also be an integer.
--------------------------PROBLEM----------------------------------------
Questions:
Input: array of integers
Output: integer
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
----------------------------ALGO----------------------------------------
- read the array
- sum all the numbers in the array
- get length of array
- divide sum by arr length
=end

def average(arr)
  sum = arr.inject { |num, sum| sum + num}
  size = arr.length

  sum / size
end

# test cases
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# DONE