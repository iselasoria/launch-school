=begin 
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

# Examples:

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

# The tests above should print "true".

I: arr 
O: arr 

Rules:
- chunks in the array are pairs 
  - not strictly consective 
  - pairs are only forward-facing--> end of the slice is a higher index 
- return the pair that is closest in value 

Examples:
[19, 25, 32, 4, 27, 16] ---> [25, 27]
19 25
19 32
19 4
19, 27
19 16
25 32
25 4 
....


Data Structures:
I: array 
Interim: array and hashes 
O: array 

Algorithm:
Helper Method: gen_pairs(arr)
- get an index of 0 up to arr.size 
- product --> all slices, including unwated 
- reject slices where second index is greater than the first  and where index is the same 


Main Method: 
- call gen_pairs(arr) and store in `pairs_arr`
- initialize a hash {} `pairs_diff_hash`
- iterate over pairs_arr 
  - for each pair 
    - set in the new hash the key as the difference 
    - pair as the value ---> {6 => [19, 25], ....}

- min_by the key in the hash 
=end 

def gen_pairs(arr)  
  index = (0...arr.size).to_a
  prod = index.product(index)
  # reject where index is the same and where second idx is greater

  prod.reject! do |slice|
    slice[0] == slice[1] || slice[0] > slice[1]
  end

  prod.map do |slice|
    [arr[slice[0]], arr[slice[1]]]
  end

end

def closest_numbers(arr)
  pairs_arr = gen_pairs(arr)
  pairs_diff_hash = {}

  pairs_arr.each do |pair|
    diff = (pair[1]- pair[0]).abs
    pairs_diff_hash[pair] = diff
  end
  pairs_diff_hash.min_by {|pair, diff| diff}[0]
end

# Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16])== [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

