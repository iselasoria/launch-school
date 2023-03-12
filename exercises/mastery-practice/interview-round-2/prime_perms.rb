=begin 
* DONE 34m00s
https://leetcode.com/problems/prime-arrangements/
Return the number of permutations of 1 to n so that prime numbers are at prime indices (1-indexed.)

(Recall that an integer is prime if and only if it is greater than 1, and cannot be written as a product of two positive integers both smaller than it.)

Since the answer may be large, return the answer modulo 10^9 + 7.

Input: n = 5
Output: 12
Explanation: For example [1,2,5,4,3] is a valid permutation, but [5,2,3,4,1] is not because the prime number 5 is at index 1.
Example 2:

Input: n = 100
Output: 682289015


I: int 
O: Integer

Rules:
- not-zero based index, position starting at 1 and going up to n 
- permutations of n 
  - retrun the number of valid permitations 
    - valid:
      - prime numbers must be placed at prime indeces 

Examples:
n = 5
range:        [1,2,3,4,5]
permuitations
positions      *__*_ --> 1 2 4

DS:
I: integers 
Interm: array
O: integer  

Algorithm:
Helper Method: valid_permutation?(arr) --> boolean

- init `prime_positions` an array of prime numbers 2,3,5,7..

- iterate over the permutation array 
     # if index + 1 is prime, 
       - check if number is also prime, next if it is, false if not 

Main Method:
- generate the permutations of n 

- itearte over permutations of n --> selection
  - run it by the valid_permutation? method 
  - count the selected permutations 

=end
require 'prime'

def valid_permutation?(perm)
  prime_positions = (1..perm.size).to_a.select {|item| item.prime?}

  all_clear = true
  perm.each_with_index do |num, idx| #[5, 4, 1, 2, 3]
    if (idx + 1).prime?
      next if num.prime?
      all_clear = false 
    end
  end
  all_clear
end


def num_prime_arrangements(num)
  all_permutations = (1..num).to_a.permutation(num).to_a

  all_permutations.select do |perm|
    valid_permutation?(perm)  
  end.size
end

p valid_permutation?([1, 2, 3, 4, 5]) #true 
p valid_permutation?([1, 2, 4, 3, 5]) # false 
p valid_permutation?([5, 4, 3, 1, 2]) # false  
p valid_permutation?([5, 4, 1, 2, 3]) # false 

p num_prime_arrangements(5) #== 12
num_prime_arrangements(100) == 682289015