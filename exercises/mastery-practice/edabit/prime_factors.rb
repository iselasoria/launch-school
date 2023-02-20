=begin 
# 3309
https://edabit.com/challenge/vtR2Zoev8MESHR42f


Create a function that takes an array of positive integers and returns a string as:

p1, sum of all ij of the array for which p1 is a prime factor. (prime, [nums in input arr for which the prime is a factor])
p2, sum of all ij of the array for which p2 is a prime factor, ... .
pn, sum of all ij of the array for which pn is a prime factor.

Examples:
sum_prime([12, 15]) ➞ "(2 12)(3 27)(5 15)"
# 2 is a prime factor of 12 results (2 12).
# 3 is a prime factor of 12 and 15, add 15 + 12, results (3 27).
# 5 is a prime factor of 15 results (5 15).
# 7, 11 and 13 are prime numbers but not a factor of any of the number
# in the given array.

sum_prime([7, 13, 18, 23, 24]) ➞ "(2 42)(3 42)(7 7)(13 13)(23 23)"

sum_prime([3, 5, 7, 9, 11, 13]) ➞ "(3 12)(5 5)(7 7)(11 11)(13 13)"

Input: array of integers 
Output: string 

Rules:
  - it checks every prime starting from 2 and up to each item in the array 
  - bundles together the number in the range that is a prime and the number in the array for which it is a prime factor. 
    - if it is a prime factor of more than 1 item in the input array, it adds the numbers for which it is a prime factor and places the sum in the second item in the group 
  
Examples:
input: [12, 15] # num_arr 
primes: 2 3 5 7 11 13 17 19... primes_arr
        # check if prime number is a factor of the item in the array 
        # select those items in the array for which the above is true 
streamlined:   2   3      5 
           [12] [12, 15] [15]
            12    27      15 
return:   '(2, 12)(3, 27)(5, 15)'

input: [4, 6, 8, 10, 12]
primes 2 3 5 7 11 13 17 19

streamlined:   2                  3            5 
            [4, 6, 8, 10, 12]   [6,12]        [10]
                    40            18            10 
return:       (2, 40)(3, 18)(5,10)

Data Structures:
I: array 
Interim: array 
O: string 


Algorithm:
- grab the highest number in the array store as `ceiling`

- iterate through a range from 2 to ceiling # transform 
  - if prime
    - select all the numbers from the original array for which this current number is a factor and sum temp store in `sum`
    - [current number, sum]
- # [[2,40], [3, 18], [5, 10]]

- init results_str ''
- iterate through items in nested array 
  - push a '('
  - push item1, item 2 
  - push ')'

- return results_str

=end 

require 'prime'

def sum_prime(arr)
  ceiling = arr.max

  pairs_arr = (2..ceiling).map do |num|
                if num.prime?
                  sum = arr.select {|item| item % num == 0 }.sum
                  [num, sum]
                end
              end.compact!
  pairs_arr.select! {|pair| pair[1] > 0 }

  results_arr = ''

  pairs_arr.each do |item|
    results_arr << '('
    results_arr << item[0].to_s << ' '<< item[1].to_s
    results_arr << ')'
  end
  results_arr
end







# test cases 
p sum_prime([12, 15]) == "(2 12)(3 27)(5 15)"
p sum_prime([7, 13, 18, 23, 24])== "(2 42)(3 42)(7 7)(13 13)(23 23)"
p sum_prime([4, 6, 8, 10, 12]) == "(2 40)(3 18)(5 10)"
p sum_prime([3, 5, 7, 9, 11, 13]) == "(3 12)(5 5)(7 7)(11 11)(13 13)"
p sum_prime([13, 24, 56, 89, 100]) == "(2 180)(3 24)(5 100)(7 56)(13 13)(89 89)"
p sum_prime([3, 5, 6, 8, 11, 23]) == "(2 14)(3 9)(5 5)(11 11)(23 23)"
p sum_prime([23, 45, 78, 99]) == "(2 78)(3 222)(5 45)(11 99)(13 78)(23 23)"
p sum_prime([122, 126, 222, 445]) == "(2 470)(3 348)(5 445)(7 126)(37 222)(61 122)(89 445)"
