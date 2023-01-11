=begin
* DONE 15m
Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

A subsequence of a string is a new string that is formed from the original string by 
deleting some (can be none) of the characters without disturbing the relative positions 
of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

Input: two strings 
Output: boolean 

Rules:
  - returns true if the first string is a subsequence of the second.
    - subsequence:
      - letters in string 1 get deleted to arrive at string 2, but maybe we don't need to delete anything
    - the order of characters is preserved 
Goal: determine if we can delete strings (or not) from string 1 to get string 2

Examples / Model Solution:
Input: s = "abc", t = "ahbgdc"
Output: true


Input: s = "axc", t = "ahbgdc"
Output: false

Data: 
in: tow strings 
interim: arrays 
out: boolean

Algorithm:
- delete all but the characters in string 1, from string 2
=end

def is_subsequence(str1, str2)
  str1.chars.all? do |letter|
    str2.chars.include?(letter)
  end
end

p is_subsequence("abc","ahbgdc")