=begin 

A strict bouncy array of numbers, of length three or longer, is an array that each term (neither the first nor the last element) is strictly higher or lower than its neighbours.

For example, the array:

arr = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8] (length = 16)
The two longest bouncy subarrays of arr are

[7,9,6,10,5,11,10,12] (length = 8) 
[4,2,5,1,6,4,8] (length = 7)

According to the given definition, the arrays [8,1,4,6,7], [1,2,2,1,4,5], are not bouncy.
*****
For the special case of length 2 arrays, we will consider them strict bouncy if the two elements are different.
The arrays [-1,4] and [0,-10] are both bouncy, while [0,0] is not.
An array of length 1 will be considered strict bouncy itself.
****

You will be given an array of integers and you should output the longest strict bouncy subarray.

In the case of having more than one bouncy subarray of same length, it should be output the subarray with its first term of lowest index in the original array.

Let's see the result for the first given example.

arr = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]
longest_bouncy_list(arr) === [7,9,6,10,5,11,10,12] 

I: array of integers 
O: array of integers 

Rules:
- a subarray is bouncy if:
  - it is EITHER greater than both of its neighbours, OR smaller than both neighbours
   * xor? 
- a subarray with several item but with a unique size of 1, is NOT bouncy 
- a subarray of legnth 1, will always be bouncy 
- a subarray with only two items of different elements will always be bouncy 
- if there is a tie for the longest bouncy, 
  - return the one whose first element, has the lowest index in the original array 
- implict: 
  - first and last items in the subarray are not checked for bouncyness 
  - the chain of bouncyness breaks with the first item we check that does NOT meet the criteria 

Examples:
[7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]

[7,9,6,10,5,11,10,12]

DS:
I: array 
Interim: arrays 
O: array 

Algorithm:

Helper Method: xor?()
- only returns true if ONE SINGLE condition is met 
  - only EITHER smaller than both neighbours
  - or greater than both neighbours


Helper Method: bouncy?(arr)
- skip first and last indexes 
EITHER:
  - if current index is smaller than index - 1 AND smaller than index + 1 
  OR 
  - if current index is larger than index - 1 AND larger than index + 1
  return true 
  otherwise false 

Main Method: longest_bouncy_list(arr)
init array all_bouncy = []
- iterate over the lgnth of the array --> starting index 
  - from the moving starting index to the end of the array --> moving ending index 
    - subarray is defined as a slice of the og_array at starting and up to ending 
    - check for bounciness by passing slice to bouncy? 
      - if the check returns true, push to all_bouncy

- all_bouncy get top 3 by size 
  -if there is a tie (if the above gives more than one)
    - return the subaray whose index in the og_array is the smallest 
=end


def bouncy?(slice) # [4,6,2,8]
  return true if slice.size == 1 
  return false if slice.uniq.size == 1
  return true if slice.uniq.size == 2

  slice.each_with_index do |num, idx|
    prev = slice[idx - 1]
    following = slice[idx + 1]
    next if idx == 0 || idx == slice.size - 1

    p prev 
    p following

    if (num < prev && num < following ) || (num > prev && num < following)
      next
    else
      false 
    end
  end
  false
end

p bouncy?([7, 9, 6, 10, 5, 11, 10, 12])
# p bouncy?([7,9,6,10,5,11,10,12])

# def longest_bouncy_list(og_arr)
#   all_bouncy = []

#   (0...og_arr.size).each do |starting| # 7,9,6,10... [7][7,9][7,9,6],[9][9,6]
#     (starting...og_arr.size).each do |ending|
#       slice = og_arr[starting..ending]
#       # next if slice == og_arr
#       if bouncy?(slice) # if true,
#         all_bouncy << slice 
#       end
#     end
#   end
#   all_bouncy.max_by(3) {|sub| sub.size}
# end

# # # test cases
# arr1 = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]
# p longest_bouncy_list(arr1) #== [7,9,6,10,5,11,10,12]
     
# arr2 = [7,7,7,7,7]
# longest_bouncy_list(arr2) == [7]

# arr3 = [1,2,3,4,5,6]
# longest_bouncy_list(arr3) == [1,2]
