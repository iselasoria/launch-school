=begin
* DONE 1m
Write a method that takes an Array of numbers, and returns an 
Array with the same number of elements, and each element has the 
running total from the original Array.


Rules:
- each element is the runnign sum of all elements upo until then

Algorithm:
- initialize results_arr
- iterate over array 
  - current_arr is original array from the start until current index
  - sum up current_arr
  - push current_arr into results_arr
- return results_arr
=end


def running_total(arr)
  results_arr = []

  arr.each_index do |idx|
    current_arr = arr[0..idx].sum 
    results_arr << current_arr
  end
  results_arr
end


# test cases
p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []