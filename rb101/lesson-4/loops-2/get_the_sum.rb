# the code below asks the user "what does 2 + 2 equal?" and uses #gets to retrievce user input.
# Modify so "That's correct!" is printed when the user's answer = . Print "Wrong answer. Try again!" if it is not

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
# end

#SOLUTION
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  end

  puts "Wrong answer. Try again!"
end

