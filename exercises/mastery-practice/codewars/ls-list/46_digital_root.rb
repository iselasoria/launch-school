=begin 
# * DONE 9m45s
Digital root is the recursive sum of all the digits in a number.

Given n, take the sum of the digits of n. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. The input will be a non-negative integer.


Example:
16  -->  1 + 6 = 7
942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

I: integer 
O: single digit integer 

Rules:
- add the digits in the number
  - 15--> 1 + 5
  - keep doing until the sum is a singel digit 
- input will always be positive integer 

Examples:
input:   15
digits: [1, 5]
sum :   6 

input: 942
digits: [9,4,2]
sum:     15 
-> digits: [1,5]
-> sum: 6 

Data Structures:
I: integer 
Interim: arrays 
O: integer 

Algorithm:
- initialize a number variabel to hold input 

- while the digits in `number` are more than 1 
  - get the digits in the input number and store as `digits`
  - add all the elements in the digits array 
    - reasign `number` 
-return number 

=end 

def digital_root(num)
  number = num 

  while number.digits.reverse.size > 1
    digits = number.digits.reverse 
    number = digits.inject(:+)
  end
  number 
end

# test cases 

p digital_root(16) ==  7
p digital_root(942) == 6
p digital_root(132189) == 6
p digital_root(493193) == 2
