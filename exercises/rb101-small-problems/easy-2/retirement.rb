# build a program that displays when the user
# will retire and how many years of work they have left.

# EXAMPLE

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

puts "What is your age?"
age = gets.chomp.to_i

puts "At what age do you want to retire?"
retire = gets.chomp.to_i

left = retire - age
t = Time.now
ret_year = t.year + left
puts "It's #{t.year}. You will retire in #{ret_year}"