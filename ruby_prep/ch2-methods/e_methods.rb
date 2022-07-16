# E Write a program that prints a greeting message. This program should contain a method 
# called greeting that takes a name as its parameter and returns a string.

def greeting(name)
  print "Hello #{name}"
end

# E2 what does this evaluate to?
1. x = 2 # 2

2. puts x = 2 # nil

3. p name = "Joe" # "Joe"

4. four = "four" # "four"

5. print something = "nothing" # prints "nothing" but returns nil

# E3 Write a program that includes a method called multiply that takes two arguments 
# and returns the product of the two numbers.

def multiply(n1, n2)
  n1 * n2
end


# E4 What does this print to the screen?
def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

# this does not return anything because the return inside the method definition stops the method execution so the last line never gets executed

# E5 Edit the method definition in exercise #4 so that it does print words on the screen. 2) What does it return now?
def scream(words)
  words = words + "!!!!"
  puts words
end


scream("Yippeee")
# now it prints Yinpeee!!!! but returns nil


# E6 what does this error message tell you? 
ArgumentError: wrong number of arguments (1 for 2)
  from (irb):1:in `calculate_product'
  from (irb):4
  from /Users/username/.rvm/rubies/ruby-2.5.3/bin/irb:12:in `<main>'

# the method expected 2 arguments and only got one