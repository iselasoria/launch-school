=begin
* DONE 2m44s
In the previous two exercises, you developed methods that convert simple 
numeric strings to signed Integers. In this exercise and the next, 
you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to 
a string representation.

You may not use any of the standard conversion methods available in Ruby, 
such as Integer#to_s, String(), Kernel#format, etc. Your method should 
do this the old-fashioned way and construct the string by analyzing and 
manipulating the number.

Algorithm:
- zip a list of numbers 0-9 and its string equivalent keys are nums and values are strings

- initialize a stringy_num = ''
- iterate over the input number's digits 
- retrieve the string equivalents from the hash
- return stringy_num
=end 


def integer_to_string(number)
  num_to_str_hash = (0..9).zip('0'..'9').to_h

  stringy_num = ''

  number.digits.reverse.each do |num|
    stringy_num << num_to_str_hash[num]
  end
  stringy_num
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'