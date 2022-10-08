=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a methiod that takes a number as an argument. If the argument is a
positive number, return  the negative of that number.
If a number is 0 or negative, return the origianl number.
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: integer
---------------------------RULES-----------------------------------------
Explicit: 
- positive inputs will return their negative equivalent
- negative inputs or 0 will return the original
Implicit: 
--------------------------EXAMPLES---------------------------------------

----------------------------ALGO----------------------------------------
- if number is greater than 1, return the negative equivalent maybe use ranges?
- if number is less than 1, return number

=end

def negative(number)
  if number < 1
    number
  else
    number * -1
  end
end


# test cases
p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby