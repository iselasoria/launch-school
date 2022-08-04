# E1 replicate this, but ten times using a one-liner:
# The Flintstones Rock!
#  The Flintstones Rock!
#   The Flintstones Rock!

10.times {|item| puts (' '* item) + 'The Flintstones Rock!'}

# E2 Why does this code give an error and how can we gix it?
puts "the value of 40 + 2 is " + (40 + 2)
#SOLUTION
# the first part before the `+` is a string, then we are trying to concatenate it to
# an integer and this cannot be done. We can Fix it like this:
puts "the value of 40 + 2 is " + (40 + 2).to_s

# E3 This code will fail when the divisor is passed as 0 or as a negative
# number. How can we rework it withoiut `begin/end/until`? Bonus, what is the purpose
# of `number % divisor == 0`? Bonus 2 what is the purpose of the second to last line?
def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end until divisor == 0
  factors
end

p factors(18)

# SOLUTION
# the purpose of the `number % divisor == 0` is to find all the factors, which will divide 
# equally into the number. The second to last line is used to ensure the new array of factors
# ends up being the return of the method

def factors(number)
  divisor = number
  factors = []
  while divisor > 0
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

p factors(-18)