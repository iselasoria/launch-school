=begin 
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence in an array or list of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]

Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty list or array is also a valid sublist/subarray.


I: array that may be empty or negatives 
O: integer 

Rules:
- if list only had negative number, return 0 
- empty list is considered to have 0 max sum 
- easy case: when there are only positive numbers and the max sum is the sum of the whole array 


Examples:
[-2, 1, -3, 4, -1, 2, 1, -5, 4]
-2---------> -2
-2, 1------> -1
-2, 1, 3--->  2
-2, 1, 3 4->  6
* behaving like the substrings algorithm

Data Structures:
I: array 
Interim: nested array 
O: integer 

Algorithm: 
Helper Method: gen_subs(arr)
- susbtrings algoroithm

Main Method: max_sequence(arr)
- make a call to gen_subs() adn store in `subs`
- iterate over the subs array 
  - with each iteration --> each subarray 
    - sum the subarray and store in a new collection 
    - get the max item from that new collection and return 

=end 

def gen_subs(arr)
  subs = []
  (0...arr.size).each do |starting|
    (starting...arr.size).each do |ending|
      slice = arr[starting..ending]
      subs << slice
    end 
  end
  subs 
end


def max_sequence(arr)
  return 0 if arr.empty? || arr.all?{|item| item < 0}
  subs = gen_subs(arr)

  subs.map do |subsequence|
    subsequence.sum
  end.max
end
# test cases 

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11

p max_sequence([-32]) == 0

p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12