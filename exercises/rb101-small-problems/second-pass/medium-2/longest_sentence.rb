=begin 
Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

HINT: 
sentences = text.split(/\.|\?|!/)

Input: string 
Output: print and integer representing the number of words int he longest sentence 

Rules:
- periods, exclamation points, questions marks end a sentence. 
  - all else will be treated as a word 

Examples / Model Solution:
"This is the first sentence! That exclamation point marked the ending of that sentence. That period marked the second. Does this make sense now?"
sentence 1: "This is the first sentence!" --> 5
sentence 2: "That exclamation point marked the ending of that sentence" --> 9
sentence 3: "That period marked the second." --> 5
sentence 4: "Does this make sense now?" --> 5

** this wiull output 9, since that is the sentence with the most words in it.

Data: 
- in: str 
- interim: arrays 
- out: print longest sentence 

Algorithm:
- split the text using regex and store in `sentences_arr`
- iterate over the array of arrays, each element is a sentence 
  - get the size of each sentence 
- return the maximum of all the Sentences
=end 

# p paragraph.map do |sentence|
#   sentence.size
# end.max

paragraph = "Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth."

corpus = paragraph.split(/\.|\?|!/)
sentence_len = corpus.map do |sentence|
                sentence_arr = sentence.split(" ")
                  sentence_arr.size
                end
                p sentence_len.max

# longest sentence should be 86 words long 