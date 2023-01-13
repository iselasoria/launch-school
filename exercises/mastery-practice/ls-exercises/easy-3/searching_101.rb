=begin
* DONE 3m14s
Write a program that solicits 6 numbers from the user, then prints a message that describes whether or not the 6th 
number appears amongst the first 5 numbers.

Examples:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].
=end 
nums = []
puts "Enter the first number: "
nums << gets.chomp.to_i
puts "Enter the second number: "
nums << gets.chomp.to_i
puts "Enter the third number: "
nums << gets.chomp.to_i
puts "Enter the fouth number: "
nums << gets.chomp.to_i
puts "Enter the fifth number: "
nums << gets.chomp.to_i
puts "Enter the last number: "
check = gets.chomp.to_i 

if nums.include?(check)
  puts "The number #{check} appears in #{nums}."
else
  puts "The number #{check} does not appear in #{nums}."
end