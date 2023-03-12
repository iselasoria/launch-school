=begin 
* DONE 24m19s
Goldbach's Conjecture is amongst the oldest and well-known unsolved mathematical problems. In correspondence with Leonhard Euler in 1742, German mathematician Christian Goldbach made a conjecture, which states:

"Every even whole number greater than 2 is the sum of two prime numbers."

Even though it's been thoroughly tested and analyzed and seems to be true, it hasn't been proved yet (thus, remaining a conjecture.)

Create a function that takes a number and returns an array as per the following rules:

* If the given number is odd and greater than two, return an empty array.
* If the given number is even and greater than two, return an array of two prime numbers whose sum is the given input.
* Both prime numbers must be the farthest (with the greatest difference).

Examples
goldbach_conjecture(1) ➞ []
# The given number is not greater than 2.

goldbach_conjecture(7) ➞ []
# The given number is not an even number.

goldbach_conjecture(14) ➞ [3, 11]

Notes
Return array in sequence: [smaller, bigger]


I: integer
O: array 

Rules:
Conjecture:
  - "Every even whole number that is grater than 2, is the sum of two primes."

Explicit:
  - return empty aray if given integer is odd and greater than 2
  - return an array of TWO prime numbers whose sum adds up to the input integer 
    - both primes must be farthest apart--> graetest distance in between them
  
Examples:
(7) == [] ---> input is odd and greater than 2
(8) == [3, 5] --> even and graeter than two 
(10) == [3, 7]--> even and graeter than two 
(24) == [5, 19]--> even and graeter than two 
(100) == [3, 97]--> even and graeter than two 
(1) == []---> odd and smaller than 2 

Model Solution:
n = 8
**** do all odds return empty array 

check for even and whether it's greater than 2 
range of primes: 2..n  --> 2,3,5,7 --> possible permutations [3,5]
**** what happens when the number has several pairs that add up to it? --> look for pair with smallest number in first position 

DS:
I: integer 
Interm: arrays 
O: Array

Algorithm:
- return empty array when number is odd 

- init primes range from 2 up to n, inclusive # [2,3,5,7..]


- generate pairs from the `primes_range` # [2,3][2,5][3,5]
  - if primes_range is only two items long then push primes range's elements paired with themselves [2,2][3,3]
- transform the pairs collection to their sums and retain the pair #[[[2,3], 5],[[3,5], 8]]..
- select the one that add up to the targe 
- select the first one
=end
require 'prime'

def goldbach_conjecture(num)
  return [] if num.odd?

  primes_range = (2..num).to_a.select {|item| item.prime?}
  
  pairs = primes_range.permutation(2).to_a 
  pairs << [primes_range[0], primes_range[0]] << [primes_range[1], primes_range[1]] if primes_range.size == 2
 
  pairs.map {|pair| [pair, pair.sum]}.select {|par| par[1] == num}[0][0]

end



p goldbach_conjecture(4) == [2, 2]

p goldbach_conjecture(1) == []
p goldbach_conjecture(7) == []
p goldbach_conjecture(8) == [3, 5]
p goldbach_conjecture(10) == [3, 7]
p goldbach_conjecture(24) == [5, 19]
p goldbach_conjecture(100) == [3, 97]
p goldbach_conjecture(1234) == [3, 1231]
p goldbach_conjecture(1400) == [19, 1381]
p goldbach_conjecture(1566) == [7, 1559]
p goldbach_conjecture(3444) == [11, 3433]
# # #Mubashir