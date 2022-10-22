=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence
of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

----------P
INPUT: string
OUTPUT: string
Rules:
  - reads any number from words and converts it to the equivalent number string


----------E
-'Please call me at five five five one two three four. Thanks.' == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Model Solution:
- five five five one two three four ---> when it finds "five" substitute it with 5
----------A
- initiate a reference hash that contains number name as key, and number string as value
- read the input string
  - search with regex for every number name in the reference hash
    - when it finds one, substitue the word (number name) with the number equivalent
  - return the string (modified)

=end

def word_to_digit(sentence)
  reference_hash = {'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9', 'zero' => '0'}

  reference_hash.keys.each do |word|
    sentence.gsub!(/\b#{word}\b/, reference_hash[word])
  end
  sentence
end



# test case
p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

# DONE 