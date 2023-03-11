=begin 
* DONE 09m00s
Write a function that returns the longest non-repeating substring for a string input.
Examples

longest_nonrepeating_substring("abcabcbb") ➞ "abc"

longest_nonrepeating_substring("aaaaaa") ➞ "a"

longest_nonrepeating_substring("abcde") ➞ "abcde"

longest_nonrepeating_substring("abcda") ➞ "abcd"

Notes

    If multiple substrings tie in length, return the one which occurs first.
    Bonus: Can you solve this problem in linear time?

=begin 
I: string 
O: string 

_rules:
non repeating subs 
- largest 

DS:
strings 
array s

Algorithm:
- gen subs 
- only keep the ones with unique letters 
- gram max by size  
=end
 
def longest_nonrepeating_substring(str)
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      subs << slice if slice.chars.uniq.size == slice.chars.size 
    end 
  end

  subs.max_by {|item| item.size}
end

p longest_nonrepeating_substring("abcabcbb") == "abc"
p longest_nonrepeating_substring("aaaaaa") == "a"
p longest_nonrepeating_substring("abcde") == "abcde"
p longest_nonrepeating_substring("abcda") == "abcd"
p longest_nonrepeating_substring("aaccddeeffb") == "ac"
p longest_nonrepeating_substring("abdde") == "abd"
p longest_nonrepeating_substring("ccdddcccc") == "cd"
p longest_nonrepeating_substring("cdxdxccxc") == "cdx"
p longest_nonrepeating_substring("abddefgh") == "defgh"
p longest_nonrepeating_substring("abcdabcd") == "abcd"
p longest_nonrepeating_substring("abddebcc") == "debc"
p longest_nonrepeating_substring("xyxxyzyzy") == "xyz"
p longest_nonrepeating_substring("kjlmjsdeee") == "lmjsde"
p longest_nonrepeating_substring("kjlmjsdfew") == "lmjsdfew"
p longest_nonrepeating_substring("kjlmjsdfewii") == "lmjsdfewi"