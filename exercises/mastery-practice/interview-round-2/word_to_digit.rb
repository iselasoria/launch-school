=begin
* DONE 15m30s 
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

I: string 
O: string where english numbers are now Numeric numbers 

Rules:
  - replaces english numbers with numeric 

Examples:
word_to_digit('Please call me at five five five one two three four. Thanks.') 
'Please call me at 5 5 5 1 2 3 4. Thanks.'


DS: 
String 
hash 

Algorithm:
-set a hash with english names of numbers and their numeric counterparts 

- iterate over the words in the input aray 
  - when I find an english word for a number 
    - replace in the string the current word with the numeric value from thje hash 

return the string 
=end 

def word_to_digit(str)
  english = %w( one two three four five six seven eight nine)
  english_nums = (english).zip('1'..'9').to_h
  p english_nums

  words = str.split 

  words.each do |word|
    word.delete!('^a-zA-Z')
    if english_nums.keys.include?(word)
      p english_nums[word]
      str.gsub!(word, english_nums[word]) # fine
    end 
  end
  str
end


WORDS = %w(one two three four five six seven eight nine)
NUMBS = [1, 2, 3, 4, 5, 6, 7, 8, 9]

HSH = WORDS.zip(NUMBS).to_h 

def word_to_digit(str)
  str.gsub!(/(one|two|three|four|five|six|seven|eight|nine)/) { |match| HSH[match] }
end 



p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'