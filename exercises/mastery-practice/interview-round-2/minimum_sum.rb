# * DONE 5m54s
# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

=begin 
I: array 
O: integer or nil 

Rules:
- arrays shorter than 5 elements return nil by default 
- look at 5 consecutive items in the array  
  - add them all up 
- return the minimum of the sums 

Examples:
[1, 2, 3, 4, 5, 6]
[1, 2, 3, 4, 5] --> 15 ---> smallest sum is returned 
   [2, 3, 4, 5, 6] --> 20

DS: 
arrays 

Algorithm:
- return nil if size is smaller than 5 
- chunk subarrays of 5 elements each -> `chunks_arr`

- iterate (transform)
  - sum of each subarray 
- get max 

=end 

def minimum_sum(arr)
  return nil if arr.size < 5
  chunks_arr = arr.each_cons(5).to_a 

  chunks_arr.map {|sub| sub.sum}.min
end 

# Examples:

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

# The tests above should print "true".