=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a methof that returns the next to last word in the String passed to it
as an argument. Words are any sequence of non-blank characters.
You can assume that the input string will always contain at least two words.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: string object containing the second to last word of the original string
---------------------------RULES-----------------------------------------
Explicit: a word is defined as a sequence of non-blank characters
Implicit: new string?
--------------------------EXAMPLES---------------------------------------
=end
# ----------------------------ALGO----------------------------------------

def penultimate(str)
  input_words = str.split()
  input_words[-2]
end





# test cases
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'