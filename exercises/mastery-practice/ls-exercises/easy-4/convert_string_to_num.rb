=begin 
* DONE 8m55s
The String#to_i method converts a string of numeric characters 
(including an optional plus or minus sign) to an Integer. 
String#to_i and the Integer constructor (Integer()) behave similarly. 
In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate 
number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about 
  invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to 
convert a string to a number, such as String#to_i, Integer(), etc.
 Your method should do this the old-fashioned way and calculate the result by 
  analyzing the characters in the string.


Algorithm:
- create a has that has the string and its number equivalent from 0-9
- iterate over the input string 
  - retrieve the number at the string key and store in array 
  - join and return array 
=end 

def string_to_integer(str)
  num_str_hash = ('0'..'9').zip(0..9).to_h

  numeric_arr = []
  str.chars.each do |num|
    numeric_arr << num_str_hash[num]
  end
  numeric_arr.inject {|place_val, trailing|(place_val * 10 ) + trailing}
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570