# Use the array to greet each person individually
# use a for loop

friends = ['Sarah', 'John', 'Hannah', 'Dave']
counter = 0

while counter < friends.size
  puts "Hello, #{friends[counter]}!"
  counter += 1
end

# SOLUTION

friends = ['Sarah', 'John', 'Hannah', 'Dave']

for friend in friends
  puts "Hello, #{friend}!" 
end