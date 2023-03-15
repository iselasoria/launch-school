=begin
* DONE 20m02s
We can assign a value to each character in a word, based on their position in the alphabet (a = 1, b = 2, ... , z = 26). A balanced word is one where the sum of values on the left-hand side of the word equals the sum of values on the right-hand side. For odd length words, the middle character (balance point) is ignored.

Write a function that returns true if the word is balanced, and false if it's not.
Examples

balanced_word("zips") ➞ true
# "zips" = "zi|ps" = 26+9|16+19 = 35|35 = true

balanced_word("brake") ➞ false
# "brake" = "br|ke" = 2+18|11+5 = 20|16 = false

Notes

    All words will be lowercase, and have a minimum of 2 characters.
    Palindromic words will always be balanced.

I: string 
O: boolean 

Rules:
- palidnrome are always balanced 
- to be balanced:
  - have a sum of its character values on both sides be the same 
- character values are given by the position in the alphabet a=1, b=2, etc 
- words get sliced in half, and middle characters when present, never count 

Examples:
'disillusioned' == false
disill u sioned
  size: 13 
  first half from 0 to middle, exlusive 
  second half from middle + 1 to end 
  sum each half's position values 
  if both the same, true 

DS:
I: string 
Interm: hash to store positionis adn letters, arrays 
O: boolean 

Algorithm:
- create a hash for `alphabet_positions`
- if even
    * inlcude middle 
    - define fh as a slcie from 0 to mmiddle, exlcusive 
    - define sh as slice from middle + 1 to end 
    - transform each half to its position values and sum 
    - return true if both halves' sums are the same 
    - otherwise false 
- if odd:
- iterate over the strings characters 
    - define fh as a slcie from 0 to mmiddle, exlcusive 
    - define sh as slice from middle + 1 to end 
    - transform each half to its position values and sum 
    - return true if both halves' sums are the same 
    - otherwise false 
=end

def balanced_word(str)
  alphabet_positions = ('a'..'z').to_a.zip(1..26).to_h
  
  if str.size.even?
    middle = str.size / 2
    fh = str[0...middle]
    sh = str[middle..-1]
    f_sum = fh.chars.map {|ch| alphabet_positions[ch]}.sum
    s_sum = sh.chars.map {|ch| alphabet_positions[ch]}.sum
    f_sum == s_sum
  else
    middle = str.size / 2
    fh = str[0...middle]
    sh = str[middle + 1..-1]
    f_sum = fh.chars.map {|ch| alphabet_positions[ch]}.sum
    s_sum = sh.chars.map {|ch| alphabet_positions[ch]}.sum
    f_sum == s_sum
  end 
end 


# seas o ning

p balanced_word('at') == false
p balanced_word('forgetful') == false
p balanced_word('vegetation') == true
p balanced_word('disillusioned') == false
p balanced_word('abstract') == true
p balanced_word('clever') == false
p balanced_word('conditionalities') == true
p balanced_word('seasoning') == true
p balanced_word('uptight') == false
p balanced_word('ticket') == false
p balanced_word('calculate') == false
p balanced_word('measure') == false
p balanced_word('join') == false
p balanced_word('anesthesiologies') == true
p balanced_word('command') == false
p balanced_word('graphite') == true
p balanced_word('quadratically') #== true
p balanced_word('right') == false
p balanced_word('fossil') == true
p balanced_word('sparkling') == false
p balanced_word('dolphin') == true
p balanced_word('baseball') == true
p balanced_word('immense') == false
p balanced_word('pattern') == true
p balanced_word('hand') == false
p balanced_word('radar') == true
p balanced_word('oven') == false
p balanced_word('immutability') == true
p balanced_word('kayak') == true
p balanced_word('bartender') == true
p balanced_word('weight') == false
p balanced_word('lightbulbs') == true
p balanced_word('tail') == true