=begin 
* DONE 2m38s
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.

Algo:
-zip lists 
- iterate through zipped list 
  - inject sum 

=end 

def multiply_list(arr1, arr2)
  zip_up = arr1.zip(arr2)

  zip_up.map {|pair| pair.inject(&:*)}
end
# test cases 
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
