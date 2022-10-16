require 'Time'
=begin
-----------------------INSTRUCTIONS--------------------------------------
Build a program that displaus when the user will retire and how many years she has to work till retirement.
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
Output: 
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
----------------------------ALGO----------------------------------------
=end

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_age = gets.chomp.to_i

t = Time.now
current_year = t.year

time_left = retirement_age - age

puts "It is #{current_year}. You will retire in #{current_year + time_left}."

# DONE