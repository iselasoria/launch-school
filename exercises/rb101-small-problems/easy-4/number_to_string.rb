=begin
In the previous two exercises, you developed methods that convert simple numeric strings to 
signed Integers. In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, 
such as Integer#to_s, String(), Kernel#format, etc. Your method should do this the old-fashioned 
way and construct the string by analyzing and manipulating the number.

Input: integer 
Output: string 

Rules:
- cannot use Kernel#format, Integer#to_s or String()
- input will always be positive or zero 

Goal: convert integer to its string representation

Examples / Model Solution: 
4321 ---> '4321'

Data Structures / Data Points to Capture:
- each digit 
- an associated value in string format 

- input: integer
- intermediate: hash
- output: string

Algorithm:
- initialize a results string to hold the answer
- initialize a hash where keys are numbers from 0 to 9 and values are their corresponding strings `num_to_str_dictionary`
- get the digits of the input string and reverse them (digits reverses them by default so we want to order them back to the original) `input_digits`
- iterate over input digits
  - if the current number is found in the hash `num_to_str_dictionary` keys, retrieve the corresponding value 
  - dump each value in the results string
  - return the joined results string
=end
def integer_to_string(number)
  results = ''
  num_to_str_dictionary = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

  input_digits = number.digits.reverse 


  input_digits.map.each_with_index do |num, idx|
    num_to_str_dictionary[num]
  end.join
end

# test cases
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# * DONE