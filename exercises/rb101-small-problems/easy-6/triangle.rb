=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a positive integer, n, as an argument, and displays
a right triangle whose sides each have n stars. The hypotenuse of the triangle,
the diangonal side, should have one enf at the lower-left of the triangle, 
and the other end at the upper-right
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: a series of strings forming a triangle
---------------------------RULES-----------------------------------------
Explicit: hypotenuse should have one end at lower-left and the other end at upper-right
          each row has one more star than the previous
          space is conserved regardless of the number of stars in each row
          n represents the number of stars each side is to have
          n is also the number of rows forming the triangle
Implicit: the last/first * gets reused in the counter of each side
--------------------------EXAMPLES---------------------------------------
=end

# set a constant for the star STAR = '*'
# set a range from 1 to n
# iterate the range set in previous step
# print empty space x n -1, followed by STAR starting at 1 in the range
# as the iteration proceeds, empty_space is reduced by 1, and STAR is increased by 1
#-----------------------------ALGO----------------------------------------

STAR = '*'
SPACE = ' '
def triangle(n)
  list = (1..n).to_a
  start_counter = 1
  space_counter = n
  list.each do |current_row|
    # puts SPACE * list[-1] + STAR
    puts (SPACE * space_counter) + (STAR * start_counter)
    space_counter -= 1
    start_counter += 1
  end
end

p triangle(5)
p triangle(9)
# test cases
