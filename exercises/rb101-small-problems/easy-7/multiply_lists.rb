=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes two array arguments in which each array contains
a list of numbers, and returns a new array that contains the product each 
pair of numbers from the arguments that have the same index.
You may assume that the arguments contain the same number of elements.
--------------------------PROBLEM----------------------------------------
Questions:
Input: two arrays of numbers
Output: a new array where each element is the product of the two elements 
in each of the input arrays that were at the same index
---------------------------RULES-----------------------------------------
Explicit: 
  - the arrays contain the same number of elements
  - the result is a new array
Implicit: 
--------------------------EXAMPLES---------------------------------------
=end
# iterate through the first array
# with each iteration, grab the correspondoing element from the second array using its index
#----------------------------ALGO----------------------------------------


def multiply_list(arr1, arr2)
  multiplied = []
  arr1.each_with_index do |num1, idx1|
    arr2.each_with_index do |num2, idx2|
      # p num2
      # p "Second Arr index: #{idx2}"
      if idx1 == idx2
        multiplied << num1 * num2
      end
    end
  end
  multiplied
end

# LAUNCH SCHOOL SOLUTION
def multiply_list(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end
#! We don't need two layer iteration, if we iterate one array, we can use its index variable in the block to acces index at the second array

# test cases
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]