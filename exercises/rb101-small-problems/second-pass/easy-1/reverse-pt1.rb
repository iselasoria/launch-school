=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes one argument, a string, and returns  a new string with the words in reverse order

--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: string
---------------------------RULES-----------------------------------------
Explicit: 
- new string
- order of the new string is reversed from the original
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
=end

def reverse_sentence(string)
  list = string.split
  list.reverse.join(' ')
end

# test cases
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# DONE