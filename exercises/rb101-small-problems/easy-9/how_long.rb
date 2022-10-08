=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string as argument and returns an array that contains
every word from the string, toi which you have appebded a sopace and the word length.
You can assume that words in the string are separated by exactly one space,
and that any substrings of nonspace characrters is a word.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: array of strings
---------------------------RULES-----------------------------------------
Explicit: 
- each word gets its legth appended
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
- turn the string into an array of words
- iterate through the array
  - with each iteration, append the legnth of each word 
- return the new array
=end

def word_lengths(string)
  list_of_words = string.split

  list_of_words.map do |word|
    word +' ' + word.chars.size.to_s
  end
end

p word_lengths("cow sheep chicken") 

# test cases
p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []

# * DONE