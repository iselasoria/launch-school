=begin 
https://edabit.com/challenge/cCK4JjqqmHcP89TZT

Create a function that takes an integer and returns the factorial of that integer. That is, the integer multiplied by all positive lower integers.

Examples
factorial(3) ➞ 6
factorial(5) ➞ 120
factorial(13) ➞ 6227020800

Notes
Assume all inputs are greater than or equal to 0.

I: integer 
O: integer 

Rules:
  - return the factorial if input integer 
    - 1..input number multiplied
  - the factorial is the product of all numbers in a range from 1 to n 
Examples:
- factorial
  - input 3
    3 * 2 * 1 ---> 6

- input 5 
 5 * 4 * 3 * 2 * 1 --> 120

 Data: 
 I: integers 
 Interim: range/array 
 O: integer 

 Algorithm:
 - initialize a range from 1..n 
 - inject to multiply

=end 

def factorial(num)
  counter = num
  prod = 1
  loop do 
    prod *= counter 
    counter -= 1
    break if counter == 1
  end
  prod
  # (1..num).to_a.map do |x|
  #   x * counter
  #   counter -= 1
  # end
  # (1..num).inject(:*)
end

# Examples
p factorial(3) #== 6
p factorial(5) == 120
p factorial(13) == 6227020800