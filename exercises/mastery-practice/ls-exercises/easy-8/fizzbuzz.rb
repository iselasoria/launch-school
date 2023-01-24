=begin 
* DONE 3m40s
Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers from the starting number to the ending number, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Rules:
- print the numbers from starting to ending except:
  - if a number is divisibvle by 2 print 'fizz' 
  - if a number is dividible by 5 print 'buzz'
  - if a number if divisible by both print 'fizzbuz'
=end 

def fizzbuzz(starting, ending)
  ranges = (starting..ending).to_a

  ranges.each do |num|
    if num % 3 == 0 && num % 5 == 0
      p 'FizzBuzz'
    elsif num % 3 == 0
      p 'Fizz'
    elsif num % 5 == 0
      p 'Buzz'
    else
      p num 
    end

  end
end
# test cases 
p fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz