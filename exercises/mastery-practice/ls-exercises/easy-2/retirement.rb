=begin 
* DONE 3m
Build a program that displays when the user will retire and how many years
she has to work till retirement.

Example: 
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end 

require 'time'
t = Time.now 

puts "What is your age? "
age = gets.chomp.to_i 

puts "At what age do you want to retire?"
ret_age = gets.chomp.to_i 

diff = ret_age - age
year = t.year 
ret_year  = year + diff 
puts "It's #{year}. You will retire in #{ret_year}. You only have #{diff} years to go!"
32