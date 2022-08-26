# print all evens from 1 to 99, inclusive, to the console 
# each one on a separate line
tally = 1


while tally <= 99
  puts tally if tally.even?
  tally += 1
end