=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes twoa rrays as arguments and returns an array 
that contains all the values from the argument arrays. There should be no 
duplication of valuues in the returned array, even if there are duplicates in the original arrray.
--------------------------PROBLEM----------------------------------------
Questions:
Input: two arrays
Output: a single array that contains both arrays we got as input
---------------------------RULES-----------------------------------------
Explicit: there should be no dupes!
Implicit: result should be a one-dimensional array
--------------------------EXAMPLES---------------------------------------
=end

# ----------------------------ALGO----------------------------------------

def merge(arr1, arr2)
  arr1 |arr2
end

# test cases
p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# the method Array#| returns the union of two arrays, which already handles the 
# de-deplication of any elememnts present in the two argument arrays