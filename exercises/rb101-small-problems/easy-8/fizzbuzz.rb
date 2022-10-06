=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a methoid that takes two arguments: the first is the starting number, 
and the second is the ending number. Print out all the numbers between the
two numbers, except if the number is divisible by 3, print 'Fizz', if a number
is divisible by 5, print 'Buzz' and finally if a number is divisible
by 3 and 5, print 'FizzBuzz'.
--------------------------PROBLEM----------------------------------------
Questions:
Input: two integers, one is the start and the second one is the ending number
Output: outputs the integer except if the numbers are divisible by 3, 5 or by both
then they print strings in their place as specified by the rules
---------------------------RULES-----------------------------------------
Explicit: 
- if a number is divisible by 3--> print 'fizz'
- if a number is divisible by 5--> print 'buzz'
- if a number is divisible by 3 and 5 --> print 'fizzbuzz'
- if none of the above are true, output the number itself
Implicit: 
--------------------------EXAMPLES---------------------------------------
# divisible by 3
by_three = arr.select do |num|
  num if num % 3 == 0
end
print by_three

# divisible by 5
by_by_five = arr.select do |num|
  num if num % 5 == 0
end
print by_five

# divisible by both
arr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
by_three = arr.select do |num|
  num if num % 5 == 0 || num % 3 == 0
end

print by_both


# ----------------------------ALGO----------------------------------------
- create an array that ranges from the start input number to the end input number
- iterate through the array
- if the current element in the iteration is divisible by 3, print 'fizz'
- if the current element in the iteration is divisible by 5, print 'buzz'
- if the current element is divisible by both 3 and 5, print 'FizzBuzz'
- if none of the above conditions are met, print the current number in the iteration


=end

def fizzbuzz(starting_num, ending_num)
  arre = *(starting_num..ending_num)

  arre.map do |num|
    if (num % 3 == 0 && num % 5 == 0)
      p 'FizzBuzz'
    elsif num % 5 == 0
      p 'Buzz'
    elsif num % 3 == 0
      p 'Fizz'
    else 
      p num
    end
  end
end


fizzbuzz(1, 15)