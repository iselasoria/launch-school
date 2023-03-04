=begin 
An alphabetical continuous string is a string consisting of consecutive letters in the alphabet. In other words, it is any substring of the string "abcdefghijklmnopqrstuvwxyz".

    For example, "abc" is an alphabetical continuous string, while "acb" and "za" are not.

Given a string s consisting of lowercase letters only, return the length of the longest alphabetical continuous substring.

Input: s = "abacaba"
Output: 2
Explanation: There are 4 distinct continuous substrings: "a", "b", "c" and "ab".
"ab" is the longest continuous substring.

Input: s = "abcde"
Output: 5
Explanation: "abcde" is the longest continuous substring.

s consists of only English lowercase letters.

I: string of lowercase chars 
O: integer (length of the longest alpha substring)

Rules:
- an alphabetical substrings is esentially a substring of the alphabet 
- single character substrings will be counted 

Examples:
Input: s = "abacaba"
Output: 2
Explanation: There are 4 distinct continuous substrings: "a", "b", "c" and "ab".

DS: 
I: String
Interim: arrays 
O: integer 

Algorithm:
init subs to empty array 

from 0 up to the end of the string (exclusive)--> starting index 
  from starting index to end of the string (exclusive)
    - define slice as original string from starting to ending index 
    - break if characers in slice are already sorted # acb ---> abc 
    - push slice into subs array 

- transform the subs array to their sizes, and get the maximum and return 
=end 

def longest_continuous_substring(str)
  subs = []
  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      slice = str[starting..ending]
       #puts "Slice: #{slice}" if slice.size == 3
      # break if slice.chars != slice.chars.sort ## modify 
      proper_range = (slice[0].ord...(slice[0].ord + slice.size )).to_a
      ordinal_range = slice.chars.map(&:ord)
       #puts "Ordinal: #{ ordinal_range}" if slice.size == 3
       #puts "Proper: #{ proper_range}" if slice.size == 3
      
      subs << slice if proper_range == ordinal_range
     
    end
  end
  subs.map(&:size).max
end


# a continuous substring has a solid randge of ordinals 
# ordianl range starts with first substring letter..last substring letter [12,13,14,15]
# make a proper range # [12,13,14,15]

# https://leetcode.com/problems/length-of-the-longest-alphabetical-continuous-substring/description/

p longest_continuous_substring("abacaba") == 2 
p longest_continuous_substring("abcde") == 5
p longest_continuous_substring("awy")