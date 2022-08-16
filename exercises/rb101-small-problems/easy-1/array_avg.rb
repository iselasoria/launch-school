=begin
write a method that takes one arg, an array of integers,
and returns the average of all numbers in the array. The arrway will 
never be empty and the numbers will always be positive integers.
Your result should be an integer.
=end

def average(numbers)
  sum = numbers.reduce { |sum, number| sum + number }
  sum / numbers.count
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
# p average([1, 5, 87, 45, 8, 8]) #== 25
# average([9, 47, 23, 95, 16, 52]) #== 40