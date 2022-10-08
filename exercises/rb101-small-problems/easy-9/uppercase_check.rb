=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string argument, and returns true if all the
alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: boolean
---------------------------RULES-----------------------------------------
Explicit: 
- if all aphabetic chars are uppercase, returns true
- if there are any alphabetic characters that are not uppercase, the method returns false
Implicit: 
- non-alphabet characters get ignored
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
- read the string
- set a variable to store a collection of characters in the string
- iterate through the collection of characters
  - if all are uppercase, return true
  - else return false
=end


def uppercase?(str)
  list = str.chars

  list.all? do |char|
    char == char.upcase
  end
end

# test cases
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# * DONE