=begin 
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Return an error message if there is no next featured number.

Input: number 
Output: returns integer 

Rules:
- digits must be unique 
- must be a multiple of 7
- implicit:
  - must be odd 

Goal: find the next featured number closest to the input number, and return an error if there isnt one. 

Example / Model Solution:
49 ----> digits are unique and number is divisible by 7 ---> featured number      
98 ----> even, so not a featured numer 
133 ---> 3 repeats ---> not a featured number

Data:
Data Points to Capture:
  - itearation to find next number in a collection 

Data Structures:
- in: integer 
- interim: array 
- out: integer 

Algorithm:
- create an array starting at `n` and going up to n * 7 `numbers_arr` [12,13,14,15,16...]
- iterate over the array numbers_arr 
  - for every iteration 
    - if the current number is divisible by 7 and its digits are unique return it 
      --> if the digits of the number, uniqued are the same length as the number 

=end 

def featured(n)
  return "No possible featured number" if n.digits.size > 9 
  numbers_arr = (n + 1..n * 2).to_a

  next_featured = []
  numbers_arr.each do |number|
    if number.odd?
      if number % 7 == 0 && (number.digits.reverse.uniq.size == number.digits.size) 
        next_featured << number && number
      end
    end
  end
  p next_featured
  next_featured[0]
end
# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547

p featured(999_999_987) #== 1_023_456_987
# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements