=begin 
An input string can be completed if additional letters can be added and no letters need to be taken away to match the word. Furthermore, the order of the letters in the input string must be the same as the order of letters in the final word.

Create a function that, given an input string, determines if the word can be completed.

Examples
can_complete("butl", "beautiful") ➞ true
# We can add "ea" between "b" and "u", and "ifu" between "t" and "l".

can_complete("butlz", "beautiful") ➞ false
# "z" does not exist in the word beautiful.

can_complete("tulb", "beautiful") ➞ false
# Although "t", "u", "l" and "b" all exist in "beautiful", they are incorrectly ordered.

can_complete("bbutl", "beautiful") ➞ false
# Too many "b"s, beautiful has only 1.
Notes
Both string input and word will be lowercased.

I: strings 
O: boolean 

Rules:
- check if letters can be inserted into the first word to make up the second 
- all letters will be lowercase 
- count of the letters matters --> you need as many characters of the same kind in both
- order matters --> must retain order of characters

Examples:
p can_complete('butl', 'beautiful') == true 
p can_complete('butlz', 'beautiful') == false # z does not exist in second arg 
p can_complete('tulb', 'beautiful') == false # order is wrong 
p can_complete('bbutl', 'beautiful') == false # too many b's 
p can_complete('sg', 'something') == true 
p can_complete('sgi', 'something') == false# order is wrong
p can_complete('sing', 'something') == true
p can_complete('siing', 'something') == false # too many i's 

DS:
I: two strings
Interim: arrays (of characters) 
O: boolean 

Notes:
- I don't care what letters get inserted, as long as I can insert into the word to make the second word 
- read the second word character by character
  b e a u t i f u l
  - when I find a character that is not in the first word, insert it at that index 
  - return true if first argument is equal to the second after chars were inserted 

Algorithm:
- edge cases: might be handled by the iteration
  - return false if NOT all the letters in first argument are present in the second 
  - return false if the count of characters in both words is NOT the same

- make a copy of the first string and store in `copy_str` and pad it to fit second arg size
- iterate over the second word's characters (index)
  - skip the characters that are found in both 
  - when I find a characters that is new to the first word, insert at that index 
- return true if both strings are the same 
=end 

def can_complete(w1, w2)
  copy_str = w1.dup
  
  while copy_str.size < w2.size 
    copy_str << '*'
  end

  checker_str = ''

  w2.chars.each do |ch|
    checker_str << ch if w1.chars.include?(ch)
  end

  p w1.chars 
  p checker_str.chars
  w1.chars == checker_str.chars.uniq
  # copy_str.chars.each_with_index do |ch, idx|
  #   # next if w1.chars.include?(ch)
  #     copy_str[idx] = w2.chars[idx]
  # end

  # new_arr = copy_str.chars
  
  # new_arr.pop until new_arr.size == w2.size
  # new_arr.join == w2
end

p can_complete('butl', 'beautiful') == true 
p can_complete('butlz', 'beautiful') == false # z does not exist in second arg 
p can_complete('tulb', 'beautiful') == false # order is wrong 
p can_complete('bbutl', 'beautiful') == false # too many b's 
p can_complete('sg', 'something') == true 
p can_complete('sgi', 'something') == false# order is wrong
p can_complete('sing', 'something') == true
p can_complete('siing', 'something') == false # too many i's 