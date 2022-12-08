=begin
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.


Input: Integer
Output: integer 

Rules:
- compute the difference between:
  - square of the sum f the first n positive integers 
  - sum of the squares of the first n positive integers 
- all inputs will be positive 

Examples / Model Solution:
input        expaned        sum of squares            square of sums 
3            [1,2,3]         (1 + 2 + 3)**2       (1**2 + 2**2 + 3**2) 
                                  6**2              1 + 4 + 9
                                  36                    14
                                            22
Data:
in: integer 
intermediate: arrays 
out: integer 


Algorithm:
- generate an array of 1 through n integers `mother_arr`
- initialize `sum_squares`
  - add all elements in the array and square the result, store in `sum_squares`
- iterate over `mother_arr` to make a new array 
  - each item will get squared 
  - sum the newly created array and store in `square_sums`
- calculate the difference between sum_squares
- return difference 
=end 

def sum_square_difference(n)
  mother_arr = (1..n).to_a

  sum_squares = (mother_arr.sum)**2

  square_sums = mother_arr.map {|num| num ** 2}.sum
  sum_squares - square_sums
end

# test cases 
p sum_square_difference(3) == 22
  #  -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150