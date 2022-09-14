=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes two array arguments in which each array contains
a list of numbers, and erturns a new array that contains the product of
every pair of numbers that can be formed between the elements of two arrays.
The results should be stored by increasing value. You may assume that
 neigher argument is an empty array.
--------------------------PROBLEM----------------------------------------
Questions:
Input: two arrays
Output: new array object
---------------------------RULES-----------------------------------------
Explicit: 
- arrays contain numbers
- multiply all possible pairs formed by the two arrays
- result to be sorted from smallest to largest
Implicit:
--------------------------EXAMPLES---------------------------------------
=end
# ----------------------------ALGO---------------------------------------

def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each do |item1|
    arr2.each do |item2|
      new_arr << item1 * item2
    end
  end
  new_arr.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) #== [2, 4, 4, 6, 8, 8, 12, 16]

# *DONE