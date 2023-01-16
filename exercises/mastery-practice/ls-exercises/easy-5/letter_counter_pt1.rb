=begin 
Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.

Rules:
- string with words separated by a space
- resulting hash contains:
  - keys ---> the size of the word
  - values --> the count of words of that size
  
Algorithm:
- iterate over the split string---> words
- with each iteration:
  - get the size of the word

=end 

def word_sizes(str)
  counts = Hash.new(0)

  str.split.each do |word|
    counts[word.size] += 1
  end

  counts
end






# test cases 
p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}