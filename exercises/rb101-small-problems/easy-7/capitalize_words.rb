=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a single String argument and returns a new string
that contains the original value of the argument with the first character
of every word capitalized and all others lowercase.
You can assume that words are any sequence of non-blank characters.
--------------------------PROBLEM----------------------------------------
Questions:
Input: one string object
Output: original string object
---------------------------RULES-----------------------------------------
Explicit: new letter in every character is to be capitalized
Implicit: original object, mutated
--------------------------EXAMPLES---------------------------------------
- read the string object
- turn it into an array to be able to access it by chunks/words
- word[0] becomes capital
- join word[0] with the rest of the word
=end
word = "Isela"
# p word.capitalize

# ----------------------------ALGO----------------------------------------
def word_cap(str)
  caps = str.split(' ').map do |word|
          word.capitalize
        end
  caps.join(' ')
end

# test cases
p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'