=begin 
* DONE 02m00s
You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)


I: arr 
O: integer 

Rules:
  - count how many pairs can be made 
  - if input is empty array or single element array return 0
 
Examples:
[1, 2, 5, 6, 5, 2]
1->1 
2->2
5->2
6->1
* divided by 2 to check pairs 
  - 0 1 1 0 ----> 2
=end 
def pairs(arr)
  return 0 if arr.empty? || arr.size == 1
  arr.tally.values.map{|item| item/2}.sum
end

# test cases 
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3 
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0