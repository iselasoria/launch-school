=begin 
* DONE 5m19s
Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

=begin 

I: string 
O: string 

Rules:
- substrings 
- only if they are alphabetical

Examples:
asd --> as 

nab --> ab 

DS: 
arrays 

Algorithm:
- init subs 
- iterate though the range of 0 to string end 
  - itearte through moving index to string end 
    - slice at start up to end moving idx 
    - break if slice sorted is not the same as slice as is 
    - push to subs 
- return the longest of the substrings 
=end 

def longest(str)
  subs = []

  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      break if slice.chars.sort != slice.chars
      subs << slice
    end
  end
  subs.max_by {|item| item.size}
end

# test cases 
p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') == 'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'