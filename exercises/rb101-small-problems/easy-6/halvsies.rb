=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes an array as an argument and returns two arrays
(as a pair of nested arrays) that contain the first half and second half of
the original array, respectively. If the original array contains an odd 
number of elements, the middle element should be placed in the first half.
--------------------------PROBLEM----------------------------------------
Questions:
Input: array
Output: nested array containing first half and second half of the array
as nested elements in the new array
---------------------------RULES-----------------------------------------
Explicit: if the array contains an odd number of elements, the middle element 
should be placed in the first half of the array, ie) the first element of the new
nested array.
Implicit: 
--------------------------EXAMPLES---------------------------------------
=end
# arr = [1,2,3,4]
# first half 
# get the length of array
# determine the halfway point
# set variable for first_half from starting index 0 - halfways point of the array
# set the variable for second_half from middle point + 1 to the end of the array ie) halfway_point - arr[-1]
# ----------------------------ALGO----------------------------------------
def varying_first_half(arr)
  if arr.size % 2 == 0
    first_half = arr[0, arr.size / 2]
    first_half
  else
    first_half = arr[0, arr.size / 2 + 1]
    first_half
  end
end
# p varying_first_half([1,2,3,4])
# p varying_first_half([1,2,3,4,5])

def second_half(arre)
  if arre.size % 2 == 0
    second_half = arre[arre.size / 2, arre.size]
    second_half
  else
    second_half = arre[arre.size/2 + 1 , arre.size]
    second_half
  end
end

# p second_half([1,2,3,4])
# p second_half([1,2,3,4,5])

def halvsies(arre)
  nested_arre = []
  first = varying_first_half(arre)
  second = second_half(arre)
  nested_arre.push(first, second)
  nested_arre
end

# test cases
# p halvsies([1, 2, 3, 4])
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]