=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string, and returns a new string in which every
consonant character is doubled. Vowels, digits, punctuation, and white
spaces should not be doubled.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
- string
Output: 
- new string
---------------------------RULES-----------------------------------------
Explicit: 
- double consonants
- ignore vowels
- ignore digits
- ignore punctuation
- ignore white space
Implicit:
- consider the lowercase and uppercase
--------------------------EXAMPLES---------------------------------------
=end
# alphabet = ('A'..'Z').to_a + ('a'..'z').to_a
# vowels = %w(a e i o u A E I O U)
# consonant = alphabet.select do |letter|
#               vowels.include?(letter) -----> this should have ! at the end
# end

# ----------------------------ALGO----------------------------------------
# - read the input string
# - set a variable to hold the alphabet including lower/uppercase
# - set a variable to an array of vowels
# - set a variable to consonants--> alphabet - vowels
# - set a variable to an array of the characters in the string downcased
# - set a variable to hold the result of an iterative method call
#   - with each iteration, if the letter is in the consonants array, double it.
#   - if not, ignore it
# return the new string with corresponding doubled characters


def double_consonants(str)
  alphabet = ('A'..'Z').to_a + ('a'..'z').to_a
  vowels = %w(a e i o u A E I O U)
  consonants = alphabet.select do |letter|
                !vowels.include?(letter)
              end
  str = str.chars

  dubby = str.map do |letter|
              if consonants.include?(letter)
                letter * 2
              else
                letter
              end
            end
  dubby.join
end

# double_consonants('String') #== "SSttrrinngg"

# test cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# DONE