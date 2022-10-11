=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string argument and returns a new string
that contains the value of the original string with all consecutive duplicate chars
collapsed into a single char. Don't use String#squeeze

--------------------------PROBLEM----------------------------------------
Questions:
Input: 
Output: 
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
=end



def crunch(str)
  idx = 0
  crunch_text = ''
  while idx <= str.length - 1
    crunch_text << str[idx] unless str[idx] == str[idx + 1]
    idx += 1
  end
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee')


# test cases
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

# * DONE