# Given a string that consist of some words (all lowercased) and an assortment of non-alphabetic
# characters , write a method that returns a string with all of the non-alphabetic characters replaced
# by spaces. If one or more non-alpha characters occur in a row, you should only have one space in the result, 
# you should never have consecutive spaces in the result.

def cleanup(str)
  str.gsub(/[^a-z]/, ' ').squeeze(' ')
end

# test cases
p cleanup("---what's my +*& line?") #== ' what s my line '