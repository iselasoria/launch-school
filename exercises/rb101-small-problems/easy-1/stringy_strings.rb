=begin
Write a method that takes one argument, a positive integer,
and returns a string of alternating 1s and 0s, always starting with 1. 
The length of the string should match the given integer.

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
=end

def stringy(len)
  numbers = []

  len.times do |idx|
    number = idx.even? ? 1 : 0
    numbers << number
  end
  numbers.join
end
p stringy(6)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'