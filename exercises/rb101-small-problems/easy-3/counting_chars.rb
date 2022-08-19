# write a program that will ask a user for an input of a word or multiople words and give back
# the number of characters, ignoring spaces in the tally.

puts "Enter a word or sentence: "
original = gets.chomp
counter_chars = original.delete(' ').size

puts "There are #{counter_chars} characters in '#{original}'"