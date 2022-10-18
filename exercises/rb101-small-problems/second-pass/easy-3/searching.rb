=begin
--------------P
Write a problems that solicits 6 numbers from the user, then prints a message that describes
whether or not the 6th number appears amongst the first 5.
-----E
[2,34,6] --> the number 2 appears
-----D
- array

-----A
- ask user input
- save each number input into an array
- check if the last element in the array is included in the first 5
-----C
=end

arr = []

puts "Enter the 1st number:"
first = gets.chomp.to_i
arr << first

puts "Enter the 2nd number:"
second = gets.chomp.to_i
arr << second

puts "Enter the 3rd number:"
third = gets.chomp.to_i
arr << third

puts "Enter the 4th number:"
fourth = gets.chomp.to_i
arr << fourth

puts "Enter the 5th number:"
fifth = gets.chomp.to_i
arr << fifth

puts "Enter the 6th number:"
sixth = gets.chomp.to_i
arr << sixth


if arr[0..4].include?(arr.last) 
  puts "The number #{arr.last} appears in #{arr[0..4]}." 
else 
  puts "The number #{arr.last} does not appear in #{arr[0..4]}."
end

# DONE