=begin 
 TODO

Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Rules:
- two arrays 
  - each contains a list of numbers 
- returns new array  that contains the product of every pair 
=end 

def multiply_all_pairs(arr1, arr2)
  prods = []

  arr1.each do |a1|
    arr2.each do |a2|
      prods << a1 * a2
    end
  end
 prods.sort
end
# test cases 
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]