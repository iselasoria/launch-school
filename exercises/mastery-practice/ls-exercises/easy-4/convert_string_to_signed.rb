=begin 
* DONE 12m1s
In the previous exercise, you developed a method that converts simple numeric strings 
to Integers. In this exercise, you're going to extend that method to work with signed 
numbers.

Write a method that takes a String of digits, and returns the appropriate number 
as an integer. The String may have a leading + or - sign; if the first character 
is a +, your method should return a positive number; if it is a -, your method 
should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, 
such as String#to_i, Integer(), etc. You may, however, use the string_to_integer 
method from the previous lesson.

=end 

def exec_find(str)
  num_str_hash = ('0'..'9').zip(0..9).to_h

  numeric_arr = []

  str.chars.each do |num|
    numeric_arr << num_str_hash[num]
  end
  abs_num = numeric_arr.inject {|place_val, trailing|(place_val * 10 ) + trailing}

end

def string_to_signed_integer(str)
  if str[0] == '-'
    str = str.delete('^0-9')
    exec_find(str) * -1
  elsif str[0] == '+'
    str = str.delete('^0-9')
    exec_find(str)
  else
    exec_find(str)
  end

end




# test cases 
p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100