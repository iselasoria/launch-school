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

