# print all odd numbers 1 to 99 inclusive. One on each line
value = 1
while value <= 99
  puts value
  value += 2
end

# SECOND SOLUTION
tally = 1.upto(99)

for i in tally
  if i.odd?
    puts i
  end
end