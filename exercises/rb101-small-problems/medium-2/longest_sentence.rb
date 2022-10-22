=begin
Write a program that erads the contest of a text fiole and then prints the longest sentnce in the
file based on number of words. Sentences may end with periods (.). exclamation points (!), or question marks. 
Any sequence of characters that are not spaces or sentence-ending characters shouod be treated as a word.
You shold also print the number of words in the longest sentence.


------------P
Input: a collection of text. String
output: longest sentence in the text, and the number of words in the sentence

Goal: identify every sentence and its length of words, compare it to every other sentence.

------------E
Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and
proper that we should do this. 
  |
  -----> 27 ----> We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live.


------------A
- split the collection of text into sentences using regex ---> (/\.|\?|!/) and save it into a new collection
- initiate an empry array object that will hold the longest sentence--> longest_sentence
  - iterate over the sentences collection
    - if current sentence in the iteration is longer than the longest_sentence array
      - longest_sentence array is now equal to the current sentence in the iteration

- output the longest sentence
- output the number of words in the longest sentence collection


=end

text_collection = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created equal.

Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure.
We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for 
those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.

But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."



sentences_collection = text_collection.split(/\.|\?|!/)

longest_sentence = []
words_collection = []


sentences_collection.each do |sentence|

  words_collection = sentence.split(' ')
  if words_collection.size >  longest_sentence.size
    longest_sentence = words_collection
  end
end

puts "This is the longest: #{longest_sentence.join(' ')}"

puts "It contains #{longest_sentence.size} letters"

# DONE