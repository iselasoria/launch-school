=begin
Let's build another program using madlibs. We made a program like this in the easy exercises.
This time, the requirements are a bit different. Make a madlibs program that reads in some text
from a text file that you have created, and then plugs in a selection of randomized nouns, verbs,
adjectives, and adverbs into that text and prints it. You can build your lists of nouns, verbs,
adjectives, and adverbs directly into your program, but the text data should come from a file or
other external source. Your program should read this text, and for each line, it should place
random words of the appropriate types into the text, and print the result.


The challenge of this program isn't about writing your program; it's about choosing how to represent 
your data. Choose the right way to structure your data, and this problem becomes a whole lot easier.
This is why we don't show you what the input data looks like; the input representation is your responsibility.

=end

require 'YAML'

CORPUS = YAML.load_file("/Users/rosasoria/Documents/ft_ls/exercises/rb101-small-problems/advanced-1/corpus.yaml")

random_adjective = CORPUS["word_pool"]["adjectives"].split.sample
random_adverb = CORPUS["word_pool"]["adverbs"].split.sample
random_noun = CORPUS["word_pool"]["nouns"].split.sample
random_verb = CORPUS["word_pool"]["verbs"].split.sample

puts "The #{random_adjective} #{random_noun} #{random_verb} #{random_adverb}."
puts "#{random_verb} the #{random_adjective} yellow"
puts "#{random_noun}, who #{random_adverb} #{random_verb} his #{random_noun} and looks around."

# DONE
