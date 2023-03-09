# Given a string s, return the length of the longest substring between two equal characters, excluding the two characters. If there is no such substring return -1.
# * DONE 15m27s (during session) 23m48s (Including debugging)
# A substring is a contiguous sequence of characters within a string.

=begin 

I: string 
O: Integer 

Rules:
- creating substrings 
- checking substrings sandwiched between the same characters 
  - getting the size of the substring between them 

Implicit Rules:
  - if there is only one character (even with repetitions)--> return 0 
  - if string contains only unique characters, return -1 


Examples:
max_length_between_equal_characters("acbsewb") == 3 --> valid sub that can be checked for size
max_length_between_equal_characters("acbsewba") == 6  --> valid sub that can be checked for size
max_length_between_equal_characters("aa") == 0 --> Only repeating letters exist 
max_length_between_equal_characters("cbzxy") == -1 ---> only unique characters 

Model Solution:
"acbsewb"
 a 
 ac 
 acb 
 acbs 
 ...
  c 
  cbs 
  ....

* first check the repeating character --> b 
* focus on sub that start with that character
  b 
  bs ******** bsewb ***********
  bse --> get the substrng that starts and ends with repeating character 
  my return value must be size of the substring - 2 

"acbsewba"
repeating char is 'a' and b 
string size - 2 


DS:
Arrays 
String 
Integers 

Algorithm:

Main Methods: 
  - handle edge case where only uniques are given 

  - identify my `focus char `--> repeats (twice)
      - get tally of chars and select the one that goes twice 

  - init `potential` as empty array--> might have multiple substring sandwiches and we want to grab longest
    - generate substrings 
    - only create the subs that start with and end with `focus character` and store in `potential`

  - init focus string to potential's first element because as subs are genereated in order, the first will have the longest distance betweeen first and last items 
  - the result will be substring size - 2 
=end 

def max_length_between_equal_characters(str)
  return -1 if str.chars.uniq.size == str.size 
  focus_char = str.chars.tally.select {|_, v| v == 2}.keys[0] 

  potential = []

  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
        potential << slice if slice.chars.first == slice.chars.last && slice.size > 1
    end
  end
  focus_str = potential[0]
  focus_str.size - 2
end

p max_length_between_equal_characters("acbsewb") == 3
p max_length_between_equal_characters("acbsewba") == 6
p max_length_between_equal_characters("aa") == 0
p max_length_between_equal_characters("cbzxy") == -1