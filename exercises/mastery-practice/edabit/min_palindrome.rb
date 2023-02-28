=begin 

https://edabit.com/challenge/J5zJc95koWg9cwSBs

Given an incomplete palindrome as a string, return the minimum letters needed to be added on to the end to make the string a palindrome.

Examples
min_palindrome_steps("race") ➞ 3
# Add 3 letters: "car" to make "racecar"

min_palindrome_steps("mada") ➞ 1
# Add 1 letter: "m" to make "madam"

min_palindrome_steps("mirror") ➞ 3
# Add 3 letters: "rim" to make "mirrorrim"

NOTE: words that are already palindromes return 0.

I: string 
O: integer 

Rules:
- palindromes return 0 --> check with a helper method 

- palindrome:
  - a word that is the same forward and backward
    -racecar 
     >>>>>>>
     <<<<<<<
     - word is equal to word reversed 
- Implicit:
  - the given input string contains at least up to half of the palindrome
  - missing letters from a palindrome:
    - first half of the word, reversed
      "mirror"
       * find the middle of the would be palindrome 
       * get the first half
       * reverse the first half 
       "tacocat"
       "tac"
           o
            "cat"
      * middle is dictated by when I find the 

Examples:
"tacocat"
       "tac"
           o
            "cat"
"mirror"
 mirr 
     o 
      rrim
     

=end 
def is_palidrome?(str)
  str.chars == str.chars.reverse
end


def min_palindrome_steps(str)
  return 0 if is_palidrome?(str)
  new_word = str.dup

  str.chars.each_with_index do |ch, idx|
   new_word.insert(-(idx + 1), ch)
   if is_palidrome?(new_word)
    return new_word.size - str.size
   end
  end

  
end
# race 
# race r # idx=0
# race ar # insert at index -(0 + 1)
# test cases 
p min_palindrome_steps("race") ==  3
p min_palindrome_steps("mada") ==  1
p min_palindrome_steps("mirror") ==  3
p min_palindrome_steps("maa") ==  1
p min_palindrome_steps("m") ==  0
p min_palindrome_steps("rad") ==  2
p min_palindrome_steps("madam") ==  0
p min_palindrome_steps("radar") ==  0
p min_palindrome_steps("www") ==  0
p min_palindrome_steps("me") ==  1
p min_palindrome_steps("rorr") ==  2
p min_palindrome_steps("pole") ==  3