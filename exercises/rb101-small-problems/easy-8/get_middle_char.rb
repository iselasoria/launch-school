=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the character has an odd length,
you should return exactly one character. If the argument has an even length,
you should return exactly two characters.
--------------------------PROBLEM----------------------------------------
Questions: are we assuming it is always to be empty?
Input: non empty string
Output: a string
---------------------------RULES-----------------------------------------
Explicit: 
- returns a string containing either 1 or two characters depending on whether 
  the input string length was odd or even respectively
Implicit: 
--------------------------EXAMPLES---------------------------------------
my_string = 'I love ruby'
my_string[0, my_string/2].size

----------------------------ALGO----------------------------------------
- read the input string
- initialize a variable that will hold the length of the string
- initialize a variable that will hold the first half of the input string
- initialize a variable that will hold the second half of the input string
 
- if length of original input string is odd
    - return the middle 1 char
- else if length of original string is even
    - return first_half.last + second_half.first
=end

def center_of(stringy)
  str_length = stringy.size
  str_col = stringy.chars
  first_half = str_col[0, str_col.size/2]
  second_half = str_col[str_col.size/2, str_col.index(str_col.last)]

  if str_length == 1
    str_col.join
  elsif str_length.odd?
    second_half.first
  elsif str_length.even?
    first_half.last + second_half.first
  end
end

# center_of('Burbus')
# # test cases
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

# DONE