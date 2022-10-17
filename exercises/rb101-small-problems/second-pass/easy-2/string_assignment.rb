=begin
-----------------------INSTRUCTIONS--------------------------------------
What does the code print:

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

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

# SOLUTION
# the code outputs BOB, BOB
# In the first line of the code local variable  `name` points to string object 'Bob', in the second line, `save_name` is also pointing to that same object
# Then on the third line we are calling the mutating  method upcase! on the object referenced by `name` which is still the same object that `save_name` references 
# thus we have mutated a single object that is referenced by both variables.
# DONE 