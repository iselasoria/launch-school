=begin 
* DONE 12m00s
Given an array (arr) of integers, and a positive integer k. Find the number of pairs (i, j) having the sum (arr[i] + arr[j]) that is divisible by k and i < j. 

I: array of integers and a single integer 
O: integer 

Rules:
- pairs 

Goal: find number of pairs that have the sum that is divisible by the input integer and where the first item is smaller than the second

Examples:
input: [1, 3, 2, 6, 1, 2] and 3 

=end

def divisible_sum_pairs(arr, num)
  hash = {}
  sums_and_pairs = arr.permutation(2).to_a.map {|item| [item, item.sum]}.to_h

  # select those that have a sum divisible by num 
  sums_and_pairs.select {|par, suma| suma % num == 0}.select {|par,_| par[0] > par[1]}.size
end
# Test cases:

p divisible_sum_pairs([1, 3, 2, 6, 1, 2], 3) == 5
p divisible_sum_pairs([8, 10], 2) == 1
p divisible_sum_pairs([5, 9, 10, 7, 4], 2) == 4
p divisible_sum_pairs([29, 97, 52, 86, 27, 89, 77, 19, 99, 96], 3) == 15
