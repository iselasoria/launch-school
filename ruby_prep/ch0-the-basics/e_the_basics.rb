# E1 Add two strings together
first_name = "Rosa"
last_name = "Soria"

puts first_name + " " + last_name

# E2 Use the modulo operator, division or a combination of both to take a 4 digit number
# and find the digits in the thoudsnads, hunbdreds, tens and ones places

number = 3569

thousands = 3569 / 1000
hundreds = 3569 % 1000 / 100
tens = 3569 % 1000 % 100 / 10
ones = 3569 % 1000 % 100 % 10

puts thousands
puts hundreds
puts tens
puts ones

# E3 Write a program that uses a hash to sore moveis and the year it came out.
# Then use the `puts` command to make your program print out the year.

movies = {
  silence_of_the_lambs: 1991,
  the_machinist: 2004,
  cast_away: 2000
}

puts movies[:silence_of_the_lambs]
puts movies[:the_machinist]
puts movies[:cast_away]

# E4 Use the dates from the previous example and store them in an array.
# Then make your program output the same thing as exercise 3.

dates = [1991, 2004, 2000]

puts dates[0]
puts dates[1]
puts dates[2]

# E5 Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.
puts 5 * 4 * 3 * 2 * 1
puts 6 * 5 * 4 * 3 * 2 * 1
puts 7 * 6 * 5 * 4 * 3 * 2 * 1
puts 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1

# E6 Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.

puts 6.6 * 6.6
puts 3.4 * 3.4
puts 1.2 * 1.2

# E7 What does the following error message tell you?
SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
  from /usr/local/rvm/rubies/ruby-2.5.3/bin/irb:16:in `<main>'

# there is an opening bracket somewhere that did not get closed, instead a closing parenthesis was used.