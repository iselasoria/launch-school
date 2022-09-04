# # Write a method that takes a string of digits, and returns the appropriate number as an integer. You ma not use String#to_i or the Intger() constructor.
# For now, dont worry about leading + or - signs, or invalid characters. Assume all characters in the string will be numeric.
STRING_LIST = ("0".."9").to_a
# p STRING_LIST

NUMS = (0..9).to_a
# p NUMS

def string_to_integer(str)
  stringy_numbers = str.chars
  digits_found = NUMS.select do |digit|
                   NUMS.include?(digit)
                 end
  digits_found
end

# test cases
p string_to_integer('4321')# == 4321
p string_to_integer('570') #== 570

# ! this is not working, reworkd this again