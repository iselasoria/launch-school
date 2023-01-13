=begin
Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, 
and then computes the sum of those multiples. For instance, if the supplied number is 20, 
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.


Rules:
- check all numbers to see if they are multiples of either 3 or 5 
- add up all the mutliples found 

Algorithm:
- starting at 1, and going up to n inlcusive
  - check if the number is a multiple of either 3 or 5
    - if they are, add it to the multiples collection
  - sum up the multiples collection and return it
=end 
# test cases 

def multisum(num)
  multiples = []
  number = 1
  
  loop do 
    if (number % 3 == 0 ) || (number % 5 == 0)
      multiples << number
    end
    number += 1
    break if number > num
  end
  multiples.sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168