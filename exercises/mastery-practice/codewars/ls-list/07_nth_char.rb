=begin 
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:


["yoda", "best", "has"]  -->  "yes"
  ^        ^        ^
  n=0     n=1     n=2

  Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

I: array 
O: string 

Rules:
- use the index of the array as selector
  - take the character at index position to form a new word 

Examples:

["yoda", "best", "has"] 
  0         1     2
 y         e        s ----> "yes"

DS:
I: array 
Interim: Array 
O: String 

Algorithm:
- iterate over the array and its index 
  - from each element, take character at index and push to new word 

- return new word 
=end 

def nth_char(arr)
  new_word = ''
  arr.each_with_index do |item, idx|
    new_word << item[idx]
  end
  new_word
end

# test cases 

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No','No']) == 'No'
p nth_char(['Chad','Morocco','India','Algeria','Botswana','Bahamas','Ecuador','Micronesia']) == 'Codewars'
