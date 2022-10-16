=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a program that will ask for user's name. The program will then greet the user.
If the user writes "name!" then the computer yells back at the user.
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

puts "What is your name?"
name = gets.chomp

if name.chars.include?('!')
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello, #{name.pro}."
end

# DONE