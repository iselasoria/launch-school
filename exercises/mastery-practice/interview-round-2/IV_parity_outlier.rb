=begin 
* DONE 5m
You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a method that takes the array as an argument and returns this "outlier" N.

Examples
[2, 4, 0, 100, 4, 11, 2602, 36]
Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]
Should return: 160 (the only even number)


I: array 
O: integer 

Rules:
- single number that stands out as either the only odd or the only even 

Algorithm:
- store evens, odds in an array partition `separated_numbers`[[n],[n,n,n]]
- select from `separated_numbers` the smaller size subarray 
  - select first item 

=end 

def find_outlier(arr)
  separated_numbers = arr.partition {|num| num.even?}

  separated_numbers.min_by {|item| item.size}.first
  
end
# test cases 

p find_outlier([0, 1, 2]) == 1
p find_outlier([1, 2, 3]) == 2


