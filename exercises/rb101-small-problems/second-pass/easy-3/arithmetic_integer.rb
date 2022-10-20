=begin
----------------------P
Write a program that promts the user for two positive integers,
and then prints the results of the following operations on those two numbers: 
addition, subtraction, product, quotient, remainder and power.
----------------------E
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
----------------------D
----------------------A
----------------------C
=end

puts "Enter the first number: "
first = gets.chomp.to_i


puts "Enter the second number:"
second = gets.chomp.to_i

puts "#{first} + #{second} = #{first + second}"

puts "#{first} - #{second} = #{first - second}"

puts "#{first} * #{second} = #{first * second}"

puts "#{first} / #{second} = #{first / second}"

puts "#{first} % #{second} = #{first % second}"

puts "#{first} ** #{second} = #{first ** second}"
