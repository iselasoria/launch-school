=begin
Write a method that returns true if the string passed as an argument is a 
palindrome, false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces.


------------P
Input: string
output: boolean
Rules: 
- explicit:
  - case, punctuation, and spaces matter

Goal: return true if word is a panlindrome, false if it is not

------------E
palindrome?('madam') == true
palindrome?('Madam') == false

Model Solution:
str = 'madam'
a = str[0, 3] ---> "m a d"
b = str[2, 3] ---> "d a m"

a.chars == b.chars.reverse
------------A
- generate an array of characters from the input string to get letters
- iterate over array
  - if letters array includes special characters || if it includes 
    false
  - otherwise:
    - iteratve over the letters array
      - if first half == second half reversed
        - first_half is idx 0 to size/2
        - second_half is size/2 to size
        - true
      - otherwise
        - false

=end


def palindrome?(str)
  str = str.reverse ? true : false
end

# test cases
p palindrome?('madam') #== true
p palindrome?('Madam') #== false          # (case matters)
p palindrome?("madam i'm adam") #== false # (all characters matter)
p palindrome?('356653') == true

# DONE