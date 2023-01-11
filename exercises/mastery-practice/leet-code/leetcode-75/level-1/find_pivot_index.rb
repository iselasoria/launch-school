=begin 

* DONE 13m31s

Given an array of integers nums, calculate the pivot index of this array.

The pivot index is the index where the sum of all the numbers strictly to the left of the index
is equal to the sum of all the numbers strictly to the index's right.
If the index is on the left edge of the array, then the left sum is 0 because there are 
no elements to the left. This also applies to the right edge of the array.

Return the leftmost pivot index. If no such index exists, return -1.

Input: array 
Output: array 

Rules:
- the pivot index: 
  - the index that if we were to cut the array in half, would yield two chunks that amount to the same when all their elements are added.
  - the current index DOES NOT count toward the sum of either side 
- negative numbers can be input 
- if no index satisfied this condition, return -1


Input: nums = [1,7,3,6,5,6]
index:         0 1 2 3 4 5
Output: 3
Explanation:
The pivot index is 3.
Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
Right sum = nums[4] + nums[5] = 5 + 6 = 11
Example 2:

Input: nums = [1,2,3]
Index:         0 1 2
Output: -1
Explanation:
There is no index that satisfies the conditions in the problem statement.
Example 3:

Input: nums = [2,1,-1]
Output: 0
Explanation:
The pivot index is 0.
Left sum = 0 (no elements to the left of index 0)
Right sum = nums[1] + nums[2] = 1 + -1 = 0
 

Data: 
-in: arr 
-interim: array 
-out: array 

Algorithm:
- iterate over the index of the array 
  - with each iteration
    - set a first half that spans from arr[0] up to current and a second_half that spans from current + 1 to the end
    - if first and second are the same, return the index 
    - othewise, return -1

=end

def pivot_index(arr)
  arr.each_index do |idx|
    first = arr[0...idx]
    second = arr[idx + 1..-1]
    return idx if first.sum == second.sum
  end
  -1
end

p pivot_index([1,7,3,6,5,6])