=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that combines two arrays passed in as arguments, and returns
a new array that contains all elements from both array arguments, with the
elements taken in alternation.

You may assume that both input arrays are non-empty, and that ethey have the 
same number of elements
--------------------------PROBLEM----------------------------------------
Questions:
Input: two arrays
Output: a new one-dimensional array
---------------------------RULES-----------------------------------------
Explicit: the new array should have alternating elements from the two input arrays

Implicit: 
--------------------------EXAMPLES---------------------------------------
=end
# set a new variable to hold the new array, maybe not necessary if you use map
# iterate through arre1
# push one element
# iterate through arre2
# push one element


#----------------------------ALGO----------------------------------------
def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |item, idx|
    new_arr << arr1[idx] << arr2[idx]
  end
  new_arr
end
# test cases
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# * DONE