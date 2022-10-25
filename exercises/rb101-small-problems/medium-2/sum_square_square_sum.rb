=begin
Write a method that computes the difference between the
square of the sum of the first n positive integers and
the sum of the squares of the first n positive integers.

-------------P
Input:
Outout:
Goal: - Given a number, expand all its positive integers and add them up. Then calculate the square root of that 
      - Now, take each one of the expanded positive integers and calculate squares for each. Add them up.
      - Take the difference between the two numbers above

Rules:
- explicit:
- implicit:
-------------E
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
-------------D/M
Model Solution:
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
-------------A
- Take number, `n` and expand all of its positive integers ie) 3 --> 1, 2, 3
  - calculate the sum of the above integers
  - calculate the square of the above sum, store this in a variable sum_squares
- Take number `n` and expand all its posistive intgers
  - calculate the sum of each of the above intgers
  - calculate a sum of all the above squares, store them in a variable square_sums 
- return sum_squares - square_sums

=end

def sum_square_difference(n)
  list_integers = (1..n).to_a

  simple_sum = list_integers.reduce(:+)
  square_of_sums = simple_sum ** 2

  simple_squares = list_integers.map {|num| num ** 2}
  sum_of_squares = simple_squares.reduce(:+)

  square_of_sums - sum_of_squares


end



# test case
p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150

# DONE
