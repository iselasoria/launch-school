=begin 
* DONE 1m56s
Write a method that takes a string argument, and returns true if all of
the alphabetic characters inside the string are uppercase, false otherwise. 
Characters that are not alphabetic should be ignored.

Rules:
- ignore non alphabetic characters 
- returns true if ALL chars are uppercase, false oterwise 
=end 

def uppercase?(str)
  str.chars.all? { |char| char == char.upcase }
end

# test cases
p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true