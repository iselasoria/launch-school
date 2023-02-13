=begin 
Your goal in this kata is to implement a difference function, which subtracts one list from another and returns the result.

It should remove all values from list a, which are present in list b keeping their order.

array_diff([1,2],[1]) == [2]
If a value is present in b, all of its occurrences must be removed from the other:

array_diff([1,2],[1]) == [2]


I: array 
O: array 

Rules:
- if a value is present is second arg, remove it from first 
- return the result of subtracting one array from another 

Examples:
[1,2,3] - [1,2]

Data Structures:
- arrays

Algorithm:
- subtract one array from another 
- iterate over the first array 
  - select all items from arr1, that are NOT included in array 2 
=end 

def array_diff(arr1, arr2)
  arr1.reject do |item|
    arr2.include?(item)
  end
end 


# test cases 
# 
p array_diff([1,2], [1]) == [2]
p array_diff([1,2,2], [1]) == [2,2]
p array_diff([1,2,2], [2]) == [1]
p array_diff([1,2,2], []) == [1,2,2]
p array_diff([], [1,2]) == []
p array_diff([1,2,3], [1,2]) == [3]
