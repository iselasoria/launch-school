=begin 
For a given string s find the character c (or C) with longest consecutive repetition and return:

[c, l]
where l (or L) is the length of the repetition. If there are two or more characters with the same l return the first in order of appearance.

For empty string return:

["", 0]


Input: string 
Output: array 

Rules:
- count characters in the string 
OR 
- substrings where all chars are the same 
- return an array where first element is the character that repeats the most and the second element is the lenght of the repetition 

Examples / Model Solution:
'aaaabb' --> ['a', 4]
a 
aa 
aaa 
aaaa
** break where the characters are not the same 
b 
bb 
** string ends 

Find the substring that is longest and return in array format of [character, length]


Data Structures:
-int: string 
-interim: array 
-out: array 

Algorithm:
Helper Method: gen_subs(str)
- make substrings and break up itereation when the length of the current substring uniqued is greater than 1 


Main Method: longest_repetition(str)
- make a call to gen_subs(str) and store in `subs`
- initalize a variable as an empty array to store `results`
- iterate over subs ['a','aa','aaa','aaaa','b','bb'] to grab the longest and store in `longest`
  - push into the results array the result of the min_by followed by the size of the element that was found 
  ## ['aaaa', 4]
=end 

def gen_subs(str)
  subs = []
  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      current_chunk = str[starting..ending]
      break if current_chunk.chars.uniq.size > 1
      subs << current_chunk
    end
  end
  subs 
end

def longest_repetition(str)
  return ['', 0] if str.empty? 

  subs = gen_subs(str)
  results = []

  longest = subs.max_by {|sub| sub.size}
  results << longest.chars.uniq.join << longest.size
end


p longest_repetition("aaaabb") ==  ['a', 4]
p longest_repetition("bbbaaabaaaa") == ['a', 4]
p longest_repetition("cbdeuuu900") ==  ['u', 3]
p longest_repetition("abbbbb") == ['b', 5]
p longest_repetition("aabb") == ['a', 2]
p longest_repetition("ba") == ['b', 1]

p longest_repetition("") == ['', 0]

p longest_repetition("aaabbcccddd") == ['a', 3]
