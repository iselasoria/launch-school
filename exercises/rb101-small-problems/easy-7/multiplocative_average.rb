=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes an Array of integers as input, multiplies all the numbers
together, divides the result by the number of entries in the array, and then prints the
result rounded to 3 decimal places. Assume the array is non-empty.
--------------------------PROBLEM----------------------------------------
Questions:
Input: array of integers, non-empty
Output: an integer that is rounded to 3 decimal places
---------------------------RULES-----------------------------------------
Explicit: 
- Array is non-empty
- Multiply all numbers in the array
- Divide the resutl of multiplication by the number of elements in the array


Implicit: 
--------------------------EXAMPLES---------------------------------------
=end
# - Take the input array
# - Multiply all the elements in the array
# - Store the restul from the mutiplication step in a new variable
# - Count the number of elements in the array
# - Divide the result of the multiplication by the number of entries in the array

#----------------------------ALGO----------------------------------------

def show_multiplicative_average(arre)
  multiplication = (arre.inject {|product, number| product * number}).to_f
  number_of_elements = arre.size.to_f
  result = multiplication / number_of_elements
  result = format("%.3f",result)
  # result.round(6)
end


# test cases
p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667