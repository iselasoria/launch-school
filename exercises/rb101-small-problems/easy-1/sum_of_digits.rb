# Write a method that takes one argument, a positive int, and 
#  returns the sum of its digits.

def sum(number)
  total = 0
  cha = number.to_s.chars

  cha.each do |item|
    total += item.to_i
  end 
  total
end

p sum(23)

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45