=begin 
https://www.codewars.com/kata/58f6000bc0ec6451960000fd/train/ruby

Given an array, return the reversed version of the array (a different kind of reverse though), you reverse portions of the array, you'll be given a length argument which represents the length of each portion you are to reverse.

E.g

selReverse([1,2,3,4,5,6], 2)
 //=> [2,1, 4,3, 6,5]
if after reversing some portions of the array and the length of the remaining portion in the array is not up to the length argument, just reverse them.

selReverse([2,4,6,8,10,12,14,16], 3)
 //=> [6,4,2, 12,10,8, 16,14]

selReverse(array, length)

array - array to reverse
length - length of each portion to reverse
Note : if the length argument exceeds the array length, reverse all of them, if the length argument is zero do not reverse at all.


I: array and integer 
O: array 

Rules:
  - chunk in lengths of n 
  - reverwse the chunks
  - if there are more chunks of differnet lengths, just reverse them too 
  - if the length is larger than the arr length, reverse all
  - if length is 0, dont reverse at all

Goal: chunk in lengths of n and reverse lengths before combining. 

Examples:

selReverse([1,2,3,4,5,6], 2)
[1,2,3,4,5,6]
 [1,2][3,4][5,6]
 [2,1][4,3][6,5]
 [2,1,4,3,6,5]

 selReverse([2,4,6,8,10,12,14,16], 3)
 [2,4,6,8,10,12,14,16]
 [2,4,6] -> [6,4,2]
 [8,10,12] -> [12,10,8]
 [14,16] -> [16, 14]

 [6,4,2,12,10,8,16,14]

 Data Structures:
 I: arr 
 Interim: array 
 O: array

 Algorithm:
 if n is 0, return input array 
 if n is larger than arr.size, reverse arr 
 - iterate through array in chunk at size n store in `chunked_arr`

 - iterate through chunked_arr 
  - reverse in place 

  - join 
  - iterate over the newly reversed arr and dump each into a new arr 
  - return 

=end 
def sel_reverse(arr, n)
  return arr.reverse if n > arr.size 
  return arr if n == 0

  result = []
  chunked_arr = arr.each_slice(n).to_a.map(&:reverse).each{|item| item.each {|i| result << i}}
  result
end

# test cases 

p sel_reverse([2,4,6,8,10,12,14,16], 2) == [4,2, 8,6, 12,10, 16,14]
p sel_reverse([1,2,3,4,5,6], 2) == [2,1, 4,3, 6,5]

p sel_reverse([1,2,3,4,5,6], 0) == [1,2,3,4,5,6]
p sel_reverse([1,2,3,4,5,6], 10) == [6,5,4,3,2,1]
