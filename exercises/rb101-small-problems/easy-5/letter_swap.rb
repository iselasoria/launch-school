# Given a string of words separated by spaces, write a method that takes this string
# of words, and returns a stering in whioch the firtst and last keeters of every word are swapped.

# You may assume that everuy wprd contains at least one letter, and the string will
# always contain at least one word,. Ypou may also assume that eachs string 
# contains nothing buy words and spaces


def swap(str)
  array_of_words = str.split
  reordered = array_of_words.each do |word|
                word[0], word[-1] = word[-1], word[0]
              end
  reordered.join(' ')
end

p swap("The Brubus is a cute cat")

# test cases 
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

