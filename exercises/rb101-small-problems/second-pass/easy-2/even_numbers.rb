=begin
-----------------------INSTRUCTIONS--------------------------------------
Print all even numbers from 1 to 99, inlcusive with each on a separate line.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
Output: 
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
=end

arr = (1..99)

arr.each do |num|
  if num.even?
    puts num
  end
end

# DONE