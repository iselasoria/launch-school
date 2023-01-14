=begin 
* DONE 3m
In the previous exercise, you developed a method that converts non-negative 
numbers to strings. In this exercise, you're going to extend that method by 
adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, 
such as Integer#to_s, String(), Kernel#format, etc. You may, however, 
use integer_to_string from the previous exercise.

=end 

def exec_conversion(number)
  num_to_str_hash = (0..9).zip('0'..'9').to_h

  stringy_num = ''

  if number < 0 
    number = number * -1
  end
  number.digits.reverse.each do |num|
    stringy_num << num_to_str_hash[num]
  end
  stringy_num
end

# p exec_conversion(-123)
# p exec_conversion(4321)
# p exec_conversion(0)


def signed_integer_to_string(num)
  if num > 0 
    '+' + exec_conversion(num)
  elsif num == 0
    exec_conversion(num)
  elsif num < 0
   '-' + exec_conversion(num)
  end
end

# test cases 
p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'