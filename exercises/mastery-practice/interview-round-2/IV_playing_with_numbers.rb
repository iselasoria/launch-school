=begin 
* DONE 26m30s
https://www.codewars.com/kata/5552101f47fc5178b1000050/train/ruby

Some numbers have funny properties. For example:

89 --> 8¹ + 9² = 89 * 1

695 --> 6² + 9³ + 5⁴= 1390 = 695 * 2

46288 --> 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51

Given a positive integer n written as abcd... (a, b, c, d... being digits) and a positive integer p

we want to find a positive integer k, if it exists, such that the sum of the digits of n taken to the successive powers of p is equal to k * n.
In other words:

Is there an integer k such as : (a ^ p + b ^ (p+1) + c ^(p+2) + d ^ (p+3) + ...) = n * k

If it is the case we will return k, if not return -1.

Note: n and p will always be given as strictly positive integers.

dig_pow(89, 1) should return 1 since 8¹ + 9² = 89 = 89 * 1
dig_pow(92, 1) should return -1 since there is no k such as 9¹ + 2² equals 92 * k
dig_pow(695, 2) should return 2 since 6² + 9³ + 5⁴= 1390 = 695 * 2
dig_pow(46288, 3) should return 51 since 4³ + 6⁴+ 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51


I: two integers 
O: integer 

Rules:
- return -1 if there are no numbers that fulfill the requirements 
- first argument will have its digits raised to some powers
- second argument is the start of the powers, if 2, then first digit gets raised to teh 2, then second to the 3rd, third to the 4th, etc..
- last, we need to check if the sum of the digits at powers is equal to the number * the initial power 

Examples:
695 and 2
6**2 + 9**3 5**4
36 + 729 + 625
    Is  1390 equal to original number * original power?
    1390 == 1390
    return power

DS: 
arrays and integers 

Algorithm:
- get the digits in the input number 
- init an array range from power up to as many more as there are digits powers_arr

- iterate and transform
  - with each number 
    - calculate it to the ith power from the powers_arr
    - add them all up
    ### sum of all numbers powered divided by og
    if the sum of the aray of powers is the same as number * powers, return powers 
  catch-all woth a -1 
=end 

def dig_pow(og_number, power)
  digits = og_number.digits.reverse

  powers_arr = []
  (digits.size + 2).downto(power).reverse_each {|i| powers_arr << i} # maybe more than I need
  
  # digits.map.with_index {|num, idx| num**powers_arr[idx]}.sum == og_number * power ? power : -1
  suma = digits.map.with_index {|num, idx| num**powers_arr[idx]}.sum
  winner = suma / og_number
  winner * og_number == suma ? winner : -1
end

# test cases 
p dig_pow(89, 1) == 1
p dig_pow(92, 1) == -1
p dig_pow(695, 2) == 2
p dig_pow(46288, 3) == 51