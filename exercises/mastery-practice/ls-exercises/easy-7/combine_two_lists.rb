=begin 
* DONE 1m54s
Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

I: two arrays 
O: array 

Rules:
- elements are to be placed in alternation 

Examples:
[1, 2, 3], ['a', 'b', 'c']
[1, 'a', 2, 'b', 3, 'c']

=end 


def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end
p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']