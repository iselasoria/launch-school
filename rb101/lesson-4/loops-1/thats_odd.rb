# the code below is a for loop. Modify so that it only outputs i if i is an odd number.

for i in 1..100
  puts i
end

# SOLUTION 
for i in 1..100
  puts i if i % 2 != 0
end