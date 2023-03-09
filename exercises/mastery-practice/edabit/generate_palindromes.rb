=begin 
* DONE 15m
In this challenge, you have to find the last 15 palindromes of all numbers starting from ten and up to a given limit, including the limit in the search.

Given an integer limit being the upper limit of the range of interest, implement a function that returns the last 15 palindromes numbers lower or equal to limit as an array sorted ascendingly.
Examples

generate_palindromes(151) ➞ [
  11, 22, 33, 44, 55,
  66, 77, 88, 99, 101,
  111, 121, 131, 141, 151
]

generate_palindromes(600) ➞ [
  454, 464, 474, 484, 494,
  505, 515, 525, 535, 545,
  555, 565, 575, 585, 595
]

generate_palindromes(999999) ➞ [
  985589, 986689, 987789, 988889, 989989,
  990099, 991199, 992299, 993399, 994499,
  995599, 996699, 997799, 998899, 999999
]

I: integer 
O: array 

Rules:
- palindrome:
  - same digits forward and backward 
  - in the case of odd count of digits, the middle is where the number "folds"

- input number is the upper range, it has to be included 
- range starts at 10 ---> num (upper limit)
  - find ONLY THE LAST 15
  - ascending order 

- range goes down from num to 10

Examples:
input: 151
-151 150 149 148...
-checks for palindrome
-if it is, it's added to a collection 
- stops at 15

DS: 
I: integer 
Interim: arrays 
O: array 

Algorithm:
Helper Method: palindrome?(n)
# a palindrome has the same digits forward and backward 
  - split num digits in half 
    - fh is str starting from 0 and up to half the string size 
    - sh is str starting from str size half to the end 
  if sh reversed is the same as fist half, true 

Main Method: generate_palindromes(num)
- init top_fifteen = []
- starting from num reverse itearte down to 10
  - check for palindrome 
    - if true, then add to collection top_fifteen
  - break if top_fifteen has 15 values 
=end

def palindrome?(n)
  n.to_s == n.to_s.reverse
end 

def generate_palindromes(num)
  top_fifteen = []
  (11..num).reverse_each do |n|
    top_fifteen << n if palindrome?(n)
    break if top_fifteen.size == 15 
  end
  top_fifteen.sort
end


p generate_palindromes(151) == [11, 22, 33, 44, 55, 66, 77, 88, 99, 101, 111, 121, 131, 141, 151]
p generate_palindromes(600) == [454, 464, 474, 484, 494, 505, 515, 525, 535, 545, 555, 565, 575, 585, 595]
p generate_palindromes(999999) == [985589, 986689, 987789, 988889, 989989, 990099, 991199, 992299, 993399, 994499, 995599, 996699, 997799, 998899, 999999]
p generate_palindromes(3443) == [2002, 2112, 2222, 2332, 2442, 2552, 2662, 2772, 2882, 2992, 3003, 3113, 3223, 3333, 3443]
p generate_palindromes(13000) == [11511, 11611, 11711, 11811, 11911, 12021, 12121, 12221, 12321, 12421, 12521, 12621, 12721, 12821, 12921]