# E1 Write a program called name.rb that asks the user to type in their name and then prints out 
# a greeting message with their name included.
puts "Type you first name"
name = gets.chomp
puts "Type your last name"
last_name = gets.chomp

puts "Hello #{name} #{last_name}"

# E2 Write a program called age.rb that asks a user how old they are and then tells them how
# old they will be in 10, 20, 30 and 40 years. Below is the output for someone 20 years old.

puts "How old are you?"
age = gets.chomp.to_i



puts "You will be #{age + 10} in 10 years"
puts "You will be #{age + 20} in 20 years"
puts "You will be #{age + 30} in 30 years"
puts "You will be #{age + 40} in 40 years"

# E3 Add another section onto name.rb that prints the name of the user 10 times. You must
# do this without explicitly writing the puts method 10 times in a row. Hint: you can use the times method to do something repeatedly.
puts "Type you first name"
name = gets.chomp
puts "Type your last name"
last_name = gets.chomp


10.times do |name|
  puts "#{name} #{last_name}"
end

# E4 Modify name.rb again so that it first asks the user for their first name, saves it into a variable, and then does the same
# for the last name. Then outputs their full name all at once.
puts "Type you first name"
name = gets.chomp
puts "Type your last name"
last_name = gets.chomp


10.times do |name|
  puts "#{name} #{last_name}"
end

# E5 Compare the following. What does x print to the screen, why, are there any errors.
x = 0
3.times do
  x += 1
end
puts x # x is now 3

y = 0
3.times do
  y += 1
  x = y # x is out of the scope
end
puts x