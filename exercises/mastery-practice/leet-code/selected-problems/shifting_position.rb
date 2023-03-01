# You are given a 0-indexed string s that has lowercase English letters in its even indices and digits in its odd indices.

# There is a function shift(c, x), where c is a character and x is a digit, that returns the xth character after c.

# For example, shift('a', 5) = 'f' and shift('x', 0) = 'x'.
# For every odd index i, you want to replace the digit s[i] with shift(s[i-1], s[i]).

# Return s after replacing all digits. It is guaranteed that shift(s[i-1], s[i]) will never exceed 'z'.

# Example 1:

# Input: s = "a1c1e1"
# Output: "abcdef"
# Explanation: The digits are replaced as follows:
# - s[1] -> shift('a',1) = 'b'
# - s[3] -> shift('c',1) = 'd'
# - s[5] -> shift('e',1) = 'f'
# Example 2:

# Input: s = "a1b2c3d4e"
# Output: "abbdcfdhe"
# Explanation: The digits are replaced as follows:
# - s[1] -> shift('a',1) = 'b'
# - s[3] -> shift('b',2) = 'd'
# - s[5] -> shift('c',3) = 'f'
# - s[7] -> shift('d',4) = 'h'

=begin
I: string 
O: string 

Rules:
- shift(char, pos)
  - retrieve the letter at index + position
   # shift('a',10) --> k 

- main_method(str)
  - lowercase english letters at the even indexes 
  - numbers in the odd indexes 
  - replace ONLY the number 


Data Structures:
- store alphabet positions in a hash 
- array of characters 

Algorithm:
Helper Method: shift(pos)----> ch 
- zip 1..26 with alphabet and make a hash 
- iteraete over the hash 
  - search for key at input value + position


Main Method: f(str) 
- init new_str -> ''
- iterate over the characters of input string 
  - if index is even,
    - push char into new_str 
  - otherwise 
    - call shift(pos as numebr) # hash.key?(pos)--> return char 
    - push char into new_str 
  - return new string 
=end 

def shift(ch, shift_spots) # 
  alpha_hash = ('a'..'z').zip(1..26).to_h
  initial_position = alpha_hash[ch] # position 
  new_position = (initial_position + shift_spots.to_i)
  alpha_hash.key(new_position)
end

# p shift('e', "1")

def f(str)
  new_str = ''

  str.chars.each_with_index do |item, idx|
    if idx.even?
      new_str << item
    else
      new_str << shift(str[idx -1], item)
    end
  end
  new_str
end
# 
p f("a1c1e1") == "abcdef"
p f("a1b2c3d4e") == "abbdcfdhe"
