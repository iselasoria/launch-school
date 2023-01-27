=begin 
Write a method that can rotate the last n digits of a number. For example:


# Note that rotating just 1 digit results in the original number being returned.
# You may use the rotate_array method from the previous exercise if you want. (Recommended!)
# You may assume that n is always a positive integer.

I: two integers. One is the number, the other the # of digits to rotate 
O: integer 

Rules:
- input number's digits get rotated n numbers starting from the end of the Array

Examples:
inputs:    735291 and 2 
changes:   ____--
indexes:  012345
delta_idx:    45 --> 54 
result:   735219

inputs:   735291 and 5
changes:  _-----
indexes:  012345
delta_idx: 12345 -> 54321
result:   752913


Data Structures:
arrays 

Algorithm:
- iterate over the digits 
- get the size of the arrya that will need changes
  - get a from -1 down to negative n 
  - grab the 

=end 


def rotate_array(arr)

  new_arr = []

  arr.each_with_index do |item, idx|
    next if idx == 0
    new_arr << item 
  end
  new_arr << arr[0]
end

def rotate_rightmost_digits(num, rotations)
  numeros = num.digits.reverse
  rotate_array(numeros)
end

# test cases 
p rotate_rightmost_digits(735291, 1) #== 735291
p rotate_rightmost_digits(735291, 2)# == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

