=begin 
* DONE 33m15s
In this challenge, it's time to ban some impenitent digit!

Your job is to delete the digits of a given number that, within their name written in English, contain a given vowel.

Given an integer n, and a string ban being the vowel to search, implement a function that returns:

    If the given vowel is not present in the name of any of the digits of n, the same n.
    If n has at least a digit that contains the given vowel in its name, the new integer obtained after the elimination of banned digits (as a natural number without leading zeros).
    If all digits of n are banned, a string "Banned Number".

Examples

digital_vowel_ban(143, "o") ➞ 3
# 1 = "One" contains "o" (banned).
# 4 = "Four" contains "o" (banned).
# 3 = "Three" is safe.

digital_vowel_ban(14266330, "e") ➞ 4266
# "One" contains "e" (banned).
# "Four", "Two" and "Six" are safe.
# "Three" and "Zero" contain "e" (banned).

digital_vowel_ban(4020, "u") ➞ 20
# "Four" contains "u" (banned).
# Leading zeros are not considered.

digital_vowel_ban(586, "i") ➞ "Banned Number"
# All digits ("Five, "Eight", "Six") contain "i".

Notes

Every given number will be a positive integer greater than 0.

I: integer and a vowel to search (str)
O: integer or string 

Rules:
- a digit gets banned, if its english name contains the searhc vowel 

- return number if the search vowel is NOT in any of the english names of the digits of the input number 
- banning digits whose english name contains the search vowel, and returning the new valid number (no leading zeros) after the elimination of the banned digit 
- if all digits of n are banned, return 'Banned Number'


Examples:
input: 143 and 'o'
      one four three 
       X   X    *
      new valid number: 3

input: 586 and 'i'
      five eight six 
      X     X     X
      returns "Banned Number"

input: 4020 and 'u'
      four zero two zero 
      X     *    *   *
            0     2   0
            new valid number: 20 
      
Data Structures:
I: integers and strings 
Interim: array of strings 
O: integer or a string 

Algorithm:

- generate a hash with keys 0-9 (str) and values as its english names `english_hash`
      # {'0' => 'zero', '1' => 'one', '2' => 'two'}...

- iterate over the string digts of input number, transform with map and store in `words` # '1' 
  - retrieve from english_hash the english name of each item in the strings digits # 'one'

new_valid = []
- return input number if none of the words in the collection include the search vowel 

- iterate over words # ['one','four','three']
  - with each word 
    - if search_vowel is included in its characters, NEXT!
    - otherwise, retrieve string number from english_hash 
      - then push to new_valid # ['0', '2', '0']
return "Banned Number" if new_valid is empty 
- join new_valid # '020'
- make it an integer 

=end

def digital_vowel_ban(input_num, search_vowel)
  english_hash = ('0'..'9').zip(%w(zero one two three four five six seven eight nine)).to_h

  str_digits = input_num.to_s.chars

  words = str_digits.map {|digit| english_hash[digit]}

  new_valid = []
  return input_num if words.none? {|w| w.chars.include?(search_vowel)}

  words.each do |word|
    next if word.chars.include?(search_vowel)
    new_valid << english_hash.key(word)
  end
  return "Banned Number" if new_valid.empty?

  new_valid.join.to_i

end

# test cases 
p digital_vowel_ban(143, "o") == 3
p digital_vowel_ban(14266330, "e") == 4266
p digital_vowel_ban(4020, "u") == 20
p digital_vowel_ban(123456789, "i") == 12347

p digital_vowel_ban(1100, "u") == 1100
p digital_vowel_ban(1993, "e") == "Banned Number"
p digital_vowel_ban(20442, "o") == "Banned Number"
p digital_vowel_ban(586, "i") == "Banned Number"

p digital_vowel_ban(90160350102, "e") == 62
p digital_vowel_ban(79284426, "o") == 7986
p digital_vowel_ban(123456789, "a") == 123456789