=begin 

Update the following code so that, instead of printing the values, 
each statement prints the name of the class to which it belongs.

=end 

puts "Hello"
puts 5
puts [1, 2, 3]

# expected output

# String
# Integer
# Array

# SOLUTION
puts "Hello".class
puts 5.class
puts [1, 2, 3].class