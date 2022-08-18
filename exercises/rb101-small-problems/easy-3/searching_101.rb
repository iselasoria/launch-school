# write a program that solicits 6 numbers from the user, thjen prints a message 
# that derscribes whether or not the 6th number appears amonfgst the first 5 numbers.
arre = []
puts "Enter the 1st number:"
arre << gets.chomp.to_i
puts "Enter the 2nd number:"
arre << gets.chomp.to_i
puts "Enter the 3rd number:"
arre << gets.chomp.to_i
puts "Enter the 4th number:"
arre << gets.chomp.to_i
puts "Enter the 5th number:"
arre << gets.chomp.to_i
puts "Enter the 6th number:"
arre << gets.chomp.to_i

if arre[0..4].include?(arre[-1])
  puts "The number #{arre[-1]} appears in #{arre[0..4]}."
else
  puts "NO"
end