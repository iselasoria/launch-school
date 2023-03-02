=begin 
* DONE 29m47s
Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.


I: integer 
O: string in the shape of a diamond

Rules:
- n is a given integer 
- grid is nXn

Examples:
input: 9
top half:
  - spaces up to and not including half of n 
    - start at n/2 
    - string size grows by 2 each time until its size of n 
bottom half:
    - when it reaches full size, 
      - size starts shrinking by 2 until it's back to half the size of n 

DS: 
- strings 

Algorithm:
- init half to n/2 + 1
- init star to '*'
- init star_iterator to n/2
- init space to ' '
- init space_iterator to 1

- from 0 up to half
  -( space * space_iterator) + (star * start_iterator)
  - increase start_iterator by 2 and decraese space_iterator by 1

- output a line of n 

- from half down to 0
  - decraese star_iterator by 2, incraese space_iterator by 1 
  - -( space * space_iterator) + (star * start_iterator)
=end 

def diamond(n)
  half = n/2 + 1
  star_iterator = 1
  space_iterator =  n / 2

  0.upto(half) do |num|
    p (' ' * space_iterator) + ('*' * star_iterator) 
      space_iterator -= 1 
      star_iterator += 2
    if num == 3
      p (' ' * space_iterator) + ('*' * star_iterator) 
      break 
    end    
  end
  # star_iterator -= 1

  (half-1).downto(0) do |num|
    space_iterator += 1
    star_iterator -= 2
    p (' ' * space_iterator) + ('*' * star_iterator) 
    break if num <= 1
  end

end


####
# * DONE 3m36s
# Algorithm:
# - init string to '*'
# - center the string to n 


def diamond(n)
  star = '*'

  1.upto(n) do |num|
    next if num.even?
    p (star * num).center(n, " ")
  end

  (n-1).downto(1) do |num|
    next if num.even?
    p (star * num).center(n, " ")
  end
end

p diamond(9)
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# p diamond(3)
#   #   *
#   #  ***
#   #   *

# p diamond(1)

# # *