# The code below is an example of a nested loop-- both loops go on infinitelty. 
# Modify so each one stops after the first iteration.

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break # added
  end
  break # added
end

puts 'This is outside all loops.'