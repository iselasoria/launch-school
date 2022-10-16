=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes one argument, a positive integerm and returns a sitnrg of alteranting 1s and 0s, always starting with:
1. The length of the string should match the given integer
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: string
---------------------------RULES-----------------------------------------
Explicit: 
- string should include alternating 1s and 0s
Implicit: 
--------------------------EXAMPLES---------------------------------------
stringy(6) == '101010'
stringy(9) == '101010101'
----------------------------ALGO----------------------------------------
- if the integer is even, take integer `n`
  - puts '01' * n
- if integer is odd
  -

=end

def stringy(n)
  # puts n/2
  if n.even?
    '10' * (n/2)
  else
    '10' * (n/2) + '1'
  end
end

# LS Solution
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

# test cases
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# DONE