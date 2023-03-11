=begin 
* DONE 16m12s
Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.

 

Example 1:

Input: nums = [-1,2,1,-4], target = 1
Output: 2
Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
Example 2:

Input: nums = [0,0,0], target = 1
Output: 0
Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).
 

Constraints:

3 <= nums.length <= 500
-1000 <= nums[i] <= 1000
-104 <= target <= 104

I: array 
O: integer 

Rules:
- add any three numbers so that the sum is or comes close to taget sum 

Examples:
inputs: [-1,2,1,-4] and 1 
        [-1,2,1] ---> 2
            [2,1,-4] --> -1 

            2 - 1 --> 1-----\_____ the absolute closest is the sum of 2
           -1 - 1 --> -2----/
DS:
I: arrays 
Interm: arrays 
O: integer 

Algorithm:
- get slices of 3 consecutive numbers 
- transform the slices array to their sum minus the target and take the absolute
- return the minimum from the above 
=end 

def three_sum_closest(arr, target)
  threes = []

  (0...arr.size).each do |st|
    slice = arr[st, 3]
    threes << slice if slice.size == 3
  end
  threes.map! do |slice|
    slice.sum
  end

  threes.min_by do |item|
    (item - target).abs
  end
  #(&:sum).map {|item| item - target}
end

p three_sum_closest([-1,2,1,-4], 1) == 2
p three_sum_closest([0,0,0], 1) == 0
p three_sum_closest([4,0,5,-5,3,3,0,-4,-5], -2) == -2 # TODO extra not passing