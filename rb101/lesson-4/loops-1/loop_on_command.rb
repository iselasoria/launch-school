# Modify the code so the loop stops iterating when the user types "yes"

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
end

# SOLUTION
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == 'yes'
end