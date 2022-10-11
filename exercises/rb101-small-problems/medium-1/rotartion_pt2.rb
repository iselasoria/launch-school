=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that can rotate `n` digits of a number. You may use part 1.
rotate_rightmost_digits(735291, 1) == 735291
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: integer
---------------------------RULES-----------------------------------------
Explicit: 
- take n as the number of digits to rotate
- rotating just 1 digit returns the original array
Implicit: 
- `n` will always be a positive integer

--------------------------EXAMPLES---------------------------------------
(735291, 1) --> 735291
(735291, 2) --> 735219
----------------------------ALGO----------------------------------------
- read the integer
- turn integer into a string and then into a list of chars
- iterate through the list of the arrays
  - if the current iteration # == `n` then call part1 method
- return the 
=end

def rotate_array(arre)
  rotated = []
  arre[1..arre.size - 1] << arre.first
end


def rotate_rightmost_digits(cifra, n)
  list_of_chars = cifra.to_s.chars
  p list_of_chars[-n..-1]
  # list_of_chars.each_with_index do |num, idx|
  #   # p num.to_i
  #   # p idx
  #   # if (idx * -1) == n
  #   #   rotate_array(list_of_chars)
  #   # end
  #   p (idx * -1) #== n
  # end
end

p rotate_rightmost_digits(735291, 2)



# test cases
# rotate_rightmost_digits(735291, 1) == 735291
# rotate_rightmost_digits(735291, 2) == 735219
# rotate_rightmost_digits(735291, 3) == 735912
# rotate_rightmost_digits(735291, 4) == 732915
# rotate_rightmost_digits(735291, 5) == 752913
# rotate_rightmost_digits(735291, 6) == 352917

# * TODO