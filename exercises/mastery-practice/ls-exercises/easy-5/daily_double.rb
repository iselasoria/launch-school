=begin
* DONE 12m25s
 TODO Interview Practice
Write a method that takes a string argument and returns a new string 
that contains the value of the original string with all consecutive
duplicate characters collapsed into a single character. 
You may not use String#squeeze or String#squeeze!.

Algorithm:
- initialize a new string results
- iterate though the characters
  - push into results each character unless the last one in the new collection is the same as the current, just skip

=end 


def crunch(str)
  result = ''

  str.chars.each do |ch|
    result << ch unless result.chars.last == ch
  end
  result
end

# test cases 
p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''