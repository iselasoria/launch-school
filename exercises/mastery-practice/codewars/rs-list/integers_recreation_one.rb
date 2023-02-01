=begin 
https://www.codewars.com/kata/55aa075506463dac6600010d

1, 246, 2, 123, 3, 82, 6, 41 are the divisors of number 246. Squaring these divisors we get: 1, 60516, 4, 15129, 9, 6724, 36, 1681. The sum of these squares is 84100 which is 290 * 290.

Task
Find all integers between m and n (m and n integers with 1 <= m <= n) such that the sum of their squared divisors is itself a square.

****
1,2,3,4,5,6,..250
divisors of each number in the range ex: 1 --> all divisors of 1, 42 ---> all divisors of 42 
****

We will return an array of subarrays or of tuples (in C an array of Pair) or a string. The subarrays (or tuples or Pairs) will have two elements: first the number the squared divisors of which is a square and then the sum of the squared divisors.

EXAMPLES:
list_squared(1, 250) --> [[1, 1], [42, 2500], [246, 84100]]
list_squared(42, 250) --> [[42, 2500], [246, 84100]]

The form of the examples may change according to the language, see "Sample Tests".

Note
In Fortran - as in any other language - the returned string is not permitted to contain any redundant trailing whitespace: you can use dynamically allocated character strings.


=end 

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: 2 integers (range)
-Find all divisors between the 2 integers
-Square each divisor 
-Find the sum of squares 
-Check if that sum is itself a square.
-OUTPUT: Array [number 

*DS*
Array 

*ALGORITHM*
-Initialize divisors to empty array.
-Initialize squares to empty array.
-Find all divisors between the 2 input integers.
  -Iterate from first input up to second input 
    -Check if current num is divisible by second input 
    -If it is, add it to divisors array
-Iterate through divisors array 
  -Square each num add it to squares
-Iterate through the squares 
  -If the current square has a square root 


=end 

# test cases 

def perfect_square(num)
  sqrt = Integer.sqrt(num)
  sqrt * sqrt == num 
end

def list_squared(int1, int2)
  new_arr = []
  (int1..int2).each do |n|
    
  divisors = []
  squares = []
  

  (1..n).each do |num|
    divisors << num if n % num == 0 
  end 
  divisors.each do |divisor|
    squares << divisor ** 2 
  end 
  
  new_arr << [n, squares.sum] if perfect_square(squares.sum)
  
  end 
 new_arr
end 
#p list_squared(3, 10)
p list_squared(1, 250) #== [[1, 1], [42, 2500], [246, 84100]]
 p list_squared(42, 250) #== [[42, 2500], [246, 84100]]
 p list_squared(250, 500) == [[287, 84100]]

=begin 
find divisors int he range--> numbers that don't have a remainder when your divide original number by them
square the divisors ->> sum of squares 
take square root of the sum 

=end 

# def perfect_square(num)
#   sqrt = Integer.sqrt(num)
#   sqrt * sqrt == num 
# end

# p perfect_square(9)
# p perfect_square(10)