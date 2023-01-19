=begin
 TODO Interview Practice

Write a method that takes an Array, and returns a new Array with the elements of 
the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method
you wrote in the previous exercise.


Algorithm:
- initialize array object new_arr
- iterate over array
- unshift the current element
- take only the array size
=end


def reverse(arr)
  new_arr = []
  arr.reverse_each {|item| new_arr << item }
  new_arr
end
# test cases 
p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true