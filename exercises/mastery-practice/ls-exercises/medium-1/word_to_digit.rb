=begin
Write a method that takes a sentence string as input, and returns the same string with any sequence 
of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted 
to a string of digits.


I: string 
O: string 

Goal: to replace the letter numbers with their numerical equivalent 

Example:
five five five one two three four
5     5     5   1   2   3     4

Data Structures:
Hash to track the letter number and its numerical equivalent 


Algorithm:
- generate a hash of numers and its text equivalent 
- initialize a new_str to ''
- iterate over the string
  - push the current word into the new string 
    -if the word is found in the hash,
      - retrieve the number equivalent and add it to the new_str 
  - join the new string with a space
  
=end


def word_to_digit(str)
  txt_to_num = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 
                'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9
              }

              
end

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'