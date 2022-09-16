=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that returns a list of all substrings of a string that start
at the beginning of the original string. The return value should be arranged
in order from shortest to longest substring.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string object
Output: an array of string of string objects
---------------------------RULES-----------------------------------------
Explicit: 
- string[0] is the beginning of every substring
Implicit: 
- the length of a substring is at least 1
- the longest substring is just the input string
--------------------------EXAMPLES---------------------------------------
- initialize a variable that will hold the new array
- read the string
- iterate over the string
- grabn
- 
=end

# ----------------------------ALGO----------------------------------------
def leading_substrings(str)
  new_arr = []
  iterator = 1
  letter_list = str.chars

  letter_list.each do |letter|
    new_arr << letter_list.take(iterator).join()
    iterator += 1
  end

  new_arr
end
# test cases
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']