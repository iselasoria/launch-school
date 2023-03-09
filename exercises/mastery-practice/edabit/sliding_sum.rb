=begin 
* DONE 09m59s
Create a function that returns the subarrays of n consecutive elements from the original element (arr?) that sum up to k. The function will have the following form: sliding_sum(arr, n, k)

To illustrate:
sliding_sum([3, 4, 1, 9, 9, 0, 3, 5, 4], 3, 8) ➞ [[3, 4, 1], [0, 3, 5]]
# Where [3, 4, 1] and [0, 3, 5] are the only subarrays that sum to 8 with length 3.

Examples

sliding_sum([1, 4, 2, 3, 5, 0], 2, 5) ➞ [[1, 4], [2, 3], [5, 0]]

sliding_sum([5, 5, 5, 5, 5], 1, 5) ➞ [[5], [5], [5], [5], [5]]

sliding_sum([5, 5, 5, 5, 5], 5, 24) ➞ []

Notes

Return an empty array if no subarrays satisfy the (n,k) condition.

I: array, adn two integers 
O: nested arrray 

Rules:
  - n --> the size of the subarrays expected
  - k --> sum to aim for 
  - subarrays are constructed of consecutive items only 
  - making subarrays from the original array  with a size of n and a sum of k 
  - if there are no subarrays that sum up to k, return []

DS:
I: array and two integers 
Interm: array 
O: array 

Algorithm:
init results_arr to []
- get the slices of the array of n size 

- iterate over slices 
  - sum each slice 
    - if sum matches the k_sum then store in results_arr 

=end 
def sliding_sum(arr, size, k_sum)
  slices = arr.each_cons(size).to_a

  results_arr = []
  slices.each do |slice|
  results_arr << slice if k_sum == slice.sum
  end
  results_arr 
end

p sliding_sum([1, 4, 2, 3, 5, 0], 2, 5) == [[1, 4], [2, 3], [5, 0]]
p sliding_sum([5, 5, 5, 5, 5], 1, 5) == [[5], [5], [5], [5], [5]]
p sliding_sum([5, 5, 5, 5, 5], 5, 24)== []
p sliding_sum([3, 2, 1, 1, 3, 2], 4, 7) == [[3, 2, 1, 1], [2, 1, 1, 3], [1, 1, 3, 2]]
p sliding_sum([3, 4, 1, 9, 9, 0, 3, 5, 4], 3, 8) == [[3, 4, 1], [0, 3, 5]]