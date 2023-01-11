=begin
* DONE 6m25s

Write a program that asks the user to enter an integer greater than 0, 
then asks if the user wants to determine the sum or product of all numbers 
between 1 and the entered integer.

Example:
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

=end

puts "Please enter an intger greater than 0: "
num = gets.chomp.to_i 
puts "Enter 's' to compute the sum or 'p' to compute the product: "
comp = gets.chomp 

sum = (1..num).sum 
prod = (1..num).inject {|n, prod| n * prod} 

puts(comp == 's' ? "The sum of integers between 1 and #{num} is #{sum}." : "The product of integers between 1 and #{num} is #{prod}." )