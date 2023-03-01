# * DONE 4m06s

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.


=begin 
I: Array
O: array 

Rules:
  - count numbers SMALLER than current 
  - only count numbers once when determining how many are smaller 

Examples:
[8,1,2,2,3]
 3,0,1,1,2

DS:
array 

Algorithm:
- iterate over input array 
  - for each number in the array 
    - check how many unique numbers in the original array are SMALLER than it 
=end 

def smaller_numbers_than_current(arr)
  arr.map do |num|
    arr.uniq.count{|item| item < num}
  end
end




# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".