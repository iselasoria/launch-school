=begin 
A Narcissistic Number (or Armstrong Number) is a positive number which is the sum of its own digits, each raised to the power of the number of digits in a given base. In this Kata, we will restrict ourselves to decimal (base 10).

For example, take 153 (3 digits), which is narcissistic:
    1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153

and 1652 (4 digits), which isn't:

    1^4 + 6^4 + 5^4 + 2^4 = 1 + 1296 + 625 + 16 = 1938

The Challenge:

Your code must return true or false (not 'true' and 'false') depending upon whether the given number is a Narcissistic number in base 10.

This may be True and False in your language, e.g. PHP.

Error checking for text strings or other invalid inputs is not required, only valid positive non-zero integers will be passed into the function.

I: integer 
O: boolean

Rules:
- in order to be true, narcissistic:
  - each digit gets raised to the power of count of digits 
  - the sum of all the results from pervious step gets checked for narcisism 
  - when true, the sum and the original number should be the same 

Examples:
5 ---> 5 ^ 1 --> 5 == 5, narcissistic!

1633 
1^4 + 6^4 + 3^4 + 3^4 ---> sum != original number 


DS:
arrays of digits 

Algorithm:
- get digits of the input number into an array of integers and store in `digits`

- itearte over digits 
  - with each iteration 
    - current number gets raised to the power digits.size 
  - if sum of transformed array != input number 
    - return false 
  - otherwse return true 
=end 
def narcissistic?(number)
  digits = number.digits.reverse

  digits.map {|num| num**digits.size}.sum == number ? true : false
end

# test cases 
p narcissistic?(5) == true
p narcissistic?( 153 ) == true
p narcissistic?( 1633 ) == false
