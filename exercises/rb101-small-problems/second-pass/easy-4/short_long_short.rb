=begin 
Write a method that takes two strings as arguments, determines the longest of the two strings,
and then returns the result of concatenating the shorter string, the longer string,
and the shorter string once again. You may assume that the strings are of different lengths.

----------------P
----------------E
----------------D
----------------A
- get the input strings into an array
- initialize a variable of an empty string
- read the length of each string
  - push the shortest str 
  - push the longest str
  - push shortest str
- return result string

=end

def short_long_short(str1, str2)
  arr = [str1, str2]
  result = []
  short = ''
  long = ''

  if str1.size < str2.size
    short = str1
    long = str2
  else
    short = str2 
    long = str1
  end
  
  result << short << long << short
  result.join
end

# test cases 
p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
# DONE 