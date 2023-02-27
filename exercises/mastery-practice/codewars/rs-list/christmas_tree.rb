=begin 
https://www.codewars.com/kata/5a405ba4e1ce0e1d7800012e
Task
Christmas is coming, and your task is to build a custom Christmas tree with the specified characters and the specified height.

Inputs:
chars: the specified characters.
n: the specified height. A positive integer greater than 2.
Output:
A multiline string. Each line is separated by \n. A tree contains two parts: leaves and trunks.
The leaves should be n rows. The first row fill in 1 char, the second row fill in 3 chars, and so on. A single space will be added between two adjust chars, and some of the necessary spaces will be added to the left side, to keep the shape of the tree. No space need to be added to the right side.

The trunk should be at least 1 unit height, it depends on the value of the n. The minimum value of n is 3, and the height of the tree trunk is 1 unit height. If n increased by 3, and the tree trunk increased by 1 unit. For example, when n is 3,4 or 5, trunk should be 1 row; when n is 6,7 or 8, trunk should be 2 row; and so on.

Still not understand the task? Look at the following example ;-)

Examples
For chars = "*@o" and n = 3,the output should be:

  *
 @ o
* @ o
  |

For chars = "*@o" and n = 6,the output should be:

     *
    @ o
   * @ o
  * @ o *
 @ o * @ o
* @ o * @ o
     |
     |
  
For chars = "1234" and n = 6,the output should be:

     1
    2 3
   4 1 2
  3 4 1 2
 3 4 1 2 3
4 1 2 3 4 1
     |
     |
For chars = "123456789" and n = 3,the output should be:

  1
 2 3
4 5 6
  |


I: string (character_series)
O: integer (rows)

Rules:
- height of the tree is n rows 
- trunk is to be 2 pipes if the rows are more than 3 or 1 if the tree will be small 
- character_series populates length of the row over and over 
- rows increase by 2 ex: 1, 3, 5, etc 
- space padding happens on the left side only
  "  *"
  " @ o"
  "* @ o"
  "  |  "

Examples / Model Solution:
custom_christmas_tree("*@o",3)
  "  *"
  " @ o"
  "* @ o"
  "  |  "


=end 

# test cases 

def custom_christmas_tree(character_series, rows)
  1.upto(rows).each do |row|
    if row.even? 
      next 
    end
    p row
  end
end

p custom_christmas_tree("1234",6) #== 
# "     1
#     2 3
#    4 1 2
#   3 4 1 2
#  3 4 1 2 3
# 4 1 2 3 4 1
#      |
#      |"


# p custom_christmas_tree("*@o",3) == 
# "  *
#   @ o
#  * @ o
#   |"
  
# p custom_christmas_tree("*@o",6) == 
# "     *
#     @ o
#    * @ o
#   * @ o *
#  @ o * @ o
# * @ o * @ o
#      |
    #  |"


# p custom_christmas_tree("123456789",3) == 
# "  1
#  2 3
# 4 5 6
#   |"