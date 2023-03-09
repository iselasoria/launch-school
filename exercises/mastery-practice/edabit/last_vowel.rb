=begin 
Create a function that takes in a sentence as input and returns the most common last vowel in the sentence as a single character string.

Examples
common_last_vowel("Hello World!") ➞ "o"

common_last_vowel("Watch the characters dance!") ➞ "e"

common_last_vowel("OOI UUI EEI AAI") ➞ "i"

Notes

    There will only be one common last vowel in each sentence.
    If the word has one vowel, treat the vowel as the last one even if it is at the start of the word.
    The question asks you to compile all of the last vowels of each word and returns the vowel in the list which appears most often.
    y won't count as a vowel.
    Return outputs in lowercase.

I: string 
O: string 

Rules:
- return only lowercase letters 
- common vowels:
  - vowel that repeats 
  - always choose the last one 
  - count all vowel, return the one that appears most often 

Examples:
"Watch the characters dance!"
  a      e   a a  e    a  e
a -> 4  
e -> 3

"munch munch munch tasty tasty brunch"
  u     u     u     a     a      u 

"OOI UUI EEI AAI"
 
O ->

Algorithm:
- iterate over the characters inreverse 
  - return if its a vowel 



=end

def common_last_vowel(str)
  str.chars.reverse_each do |ch|
    return ch.downcase if %w(a e i o u).include?(ch.downcase)
    end  
end 



p common_last_vowel("Hello World!") == "o"
p common_last_vowel("Watch the characters dance!") == "e"
p common_last_vowel("OOI UUI EEI AAI") == "i"
p common_last_vowel("amy and acts") == "a"
p common_last_vowel("munch munch munch tasty tasty brunch") == "u"