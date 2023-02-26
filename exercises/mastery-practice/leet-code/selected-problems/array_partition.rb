=begin 

https://leetcode.com/problems/array-partition/

Given an integer array `nums` of 2n integers, group these integers into n pairs (a1, b1), (a2, b2), ..., (an, bn) such that the sum of min(ai, bi) for all i is maximized. Return the maximized sum.

Example 1: Input: nums = [1,4,3,2]
Output: 4
Explanation: All possible pairings (ignoring the ordering of elements) are:
1. (1, 4), (2, 3) -> min(1, 4) + min(2, 3) = 1 + 2 = 3
2. (1, 3), (2, 4) -> min(1, 3) + min(2, 4) = 1 + 2 = 3
3. (1, 2), (3, 4) -> min(1, 2) + min(3, 4) = 1 + 3 = 4
So the maximum possible sum is 4.


#### NOTE: halfway point of the array is the group size 

Example 2:
Input: nums = [6,2,6,5,1,2]
Output: 9
Explanation: The optimal pairing is (2, 1), (2, 5), (6, 6). min(2, 1) + min(2, 5) + min(6, 6) = 1 + 2 + 6 = 9.

I: array of integers 
O: Integer

Rules:
- intake an array in integers 
- make pairs --> order of the pairs does not matter ex) (1,2) -> (2,1)
  - for each pair 
    - get min of each pair 
    - add the mins 
    - return maximum sum of mins 

Example 1: Input: nums = [1,4,3,2]
Output: 4
Explanation: All possible pairings (ignoring the ordering of elements) are:
1. (1, 4), (2, 3) -> min(1, 4) + min(2, 3) = 1 + 2 = 3
2. (1, 3), (2, 4) -> min(1, 3) + min(2, 4) = 1 + 2 = 3
3. (1, 2), (3, 4) -> min(1, 2) + min(3, 4) = 1 + 3 = 4

Data Structures:
I: array 
Interim: nested array 
O: integer 

Algorithm:
- generate all possible pairs store in `pairs_arr`
  - combination order does not matter ** 

- sums_col set to []
- split pairs_arr in half 
- zip one half with the other store in `zipped_halves`
  # [[[1, 4],[3, 2]] ,[[1, 3], [4, 2]], [[1, 2], [4, 3] ]
        1.      2       1         2         1       3
            3               3                   4

- init temp_col = []
- iterate over zipped_halves
  - for each pair in the collection 
    - grab its minimum number 
    - thow min in temp_col 
    - add min from one element with min from next element --> temp_sum 
    - dump temp_sum into sums_col
- iterate over temp_col by slices of 2, and transform to their sum 

- return the max 

=end 

def arr_partition(arr)
  pairs_arr = arr.combination(2).to_a

# [[1, 4], [1, 3], [1, 2], [4, 3], [4, 2], [3, 2]]
    # 1       1     1         3       2       1
    #         3                     6
  sums_col = []
  left = pairs_arr[0..arr.size / 2]
  right = pairs_arr[arr.size/2 + 1..-1].reverse

  zipped_halves = left.zip(right).to_a

  temp_col = []
  zipped_halves.each do |pair|
    pair.map do |item|
      temp_col << item.min
    end
  end

  temp_col.each_slice(arr.size/2).to_a.map {|pair| pair.sum}.max
end



p arr_partition([1,4,3,2]) == 4
p arr_partition([6,2,6,5,1,2]) == 9