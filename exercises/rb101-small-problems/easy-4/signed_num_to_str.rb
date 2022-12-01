=begin
In the previous exercise, you developed a method that converts non-negative numbers to strings. 
In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as 
Integer#to_s, String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Input: integer
Output: singed string 

Algorithm:
- initialize a hash where keys are numbers from 0 to 9 and values are their corresponding strings `num_to_str_dictionary`
- get the digits of the input string and reverse them (digits reverses them by default so we want to order them back to the original) `input_digits`
- iterate over input digits (map so we can reuse its array)
  - from `num_to_str_dictionary` retrieve the corresponding value at keyy == current iteration--> this will be the result of map
  - join the above iterartion, by default it will be returned 

- make a call to the integer_to_string method 
- if the input starts with '-' then add 
=end

def integer_to_string(number)
  num_to_str_dictionary = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

  input_digits = number.digits.reverse 

  input_digits.map.each_with_index do |num, idx|
    num_to_str_dictionary[num]
  end.join
end


def signed_integer_to_string(number)

  case number <=> 0 # is number larget than, the same, or smaller than 0---> +1 if larger, 0 if the same and -1 if smaller
  when 0
    integer_to_string(number)
  when 1
    "+#{integer_to_string(number)}"
  when -1
    "-#{integer_to_string(-number)}" # we pass negative to make it possitive or else the above method cant find the digits in the hash
  end

end



# test cases
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# * DONE