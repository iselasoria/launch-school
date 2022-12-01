=begin
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

Input: two arrays
Outout: array 

Rules:
- don't sort the results
- sort and paste as you go

Goal: to make an array that contains elements from the input arrays all sorted in ascending order

Examples / Model Solutuion:
[1, 5, 9] [2, 6, 8]
[1, 2, 5, 6, 8, 9]

Data:
Points to Capture:
- index 

Data Structures:
 - Input: arrays 
 - Intermediate: arrays 
 - Outut: arrays 

Algorithm: 
Main Method: merge(arr1, arr2)
- sort both arrays but dont mutate
- initialize `starting_arr`
- initialize a `results_arr`
- get min of arr1 and min of arr2
  - if arr1.min is smaller than arr2.min then set arr1 to `atarting_arr` otherwise set arr2 to it and set the minimum number of the two arrays to `results_arr`
  - iterate over `starting_arr` which should be a copy of one of the arrays and if the current iteration is smaller than the second array at current iteration
    - push current
  - if they are the same
    - push current
    - push other arrrays current
  - otherweise
    - push the other arrays current iteration
    - return results_arr 

=end

def merge(arr1, arr2)
  arr1
end

# test cases
p merge([1, 5, 9], [2, 6, 8]) #== [1, 2, 5, 6, 8, 9]
# p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]