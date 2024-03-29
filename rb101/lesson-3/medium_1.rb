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

# E4 In this implementation, two options are shown one that uses `<<` and one uses `+`
# what is the difference between the two?
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# SOLUTION
# the `<<` operator mutates the caller, which means in this example, it is acting on the object referenced by
# the local variable `buffer`. The line `buffer << new_element` gets referenced and updated to add a new element.
# The `+` is used in the line `buffer = input_array + [new_element]` and it is used along with `=` which is reasignment.
# this means that the object is not being referenced directly but a new obkect is created instead.

# E5 this code has a bug related to the limit variable, what is wrong and how do you fix it?

limit = 15

def fib(first_num, second_num)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"

# SOLUTION
# the local variable `limit` is outside the scope of method `fib` and therefore cannot be accessed. The fix is to pass it
# explicitly as an argument, amd for that we need to define a parmeter in the methid definition so it can expect it.
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 15) # pass in the limit here as the third argument
puts "result is #{result}"

# E6 what is the limit of the code below:

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer) # 50

p answer - 8 # 34

# SOLUTION here the argument is passed by reference, integers are immutable first of all and that is why in this case
# Ruby appears to acuse a pass by value strategy. In cases where the argument is immutable Ruby will pass objects this way.

# E7 Spot was wrote a program to mess with the Munster's data. When the function gets called, has he messed it up for good?

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  # p demo_hash.object_id
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
  # p demo_hash.object_id
  demo_hash
end

p mess_with_demographics(munsters)

# SOLUTION the `demo_hash` is pointing to the original object, and for this reason the data does get messed up. 
#  the method uses a setter method (`[]=`) and this is a mutating method so ruby appears to use pass by reference srategy

# E8 given the method definition, what is the result of the method call below it?
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# rps("rock", "paper"), rps("rock", "scissors")
# paper                    rock
# paper
# paper

# E9 Consider the two simple methods; what does the subsequent method call return?

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

bar(foo)

# SOLUTION
# no. method `foo` will always return "yes" because it is the last line in the method definition
# when the return of `foo` is passed to method `bar` we get `"yes"=="no"` which will be false 
# and the ternary operator will go to "no"