=begin 
* DONE 4m
Write a method that takes two strings as arguments, determines the longest of the two strings, 
and then returns the result of concatenating the shorter string, the longer string, 
and the shorter string once again. You may assume that the strings are of different lengths.

Rules:
- find long word 
- return a concatenated version of short long short 
=end

def short_long_short(str1, str2)
  s1 = str1.size 
  s2 = str2.size 
  
  if s1 > s2 
    return str2 + str1 + str2 
  elsif s2 + s1 
    return str1 + str2 + str1 
  end
end

# test cases 
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"