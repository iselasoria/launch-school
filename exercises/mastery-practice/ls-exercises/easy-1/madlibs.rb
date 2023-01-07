=begin 
Mad libs are a simple game where you create a story template with blanks for words. 
You, or another player, then construct a list of words and place them into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

Example: 
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

=end 

puts "Give me a noun: "
noun = gets.chomp
puts "Now give me a verb: "
verb = gets.chomp 
puts "Enter and adverb: "
adverb = gets.chomp 
puts "Now enter an adjective: "
adj = gets.chomp 

puts "Does your #{noun} #{verb} #{adverb}? That is so #{adj}."
