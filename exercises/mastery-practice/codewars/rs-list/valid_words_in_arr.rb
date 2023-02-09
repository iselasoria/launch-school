# * DONE 11 m
# 2:19 
# You are given a string (allowed) consisting of distinct characters and an array of strings (words). A string is consistent if all characters in the string (appear) in the string (allowed).
 
# Return the number of consistent strings in the array words.

# Example 1:

# Input: allowed = "ab", words = ["ad","bd","aaab","baa","badab"]
# Output: 2
# Explanation: Strings "aaab" and "baa" are consistent since they only contain characters 'a' and 'b'.
# Example 2:
# Input: allowed = "abc", words = ["a","b","c","ab","ac","bc","abc"]
# Output: 7
# Explanation: All strings are consistent.
# Example 3:
# Input: allowed = "cad", words = ["cc","acd","b","ba","bac","bad","ac","d"]
# Output: 4
# Explanation: Strings "cc", "acd", "ac", and "d" are consistent.
=begin

I: string, and an array of strings 
O: integer 

Rules:
- all characters in the allowed word must appear in an element in order for it to be a valid 
  - as long as all the characters in the string are part of the allowed chars ex) 1, 2 or all 

Examples: 
"cad" and  ["cc","acd","b","ba","bac","bad","ac","d"]
              a    a    n    n    n      n    a   a 
4 allowed items in the array 

Data Structures:
I: string and array 
Interim: array 
O: integer 

Algorithm:
- iterate over the input array 
  - with each iteration
  - check that the current element's characters all include the characters in the allowed word 
=end 

def f(str, arr)
  arr.count do |item|
    item.chars.all? do |letter|
      str.chars.include?(letter)
    end
  end
end
# OR
def f(str, arr)
  arr.count { |item| item.chars.all? {|letter| str.chars.include?(letter)}}
end

p f("abc", ["a","b","c","ab","ac","bc","abc"]) == 7
p f("cad", ["cc","acd","b","ba","bac","bad","ac","d"]) ==  4
p f("ab", ["ad","bd","aaab","baa","badab"]) == 2