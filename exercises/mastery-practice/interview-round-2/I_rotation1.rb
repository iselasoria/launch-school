=begin
* DONE 3m17s
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.


I: Array
O: array 

Rules:
- can't use rotate 
- take last item and put it at the end 
- don't modify input array 

Examples:
[7, 3, 5, 2, 9, 1] --> [3, 5, 2, 9, 1, 7]

DS:
arrays 

Algorithm:
- array from 1 up to last + first


=end

def rotate_array(arr)
  arr[1..-1] + [arr.first]
end

# test cases 
p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

