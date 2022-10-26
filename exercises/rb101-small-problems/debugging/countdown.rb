# Our countdown to launch is not working, why? change the code so it runs from 10 to 1.

def decrease(counter)
  counter -= 1
end

counter = 10

10.times do 
  puts counter
  counter = decrease(counter) # the counter needed to be reasigned
end

puts 'LAUNCH!'