=begin 
-----------------------INSTRUCTIONS--------------------------------------
Write a method that displays a 4-pointed diamond in an n * n grid, where
`n` is an odd integer that is supplied as an arguments to the method. You may 
assume that the arguments will always be an odd integer.

--------------------------PROBLEM----------------------------------------
Questions:
Input: intger
Output: a series of string characters using especial symbol (*)
---------------------------RULES-----------------------------------------
Explicit: 
- regardless of the value of `n`, all diamons begin with 1 star
- each row grows by 2 stars until it reaches a maximum and then tapers back to one
Implicit: 
--------------------------EXAMPLES---------------------------------------
diamond(1)
*

diamond(3)
 *
***
 *

 diamond(9)
    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
----------------------------ALGO----------------------------------------
- read `n`
- output 1 star
- increase the number of stars by 2
  - output the new number of stars
  - reapeat until you reach `n` number of stars
- start decreasing the number of stars by 2 
  - output newly descreased number of stars
  - reapeat until you get back to 1

=end


def diamond(n)
  star = '*'
  space = ' '
  moving_stars = 1
  max_stars = n

  loop do
    puts "#{space * (max_stars - moving_stars/2)} #{star * moving_stars}"
    moving_stars += 2
 
    # p "Moving stars is now: #{moving_stars}"
    # p "#{space * (max_stars - moving_stars/2)}"
    break if max_stars == moving_stars -2
  end

  loop do
    puts "#{space * (max_stars - moving_stars/2)} #{star * moving_stars}"
    moving_stars -= 2
    break if moving_stars < 1
  end
end



# test cases
diamond(1)

diamond(3)

diamond(9) 

