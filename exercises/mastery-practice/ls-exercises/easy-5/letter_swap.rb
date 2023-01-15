=begin
* DONE 4m13s
Given a string of words separated by spaces, write a method that takes this string of
words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will 
always contain at least one word. You may also assume that each string contains nothing but words and spaces.


Rules:
- first and last characters in every word are swapped
- string is separated by spaces--> breaks up into words
  - we need to work at the word level

Algorithm:
- split the string into words
  - for each word
    - set the first to the last, and the last to the first chars
    
=end 

def swap(str)
  words = str.split 

  words.each do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  words.join(' ')
end

# test cases 
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'