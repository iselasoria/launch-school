# write a method that returns true if its ingeger arugment is palindromic, false otherwise.

def palindrome?(word)
  word == word.reverse
end

def palindromic_number?(num)
  palindrome?(num.to_s)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true