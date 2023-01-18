=begin 
* DONE 2m58s
Write a method that takes two Arrays as arguments, and returns an Array 
that contains all of the values from the argument Arrays. There should 
be no duplication of values in the returned Array, even if there are 
duplicates in the original Arrays.


I: two arrays 
O: array 

Rules:
- result array should include all the elements from the two input arrays with no dupes
- items should be sorted

Algorithm:
zip two arrays
flatten
=end

def merge(arr1, arr2)
  arr1.zip(arr2).flatten.sort.uniq!
end

p merge([1, 3, 5], [3, 6, 9])== [1, 3, 5, 6, 9]