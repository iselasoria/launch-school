=begin 
Prior to having fancy iPhones, teenagers would wear out their thumbs sending SMS messages on candybar-shaped feature phones with 3x4 numeric keypads.

------- ------- -------
|     | | ABC | | DEF |
|  1  | |  2  | |  3  |
------- ------- -------
------- ------- -------
| GHI | | JKL | | MNO |
|  4  | |  5  | |  6  |
------- ------- -------
------- ------- -------
|PQRS | | TUV | | WXYZ|
|  7  | |  8  | |  9  |
------- ------- -------
------- ------- -------
|     | |space| |     |
|  *  | |  0  | |  #  |
------- ------- -------

Prior to the development of T9 (predictive text entry) systems, the method to type words was called "multi-tap" and involved pressing a button repeatedly to cycle through the possible values.

For example, to type a letter "R" you would press the 7 key three times (as the screen display for the current character cycles through P->Q->R->S->7). A character is "locked in" once the user presses a different key or pauses for a short period of time (thus, no extra button presses are required beyond what is needed for each letter individually). The zero key handles spaces, with one press of the key producing a space and two presses producing a zero.

In order to send the message "WHERE DO U WANT 2 MEET L8R" a teen would have to actually do 47 button presses. No wonder they abbreviated.

For this assignment, write a module that can calculate the amount of button presses required for any phrase. Punctuation can be ignored for this exercise. Likewise, you can assume the phone doesn't distinguish between upper/lowercase characters (but you should allow your module to accept input in either for convenience).

Hint: While it wouldn't take too long to hard code the amount of keypresses for all 26 letters by hand, try to avoid doing so! (Imagine you work at a phone manufacturer who might be testing out different keyboard layouts, and you want to be able to test new ones rapidly.)


I: string (any case)
O: integer 

Goal: to find out how many times we need to press buttons to type the text message 


Examples:
input:   'LOL'
presses:  333
sum_press: 9

input:   'HOW R U'
presses:  2311312
sum_press:   3

Data Structures:
I: string 
Interim: array or nested array or a hash 
O: integer 

Scratchpad:
# iterate 0-9 top iteration
# inner iteration that goes from 0-2 except when index is 8 and 10, then its 0-3

Ideal Data Strucures:
"LOL"
alphabet = {0=>[' '], 1=>['a','b','c'], 2=>['c','d','e'], 3=>['e','f','g']...5 =>['j','k','l']]


Algoriothm:
- alphabet object a-z--> chunked in 3s and a pair of 4s chunk_while?? this is a hash?
- Iterate over string # 'L','O','L'
- Iterate over a range of 0-9 representing the keys # key: 5
  - for each key on keyboard 
    - access the value at current key # ['j','k','l']
      - get index at current letter 

=end

def presses(str)
  tecla = (0..9).to_a
  alphabet = ('a'..'z').to_a.unshift(' ') # a needs to be 1 and 0 is the space
p alphabet.zip(0..27).to_h
  keyboard = alphabet.each_with_index.slice_when do |(item, idx)| 
    # (tecla[idx] != 7 && idx % 3 == 0 ) || (tecla[idx] != 9 && idx % 3 == 0)
    # (tecla[idx] != 7 && idx % 3 == 0 ) || (tecla[idx] != 9 && idx % 3 == 0)
    idx % 3 == 0 && idx != (idx % 3 == 0 + 1)
  end

  keyboard.each_with_object({}) do |button, keypad_hash|
    p button
    # keypad_hash[
  end

end

p presses("LOL") #== 9
# p presses("HOW R U")== 13


=begin 
{" "=>0, 
"a"=>1, "b"=>2, "c"=>3,
 "d"=>4, "e"=>5, "f"=>6, 
 "g"=>7, "h"=>8, "i"=>9, 
 "j"=>10, "k"=>11, "l"=>12, 
 "m"=>13, "n"=>14, "o"=>15, 
 "p"=>16, "q"=>17, "r"=>18, "s"=>19, 
 "t"=>20, "u"=>21, "v"=>22, 
 "w"=>23, "x"=>24, "y"=>25, "z"=>26}
=end 