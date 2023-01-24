=begin 
* DONE 6m
Write a method that takes an Array of numbers and then returns the sum of the sums of 
each leading subsequence for that Array. You may assume that the Array always contains 
at least one number.

I: array 
O: integer 

Rules:
- keep a running sum of the elements in the array 
- return the total sum of all the sums 

Goal:
- return the sum of the sums 

Algorithm:
- iterate over the array 
  - sum up each element 
=end

def sum_of_sums(arr)
  run_sum = 0
  arr.map do |item|
    run_sum += item
  end.sum
end


# test cases 

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35