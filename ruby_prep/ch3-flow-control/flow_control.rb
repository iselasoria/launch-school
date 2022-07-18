# E1 Write down whether the following expressions return true or false. 
# Then type the expressions into irb to see the results.

puts (32 * 4) >= 129 # false
puts false != !true # false 
puts true == 4 # false
puts false == (847 == '874') # true
puts (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false # COMPARISON/EQUALITY/AND/OR
# here the one true expression evaluates the whole thing to true

# E2 Write a method that takes a string as an argument. The method should return a new, all-caps version 
# of the string, only if the string is longer than 10 characters. 
# Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful.

def cap_me(str)
  str.length > 10 ? str.upcase! : str
end

puts cap_me("gatubelitos")

# E3 Write a program that takes a number from the user between 0 and 100 and reports back
# whether the number is between 0 and 50, 51 and 100, or above 100.

puts "Give me a number between 0 andn 100:"
num = gets.chomp.to_i

if num < 0
  puts "You can't enter a negative number"
elsif num <= 50
 puts "Your number is between 0 and 50"
elsif num <= 100
  puts "Your number is between 51 and 100"
else
  puts "Your number is greater than 100"
end

# E4 What will each block of code below print to the screen?

# Snippet 1
'4' == 4 ? puts("TRUE") : puts("FALSE") #FALSE

# Snippet 2
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end ## Did you get it right?

# Snippet 3
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!" # alright now!
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end

# E5 When you run this code, you get the error message below, how can you fix it?
def equal_to_four(x)
  if x == 4
    puts "yup"
  else
    puts "nope"
end

equal_to_four(5)

exercise.rb:8: syntax error, unexpected end-of-input, expecting keyword_end

# if statement is missing the end keyword


# E6 Write down whether the followinfg expressions return true or false or raise an error.
puts (32 * 4) >= "129" #error, can't compare integer to string
puts 847 == '874' # false
puts '847' < '846' #  false
puts '847' > '846' # true
puts '847' > '8478' # false
puts '847' < '8478' # true 
