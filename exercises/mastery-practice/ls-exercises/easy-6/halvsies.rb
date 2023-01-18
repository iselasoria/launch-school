=begin
* DONE 15m51s
Write a method that takes an Array as an argument, and returns two Arrays
 (as a pair of nested Arrays) that contain the first half and second half of 
 the original Array, respectively. If the original array contains an odd 
 number of elements, the middle element should be placed in the first half Array.

 I: array 
 O: arrays (2)

 Rules:
 - the new array will be nested
  - each half of the original array will be an element in the new nested array 

Examples:
[1,2,3,4]
[[1,2],[3,4]]

Algorithm:
- 
- if the input array is empty, return nested empty array
- if the input array is one element, return new array[0] with the number in the input array, arr[1] should be empty
- results_arr = []
- if input array is even number
  - determine half as size / 2
  - push arr[0] up to half into results_arr 
  - piush arr at half til the end into results_arr 
- if input array is odd number
  - determine half as size / 2 + 1
  - push arr[0] up to half into results_arr 
  - piush arr at half til the end into results_arr 
=end

def halvsies(arr)
  results_arr = []
  if arr.size.even?
    half = arr.size / 2
    results_arr << arr[0...half]
    results_arr << arr[half..-1]
  else
    half = arr.size / 2 + 1
    results_arr << arr[0...half]
    results_arr << arr[half..-1]
  end
  results_arr
end

# test cases 
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]