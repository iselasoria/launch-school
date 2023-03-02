=begin 
* DONE 8m
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".


I: array 
O: Array

Rules:
- numbers closest in value 
- non-consecutive pairs!

Examples:
[5, 25, 15, 11, 20]
pairs       diffs
5, 25       20
25, 15      10
15, 11      4
11, 20      9
5, 15
5,11
5,20 
...         ...

DS:
nested array--> pairs 
hashes-> pair and diff 

Algorithm:
- generate permutations of `pairs` 

- iterate over the pairs 
  - for each pair
    - calculate difference 
    - set in a new hash the pair as the key and the difference as the value 

- select the smallest diff 

=end 

def closest_numbers(arr)
  pairs = arr.permutation(2).to_a

  hash = {}
  pairs.each do |pair|
    diff = (pair[0] - pair[1]).abs
    hash[pair] = diff
  end
  hash.min_by {|_, val| val}[0]
end
# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]