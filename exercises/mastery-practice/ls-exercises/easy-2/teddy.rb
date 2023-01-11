=begin
* DONE 1m07s
Build a program that randomly generates and prints Teddy's age. To get the age, 
you should generate a random number between 20 and 200.
=end 


age = (20..200).to_a.sample
puts "Teddt is #{age} years old!"
# example
# Teddy is 69 years old!