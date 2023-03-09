=begin 
* DONE 15m21s
Write a method that computes the difference between the square of the sum of the first n positive integers and the sum of the squares of the first n positive integers.


Algorithm:
- generate a range from 1 to n 

- init a variable called `square_of_sum` to the result of squaring the sum of the range array 

- transform the range to square each item and then sum it all up, store in `sum_of_squares`

- take the difference of the two above and return 
=end 

def sum_square_difference(num)
  num_range = (1..num).to_a 
  square_of_sum = ((num_range).sum)**2
  sum_of_squares = (num_range.map {|i| i**2}).sum
  square_of_sum - sum_of_squares
end



p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150