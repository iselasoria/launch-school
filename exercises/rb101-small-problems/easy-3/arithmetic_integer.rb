# write a program that priompts the user for two positive integers, and then print the
# results of the following operations on thjose two numbers; addition, subtraction, quotient,
# remainder and power. Don't mind validation.

puts "Enter the first number:"
first = gets.chomp.to_i
puts "Enter the second number:"
second = gets.chomp.to_i

puts "#{first.to_s} + #{second.to_i} = #{first + second}"
puts "#{first.to_s} - #{second.to_i} = #{first - second}"
puts "#{first.to_s} * #{second.to_i} = #{first * second}"
puts "#{first.to_s} / #{second.to_i} = #{first / second}"
puts "#{first.to_s} % #{second.to_i} = #{first % second}"
puts "#{first.to_s} ** #{second.to_i} = #{first ** second}"
