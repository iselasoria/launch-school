=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that rotates an array by moving the first element to the end
of the array. The original array should not be modified. Do not use `Array#rotate`
or `Array#rotate!` for your implementation.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
- array
Output: 
- new array
---------------------------RULES-----------------------------------------
Explicit: 
- the first element in the original array becomes the last one
Implicit: 
- no mutation
--------------------------EXAMPLES---------------------------------------
[1,2,3] --> [2,3,1]
[7, 3, 5, 2, 9, 1] == [3, 5, 2, 9, 1, 7]
----------------------------ALGO----------------------------------------
- read the array
- initialize an empty array
- write array[1..end]
- push the named first element
- return the newly created array
=end

def rotate_array(arre)
  rotated = []
  arre[1..arre.size - 1] << arre.first
end

# test cases
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

# * DONE