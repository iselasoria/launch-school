=begin
Write a method that returns an array that contains every other element
of an array that is passed in as an argument. The values in the returned list 
should be those values that are in the 1st, 3rd, 5th, and so on elements of the argument array.


-------P
input: array
output: array
Rules:
-implicit: if the input array is empty, the return is also empty

Goal: resulting array contains elements from the return array that were in position, 1, 3, 5, etc.

-------E
[1, 2, 3, 4, 5, 6] == [1, 3, 5]
[2, 3, 4, 5, 6] == [2, 4, 6]



-------D

-------A
- initialize an empty array object that will hold the resul
- iterate over the input array and its index
  - for every element in the array
    - if the index + 1 (starting index 0/position 1) can be modulated, that is to say, it is even
      - push element into the results array
- return the results array

=end

def oddities(arr)
  results_arr = []

  arr.each_with_index do |item, idx|
    if idx.even?
      results_arr << item
    end
  end
  results_arr
end


# test cases
p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []

# DONE