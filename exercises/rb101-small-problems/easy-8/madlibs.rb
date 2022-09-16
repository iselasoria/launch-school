=begin
-----------------------INSTRUCTIONS--------------------------------------
Mad libs are a simple game where you create a sotry template with blanks
for words. You, or another player, then construct a list of words and
place them into the story, creating an often silly or funny story.
Create a simple mad-lib program that prompts for a noun, a verb an adverb,
and an adjective and injects those into a soty that you create.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string inputs for the following:
- a noun
- a verb
- an adjective
- an adverb

Output: string
- interpolation using the previous inputs
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

=end
# ----------------------------ALGO---------------------------------------
def prompt(msg)
  puts "#{msg}"
end

prompt("Enter a noun: ")
noun = gets.chomp

prompt("Enter a verb: ")
verb = gets.chomp

prompt("Enter an adjective: ")
adjective = gets.chomp

prompt("Enter an adverb: ")
adverb = gets.chomp

sentence1 = "You #{verb} your #{noun} #{adverb}. That's #{adjective}"
sentence2 = "Please, don't #{verb} the #{noun}, it #{adverb} feels #{adjective}."
sentence3 = "This #{noun} does not #{verb} #{adverb}, how #{adjective}!"

puts [sentence1, sentence2, sentence3].sample

# * DONE