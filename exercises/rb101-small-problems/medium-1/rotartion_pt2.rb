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
  custom_rotated = []
  list_of_chars = cifra.to_s.chars
  # list_of_chars[-n..-1] # from the n you want to grab, up until the end
  custom_rotated = list_of_chars[0..-n -1]
  custom_rotated << rotate_array(list_of_chars[-n..-1])

  custom_rotated.flatten!.join().to_i
end

# p rotate_rightmost_digits(735291, 2)



# test cases
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

# * DONE