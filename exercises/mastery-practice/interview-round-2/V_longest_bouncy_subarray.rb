=begin

This kata was seen in programming competitions with a wide range of variations. A strict bouncy array of numbers, of length three or longer, is an array that each term (neither the first nor the last element) is strictly higher or lower than its neighbours.

For example, the array:

arr = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8] (length = 16)
The two longest bouncy subarrays of arr are

[7,9,6,10,5,11,10,12] (length = 8) and [4,2,5,1,6,4,8] (length = 7)
According to the given definition, the arrays [8,1,4,6,7], [1,2,2,1,4,5], are not bouncy.

For the special case of length 2 arrays, we will consider them strict bouncy if the two elements are different.

The arrays [-1,4] and [0,-10] are both bouncy, while [0,0] is not.

An array of length 1 will be considered strict bouncy itself.

You will be given an array of integers and you should output the longest strict bouncy subarray.

In the case of having more than one bouncy subarray of same length, it should output the subarray with its first term of lowest index in the original array.

Let's see the result for the first given example.

arr = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]
longest_bouncy_list(arr) === [7,9,6,10,5,11,10,12] 
See more examples in the example tests box.

Features of the random tests

length of the array inputs up to 1000
-500 <= arr[i] <= 500
Enjoy it!


I: array 
O: array 

Rules:
- bouncy: 
  - ignore the first last items in the array 
  - all other items should be either: 
    - smaller than BOTH neighbours
    - larger than BOTH neighbours
  - single element subarrays are considered bouncy # [8]
  - when an array is two elements long, its only bouncy if unique size 2 
    ex) [10, 3] --> bouncy |  [3,3]--> not 

Examples:
[7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]
[7]
[7,9]
[7,9,6] <-- each sub array, ignore first and last 

DS: 
I: array 
Interium: nested arrays 
O: array 

Algorithm:

Helper Method: gen_subs(arr) --> nested array 
  - substrings Algorithm 

Helper Method: bouncy?(subarr) --> boolean
- return true if size is 1 # [3]
- return true if unique size is 2 and size is 2 # [4,1]
- return false if size is 2 and unique size is 1 # [5,5]


  - iterate over the subarray items 
    - skip where index is 0 or size - 1 
      - define prev number 
      - define following number 
      - current 
      - check if current is larger than both prev&following OR current is smaller than both 
        - continue on to the next 
      - return false 

- true 

Main Method: longest_bouncy_list(arr)--> one-dimensional array 
- make a call to the gen_subs to generate all possible substrings store in `subarrays`

- init all_bouncy to []

- iterate over subarrays  
  - for each subarray 
    - check for bounciness--> bouncy?(subarray)
      - if it is bouncy, store in `all_bouncy`

- pick top 3 by size, 
  - return the one with its first element coming first in the original array 
=end


def gen_subs(arr)
  subs = []
  (0...arr.size).each do |st|
    (st...arr.size).each do |nd|
      slice = arr[st..nd]
      subs << slice 
    end 
  end
  subs
end


def bouncy?(sub)
  return true if sub.size == 1
  return true if sub.uniq.size == 2 && sub.size == 2
  return false if sub.uniq.size == 1 && sub.size == 2

  sub.each_with_index do |item, idx|
    next if idx.zero? || idx == sub.size - 1
    prev = sub[idx - 1]
    following = sub[idx + 1]
    if (item > prev && item > following) || (item < prev && item < following)
      next 
    else
      return false 
    end
  end
true 

end 
# p bouncy?([2]) # t 
# p bouncy?([4,4]) # f 
# p bouncy?([4,2]) # t
# p bouncy?([7,9,6,10,5,11,10,12,40]) # t 

def longest_bouncy_list(arr)
  # if a range from first item in arr to last item in array  is proper range, return subarrays second item 
  subarrays = gen_subs(arr)
  if (arr.first..arr.last).to_a == arr 
    return subarrays[1]
  end

  all_bouncy = []

  subarrays.each do |sub|
    all_bouncy << sub if bouncy?(sub)
  end


  all_bouncy.max_by(3) {|subarr| subarr.size}.first



end

arr1 = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]
p longest_bouncy_list(arr1) == [7,9,6,10,5,11,10,12]

arr2 = [7,7,7,7,7]
p longest_bouncy_list(arr2) == [7]

arr3 = [1,2,3,4,5,6]
p longest_bouncy_list(arr3) == [1,2]