=begin 
6 kyu
You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)

I: array 
O: integer 

Rules:
- array will have at least 3 numbers 
- array will have all number as odd, except one OR 
  array will have all numbers as even except one
- return the outlier 

Examples: 
[2, 4, 0, 100, 4, 11, 2602, 36]
 e  e  e  e    e  o   e     e 

outlier --> 11 

Data Structures: 
I: array 
Interim: array 
O: integer 

Algorithm:
- iterate over the array by partition
  - throw the odds in the odds array, throw the evens in the evens
  - return the shortest array 
=end
def find_outlier(arr)
  arr.partition {|num| num.odd?}.min_by {|item| item.size}[0]
end

p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2
p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36]) == 11
p find_outlier([160, 3, 1719, 19, 11, 13, -21]) == 160