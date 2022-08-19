# # write another method that returns true if the string passed as an argument is a palindrome,
# false if not. This time, your method should be case-insensitve, and it should ignore all alpahnumeric characters.
# If you want, you can simplify things by calling the palindrome? method from the previous exercise.

def palindrome?(word)
  word == word.reverse
end

def real_palindrome?(word)
  string = word.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false