=begin 
https://edabit.com/challenge/dqYajYDEh48TCjBrv

Given two words, the letter distance is calculated by taking the absolute value of the difference in character codes and summing up the difference.

If one word is longer than another, add the difference in lengths towards the score.

To illustrate:

letter_distance("house", "fly") = dist("h", "f") + dist("o", "l") + dist("u", "y") + dist(house.length, fly.length)

= |104 - 102| + |111 - 108| + |117 - 121| + |5 - 3|
= 2 + 3 + 4 + 2
= 11

letter_distance("sharp", "sharq") ➞ 1

letter_distance("abcde", "Abcde") ➞ 32

letter_distance("abcde", "bcdef") ➞ 5

Always start comparing the two strings from their first letter.
Excess letters are not counted towards distance.
Capital letters are included.

I: two strings 
O: integer 

Rules:
- values to be computed on are the positions int he ascii table 
- capital letters can be included, no special characters 
- letter_distance is computed by:
  - difference in ascii position between letters at the same index 
        01234
    ex: house
        fly 
        (h-f)(o-l)(u-y)(5-3)
- if words are different sizes, add the difference in length toward their total difference 

Examples:
input: 'abcde' and  'Abcde'
       01234
str1  'abcde'
str2  'Abcde'
      (str1[0] - str2[0]) + (str1[1] - str2[1]....)

Data Structures:
I: strings 
Interim: arrays 
O: integer 

Algorithm:
- init `trailing_diff` if str sizes are different 

- zip the characters in the two strings and store in `pairs_arr` --> will include nils that have to be handled 
- init results_arr = []
- iterate over pairs_arr # [[97,104]....[]]
  - with each iteration 
    - get the ordinal value of each character # [[97,104]....[]]
    - calculate the difference here too # pair[0] - pair[1] absolute value and store in results_arr

- return the sum of the results_arr if str sizes are the same
   otherwise return sum of results_arr + trailing_diff
=end 

def letter_distance(str1, str2)
  if str1.size != str2.size 
    trailing_diff = (str1.size - str2.size ).abs
  end 
  
  pairs_diff = str1.chars.zip(str2.chars).each {|item| item.compact!} # TODO # each needs mutated, map does not!

  results_arr = []
  pairs_diff.each do |pair|
    next if pair.size != 2
    results_arr << (pair[0].ord - pair[1].ord).abs
  end

  str1.size != str2.size ? results_arr.sum + trailing_diff : results_arr.sum
end

# test cases 
p letter_distance('house', 'fly') == 11
p letter_distance('sharp', 'sharq') == 1
p letter_distance('abcde', 'bcdef') == 5
p letter_distance('abcde', 'a') == 4
p letter_distance('abcde', 'e') == 8
p letter_distance('abcde', 'Abcde') == 32
p letter_distance('abcde', 'A') == 36
p letter_distance('very', 'fragile') == 67