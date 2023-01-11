=begin
* DONE 6m
Write a program that will ask for user's name. 
The program will then greet the user. If the user writes "name!" 
then the computer yells back to the user.

Examples:
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

=end 


puts "What is your name? "
name = gets.chomp

puts(name.chars.include?('!') ? "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"  : "Hello, #{name}.")
