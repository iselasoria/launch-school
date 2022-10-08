=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that taes a first name, a space and a last name passed as a 
single string argument and returns a string that contains
a last name, a comma, a space, and the first namne
--------------------------PROBLEM----------------------------------------
Questions:
Input: string containing several words
Output: different components separated by a comma
---------------------------RULES-----------------------------------------
Explicit: 
- the order of the words in the origial string is reversed in the return
Implicit: 
--------------------------EXAMPLES---------------------------------------
----------------------------ALGO----------------------------------------
- turn the string into a list of words
- reverse the order of the list of words
=end

def swap_name(full_name)
  list = full_name.split

  list.reverse.join(', ')
end

# test case
p swap_name('Joe Roberts') == 'Roberts, Joe'