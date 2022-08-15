=begin
Write a method that takes one argument, a string containing one or more words,
and returns the given string with words that contain five or more characters reversed. 
Each string will consist if only letters and spaces. Spaces should be included only when 
more than one word is present
=end

def reverse_words(str)
  list_of_words = str.split
  p list_of_words
  to_reverse = list_of_words.select do |word|
                  word.chars.size >= 5
                end
  
  for item in list_of_words do
    if to_reverse.include?(item)
      p item.reverse!
    end
  
  end
  list_of_words
end

p reverse_words('Walk around the block')