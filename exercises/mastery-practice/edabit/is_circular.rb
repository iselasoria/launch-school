=begin 
TODO 

Write a function that determines if an array is circular. An array is circular if its subarrays can be reordered such that each subarray's last element is equal to the next subarray's first element.

For example, the array [[1, 1, 1], [9, 2, 3, 4], [4, 1], [1, 2, 5, 7, 9]] is circular because we can re-arrange the elements to create the following array:

[[9, 2, 3, 4], [4, 1], [1, 1, 1], [1, 2, 5, 7, 9]]
Examples
is_circular([[9, 8], [6, 9, 1], [8, 4, 2], [1, 9], [2, 1, 6]]) ➞ true
# Can be reordered: [[9, 8], [8, 4, 2], [2, 1, 6], [6, 9, 1], [1, 9]]

is_circular([[1, 1], [1, 2]]) ➞ false

is_circular([[2, 1], [1, 2]]) ➞ true

is_circular([[2, 1], [1, 2], [2, 1], [1, 3, 1], [1, 4, 4]]) ➞ false

Notes
In a circular re-ordering, the last subarray's last element must be identical to the first subarray's first element.
Subarrays will contain at least one element.

I: array 
O: array 

Rules:
- a circular subarray:
  - when the array is reordered, the last element must be identical to the first subarrays first element 
  - essentially, does the subarray's last element have a match amongst any of the remaining subarrays. As long as it does, it's circular
  - the array must be re-arranged. If array after rearrangement is the same as the input array, false 

Examples:
  [[1, 2], [2, 3], [3, 4], [4, 5]]) == false
  * no other arrangement possible 

  [[9, 8], [6, 9, 1], [8, 4, 2], [1, 9], [2, 1, 6]]
    9  8    6     1    8     2    1  9    2     6 

  [[9, 8] ---> does 8 exist as a first or last anywhere, if so, next 
  [6, 9, 1] --> does 6 exist as a first or last anywhere if so, next 
  [8, 4, 2] ---> does 8 exist as a first or last anywhere, if so, next 
  [1, 9] ---> does 1 exist as a first or last anywhere, if so, next 
  [2, 1, 6]] ---> does 2 exist as a first or last anywhere, if so, next 


DS: 
I: array 
Interm: array 
O: boolean 

Algorithm:
- get a trnasformation of all subarrays first and last elements and store in `first_and_lasts`

- iterate over the input array 
  - check if the current subarray's first element exist anywhere in all the other subarrays first or last element 
    - if it does, skip
    - otherwise return false 
  - catch all with true 
=end 

def is_circular(arr)
  all_possible = arr.permutation(arr.size).to_a
  all_possible.each do |item|
  
  end 
  
end
# test cases 
# p is_circular([[9, 8], [6, 9, 1], [8, 4, 2], [1, 9], [2, 1, 6]]) #== true
# p is_circular([[1, 2, 7], [7, 9, 3], [3], [3, 4], [4, 2, 1]]) == true
# p is_circular([[1, 2], [2, 3], [3, 4], [4, 5]]) == false
# p is_circular([[9, 9], [9, 2], [2, 9], [9, 5], [5, 9], [9, 6], [6, 9]]) == true
# p is_circular([[1, 2], [4, 1], [3, 4], [2, 3]]) == true
# p is_circular([[1, 1], [1, 2]]) == false
p is_circular([[6, 7, 8, 9], [1, 2, 3, 4, 5, 6], [6, 6, 9], [9, 0, 1]]) #== false
# p is_circular([[2, 1], [1, 2]]) #== true
# p is_circular([[2, 1], [1, 2], [2, 1], [1, 3, 1], [1, 4, 4]]) == false