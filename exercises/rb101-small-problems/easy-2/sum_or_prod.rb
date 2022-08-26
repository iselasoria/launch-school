=begin
wrirte a program that asks the user to enter an integer greater tahn 9 and then asks if the user wants to determine teh sium or pridtct of all
the numbers between 1 and that input number.

example:
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

puts "Please enter an ingeger greater than 0: "
input_integer = gets.chomp.to_i

puts "Enter 's' to computer sum, or 'p' to compute the product."
computation = gets.chomp

# get the numbers in the range

# RANGE = (1..input_integer).to_a


# def compute_sum(number)
#   sum = 0
#   for num in RANGE do
#     sum += num
#   end
#   sum
# end

# def computer_prod(number)
#   prod = 1
#   for num in RANGE do
#     prod *= num
#   end
#   prod
# end


# if computation == 's'
#   sum = compute_sum(input_integer)
#   puts "The sum between 1 and #{input_integer} is: #{sum}"
# elsif computation == 'p'
#   product = computer_prod(input_integer)
#   puts "The product of the integers between 1 and #{input_integer} is: #{product}"
# end

# RUBY-IST SOLUTION USING ENUMERABLE#INJECT
if computation == 's'
  sum = (1..input_integer).inject {|sum, number| sum + number}
  puts "The sum of all integers between 1 and #{input_integer} is: #{sum}"
elsif computation == 'p'
  prod = (1..input_integer).inject {|product, number| product * number }
  puts "The product of all integers between 1 and #{input_integer} is: #{prod}"
end