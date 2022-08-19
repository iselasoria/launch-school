# write a method that returns true if the string passed as an argument is a palindrome, false if it is not.
# A palindrome reads the same forwards and backwars. In this question, case, punctuation, and spaces matter.

def palindrome?(word)
  word == word.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true