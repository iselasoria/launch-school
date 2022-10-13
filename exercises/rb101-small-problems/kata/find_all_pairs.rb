# ! 7 kyu on Ruby 3.0+
=begin
You are given array of integers, your task will be to count all pairs in that array and return their count.
Notes:
- Array can be empty or contain only one value; in this case return 0
- If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
- Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
--------------------------PROBLEM-----------------------
Input: array
Output:  integer
--------------------------EXAMPLES----------------------
pairs([1, 2, 5, 6, 5, 2]) # ==>  2 because there are two pairs of the number 2 and the number 5
pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) # ==> 4 because there are two pairs of the number 2
----------------------------ALGO------------------------
- read array
- iterate through arrauy
  - get a tally of the elements
  - if in the tally hash, there are values that are even and at least 2
    - store that current key in a new array called pairs
    - count the elements in the pairs array
=end
def pairs(arr)
  tally_up = arr.tally
  pairs = []

  if tally_up.size == 0
    pairs << 0
  else
    tally_up.each do |k, v|
      pairs << (v / 2)
    end
  end
  pairs.inject {|sum, num| sum + num}
end


# test cases
p pairs([1, 2, 5, 6, 5, 2])#== 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2])#== 4
# p pairs([0, 0, 0, 0, 0, 0, 0])== 3 
# p pairs([1000, 1000])== 1
# p pairs([])== 0
# p pairs([54])== 0
# * DONE