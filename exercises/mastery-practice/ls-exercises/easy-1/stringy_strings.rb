=begin 
Write a method that takes one argument, a positive integer, and
returns a string of alternating 1s and 0s, always starting with 1. 
The length of the string should match the given integer.

# Algo:
- initialize an array object
  - iterate over the number of times
    - with each iteration set a temp number to either 1 for even index, or 0 for odd index 
    - with each iteration push the temp number
  - return the joined version of the array object 
=end


def stringy(num)
  stringy = []
  num.times do |item|
    number = item.even? ? 1 : 0
      stringy << number
  end
  stringy.join
end
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'