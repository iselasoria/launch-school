=begin 
* DONE 15m42s
Write a function that pairs the first number in an array with the last, the second number with the second to last, etc.
Examples

pairs([1, 2, 3, 4, 5, 6, 7]) ➞ [[1, 7], [2, 6], [3, 5], [4, 4]]

pairs([1, 2, 3, 4, 5, 6]) ➞ [[1, 6], [2, 5], [3, 4]]

pairs([5, 9, 8, 1, 2]) ➞ [[5, 2], [9, 1], [8, 8]]

pairs([]) ➞ []

Notes
    If the array has an odd length, repeat the middle element twice for the last pair.
    Return an empty array if the input is an empty array.

I: array 
O: nested array 

Rules:
- return empty when input is empty 
- if size is odd, middle char gets paired with itself
- if its even, then evently paired
- pairs are formed:
  - if at the center, outermost number get paired together 

Examples:
input: [1, 2, 3, 4, 5, 6, 7]
middle:          4 
fh:    [1, 2, 3]
sh:                [5, 6, 7]
reverse secod         [7,6,5]
[1, 2, 3]
[7, 6, 5]
* add middle char as a pair of itself 

DS: 
arrays 

Algorithm:
- if input array size is odd
  # middle is index at half the array size ** just index 
  # define first half as arr from start to middle, exlusive 
  # define second half as arr from middle + 1 to the end 
  # reverse second half, and zip with first 
  # make a pair of middle char repeated # [4,4]
  # push to the zipped 
  - if itrs even 
  # define first half as arr from start to middle, exlusive 
  # define second half as arr from middle + 1 to the end 
   # reverse second half, and zip with first 

=end

def pairs(arr)
  return [] if arr.empty?

  if arr.size.odd?
    middle = arr.size / 2 # index only
    fh = arr[0...middle]
    sh = arr[middle + 1..-1].reverse
    fh.zip(sh) << [arr[middle], arr[middle]]
  else
    middle = arr.size / 2 # index only
    fh = arr[0...middle]
    sh = arr[middle..-1].reverse
    fh.zip(sh)
  end
end


p pairs([1, 2, 3, 4, 5, 6]) == [[1, 6], [2, 5], [3, 4]]
p pairs([1, 1, 4, 4, 5, 5]) == [[1, 5], [1, 5], [4, 4]]
p pairs([5, 6]) == [[5, 6]]

p pairs([1, 2, 3, 4, 5, 6, 7]) == [[1, 7], [2, 6], [3, 5], [4, 4]]
p pairs([9, 9, 9, 9, 3, 3, 9]) == [[9, 9], [9, 3], [9, 3], [9, 9]]
p pairs([5, 9, 8, 1, 2]) == [[5, 2], [9, 1], [8, 8]]
p pairs([5, 6, 7]) == [[5, 7], [6, 6]]
p pairs([5]) == [[5, 5]]
p pairs([]) == []