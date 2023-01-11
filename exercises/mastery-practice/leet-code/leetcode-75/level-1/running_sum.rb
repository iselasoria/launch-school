=begin
* DONE 10m
Given an array nums. We define a running sum of an array as runningSum[i] = sum(nums[0]…nums[i]).

Return the running sum of nums.

Input: nums = [1,2,3,4]
Output: [1,3,6,10]
Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].

Example 2:

Input: nums = [1,1,1,1,1]
Output: [1,2,3,4,5]
Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
Example 3:

Input: nums = [3,1,2,10,1]
Output: [3,4,6,16,17]


Input: arr 
Output: arr 

Examples / Model Solution:

Input: nums = [1,2,3,4]
Output: [1,3,6,10]
Explanation: Running sum is obtained as follows: [1, 1+2, 1+2+3, 1+2+3+4].
- the current number in the result is a sum of the previous elements in the array 
- iteration stops when we read the end of the array

Input: nums = [1,1,1,1,1]
Output: [1,2,3,4,5]
Explanation: Running sum is obtained as follows: [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1].
Example 3:

Input: nums = [3,1,2,10,1]
Output: [3,4,6,16,17]

- up to the current iteration, the running sum is arr[0] up to the current element

Data: 
-in: arr 
-interim: arr 
-out: arr 

Algorithm:
- initialize results_arr 
- itearte over the array 
- with each iteration:
  - calculate the current sum from the start of the array up until the current element 
  - push into results_arr 
- return results_arr  
=end 

def running_sum(arr)
  results_arr = []
  
  arr.each_index do |num|
    # p arr[0..num]
    run_sum = arr[0..num].sum
    results_arr << run_sum
  end
  results_arr
end


p running_sum([3,1,2,10,1])