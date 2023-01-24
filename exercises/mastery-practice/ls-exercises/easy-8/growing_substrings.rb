=begin 
* DONE 2m
Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.


I: string 
O: array 

Rules:
- return substrings that grow in length 
=end 

def leading_substrings(str)
  subs = []
  (0...str.size).each do |ending|
    subs << str[0..ending]
  end
  subs
end

# test cases 
p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']