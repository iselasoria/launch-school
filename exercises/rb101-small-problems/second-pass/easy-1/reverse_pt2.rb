=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes one argument, a string containing one or more words, 
and returns the given string with words that contain give or more characrters 
reversed, each string will consist of only letters and spaces. 
Spaces should be inluded when more than one word is present.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
Output: 
---------------------------RULES-----------------------------------------
Explicit: 
- words that have 5 or more characters shold have the order of their characters reversed
- spaces count toward the 5 character mark
- words containig less than 5 characters are to be left as is
Implicit: 
--------------------------EXAMPLES---------------------------------------
'Professional' ==> lanoisseforP
Walk around the block ==> Walk dnuora the kcolb
----------------------------ALGO----------------------------------------
- turn the string into an array of words
- iterate through the words array
  - if the word in the current iteration is longer than 5 characters reverse it
  - join the words
- return the resulting string
=end

def reverse_words(str)
  list = str.split

  newlist = list.map do |word|
          if word.chars.size >= 5
            word.chars.reverse.join
          else
            word
          end
        end
        newlist.join(' ')
end

# test cases
p reverse_words('Professional')          # => lanoisseforP
p reverse_words('Walk around the block') # => Walk dnuora the kcolb
p reverse_words('Launch School')         # => hcnuaL loohcS