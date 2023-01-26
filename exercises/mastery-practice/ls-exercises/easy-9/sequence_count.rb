=begin 
* DONE 
Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.


I: two Integers 
O: array 

Rules:
- first arg is a count 
- second is first number of a sequence 
- returns an array the length of the count argument 
- values will be multoples of the second argument 
- if the count is 0, return empty list 

Examples:
(5, 1) == [1, 2, 3, 4, 5]
starting point: 1
elements will be multiples of 1 
array will be 5 elements long 

(4, -7) == [-7, -14, -21, -28]
starting point: -7 
elements will be multiples of: -7
list will be 4 elements long 


Data Structures:
arrays 

Algorithm:
- initialize `results_arr` as an empty array
- initialize a runner to 1
- start with number as the `starting_point`
- initialize a while loop that runs while the length of result_arr is less than or equal to `count`
- check if the current number is a multiple of count
  - if it is, store in results_arr
  - increase the runner 
- return the result_arr
=end 

def sequence(count, starting_point)
  results_arr = []
  num = starting_point

  count.times do |_|
    results_arr << num 
    num += starting_point
  end
  results_arr
end

# test cases 
p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []