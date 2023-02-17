=begin 

https://edabit.com/challenge/xMEhTRaDYHYrfuvvR

Given an array and an integer n, return the sum of the first n numbers in the array.

Worked Example
sum_first_n_nums([9, 8, 7, 6], 3) ➞ 24
# The parameter n is specified as 3.
# The first 3 numbers in the list are 9, 8 and 7.
# The sum of these 3 numbers is 24 (9 + 8 + 7).
# Return the answer.

Examples
slice_sum([1, 3, 2], 2) ➞ 4

slice_sum([4, 2, 5, 7], 4) ➞ 18

slice_sum([3, 6, 2], 0) ➞ 0

Notes
If n is larger than the length of the array, return the sum of the whole array.

I: array 
O: integer 

Rules:
- take the first n numbers in the array and add them and return them

Examples:
[4, 2, 5, 7] and  4
[4,2,5,7].sum
returns 18 

Data Structures:
array 

Algorithm:
- take n from input array and sun
=end 

def slice_sum(arr, allowed_num)
  return arr.sum if allowed_num >= arr.size 
  arr.take(allowed_num).sum
end
# test cases 
p slice_sum([1, 3, 2], 2) == 4
p slice_sum([4, 2, 5, 7], 4)  == 18
p slice_sum([3, 6, 2], 0) == 0