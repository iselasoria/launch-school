=begin 
* DONE 06m08s
Given a string, reverse all the words which have odd length. The even length words are not changed.

Examples
reverse_odd("Bananas") ➞ "sananaB"

reverse_odd("One two three four") ➞ "enO owt eerht four"

reverse_odd("Make sure uoy only esrever sdrow of ddo length")
➞ "Make sure you only reverse words of odd length"
Notes
There is exactly one space between each word and no punctuation is used.


I: string 
O: string 

Rules:
- no punctuation 
- words separated by space 
- reverse the characters in the word if the word length is odd 
  - otherwise leave unchanged 
- capitalization stays as is--> straight reverse only
Examples:
"One two three four"
 3    3    5    4
enO owt   eerth four 

DS:
I: string 
Interm: arrays 
O: string 

Algorithm:
- split the string at spaces 
  - itearte over the words in the newly created aray with a transformation
    - for each word, 
      - if the word is odd length, reverse its chars, 
      - if not odd len, return word to the transformation
- join the transformation by space 
=end 

def reverse_odd(str)
  str.split.map do |word|
    if word.size.odd?
      word.reverse 
    else
      word 
    end
  end.join(' ')
end
# test cases 
p reverse_odd("One two three four") =='enO owt eerht four'
p reverse_odd('Make sure uoy only esrever sdrow of ddo length') =='Make sure you only reverse words of odd length'
p reverse_odd('') ==''
p reverse_odd('Bananas') =='sananaB'
p reverse_odd('Even even even even even even even even even') =='Even even even even even even even even even'
p reverse_odd('Odd odd odd odd odd odd odd odd odd odd odd') =='ddO ddo ddo ddo ddo ddo ddo ddo ddo ddo ddo'