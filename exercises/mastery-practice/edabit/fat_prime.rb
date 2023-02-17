=begin 
https://fine-ocean-68c.notion.site/Problem-List-d3736bd5cd5b4be797720aa42803c2e5#fc44c9d532dd4bb082be077ce15c6ea9

https://edabit.com/challenge/SwyawsjXEX2ZyJuJJ

Given two integers as arguments, create a function that finds the largest prime within the range of the two integers.

fat_prime(2, 10) == 7
# range [2, 3, 4, 5, 6, 7, 8, 9, 10] and the largest prime is 7.

fat_prime(10, 2) == 7
# [10, 9, 8, 7, 6, 5, 4, 3, 2] and the largest prime is 7.

fat_prime(4, 24) == 23
# range [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24] the largest prime is 23.

I: two integers -> floor and ceiling of the range 
O: prime number (integer)

Rules:
- a number is prime if it's only divisbile by 1 and by itself 
- range goes from arg1 to arg2 

Examples:
floor: 2 
ceiling: 10
range: 2,3,4,5,6,7,8,9,10
         3   5   7   
         largest prime is 7 
select the largest prime 

Data Structures:
I: two integers 
Interim: array of integers 
O: integer 

Algorithm:
Helper Method: is_prime?(n)
  -for the range (2..n) 
    - check if n is divisbile by the number in the current iteration and there is not remainder

Main Method: fat_prime(floor, ceiling)
- iterate over the range (floor..ceiling) --> selection stored in `primes_only`
  - on each iteration
    - check if is_prime? 
- get max of primes_only
=end 

# def is_prime?(n)
#   (2...n).each do |divisor| # exclude self 
#     return false if n % divisor == 0 # has a remainder 
#   end
#   true
# end

def prime?(number)
  (2...number).all? do |divisor|
    # p divisor
    number % divisor != 0
  end
end


def fat_prime(floor, ceiling)
  if ceiling < floor 
    range = (ceiling..floor).to_a.reverse

  else
    range = (floor..ceiling).to_a
  end 
  primes_only = range.select do |num|
                  prime?(num)
                end

  primes_only.max
end

p fat_prime(2, 10) == 7
p fat_prime(10, 2)  ==  7
p fat_prime(4, 24) == 23