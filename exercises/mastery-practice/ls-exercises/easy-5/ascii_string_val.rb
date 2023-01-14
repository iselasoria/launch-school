=begin
* DONE 56s
Write a method that determines and returns the ASCII string value of a 
string that is passed in as an argument. The ASCII string value is the 
sum of the ASCII values of every character in the string. (You may 
use String#ord to determine the ASCII value of a character.)

Algorithm:\
- initialize values_arr 
- iterate over the string

  - at each character
    - call String#ord and store value in values_arr ### think about spaces too
  - sum up and return values_arr

=end 

def ascii_value(str)
  values_arr = []

  str.chars.each do |letter|
    values_arr << letter.ord 
  end
  values_arr.sum
end

# test cases 
p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0