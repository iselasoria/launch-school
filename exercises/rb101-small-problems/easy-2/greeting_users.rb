=begin
write a program that will ask for user's name. The program will then greet the user. If the user
write "name!" the computer yells back at the user.
=end

puts "What is your name?"
name = gets.chomp

if name.include?("!")
  name = name.chop
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING!"
else
  puts "Hello #{name}."
end