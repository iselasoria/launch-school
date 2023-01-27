=begin 
* DONE 5m
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Rules:
- move the first element in the array to the end 
- don't modify the original array 

Algorithm:
- iterate over array 
  - skip the first item 
  - push all others into the new array 
  - concatenate the first item at the end 
=end


def rotate_array(arr)

  new_arr = []

  arr.each_with_index do |item, idx|
    next if idx == 0
    new_arr << item 
  end
  new_arr << arr[0]
end
# test cases
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true