# * DONE 14m37s

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.


=begin 
I: array of integers 
O: array of integers 

Rules:
- each number only gets counted once 
- find how many numbers are SMALLER than current number in the iteration 

Examples:
input: [8,1,2,2,3]
       [3,0,1,1,2]
input: [1] 
        * no other numbers are smaller than it because current_num cannot be smaller or greater than current_num, it just is 

input: [7,7,7,7]
       [0,0,0,0]
       * no other number in the array is smaller or greater, just equal 
  
input: [6,5,4,8]
       [2,1,0,3]

Data Structures:
I: arr 
Interim: arr 
O: arr 

Algorithm:
- if arr size is 1, return [0]

- iterate over array, transform # [8,1,2,2,3]
  - with each iteration, current_num  with count? # 8
    - iterate over the whole array (again)
      - count the occurences of current_num in unique array 

=end

def smaller_numbers_than_current(arr)
  arr.map do |current_num|
    arr.uniq.count {|item| item < current_num}
  end
end


# Examples:

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]



p smaller_numbers_than_current([1]) == [0]

# The tests above should print "true".
