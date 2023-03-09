=begin 
* DONE 15m46s
The weight of an English word can be calculated by summing the ASCII code point for each character in the word, excluding any punctuation:

"Wouldn't" = 87 + 111 + 117 + 108 + 100 + 110 + 116 = 749

Write a function that takes a sentence as a string, returning true if all word weights increase for each word in the sentence, and false if any word weight decreases or remains the same.
Examples

increasing_word_weights("Why not try?") ➞ true
# 312 -> 337 -> 351 (weights increase)

increasing_word_weights("All other roads.") ➞ false
# 281 -> 546 -> 537 (537 is less than 546)

I: string 
O: boolean 

Rules:
- special characters get ignored 
- capitalization matters! 
- the weight:
  - the sum of its characters' ordinal values on the ASCII table 

Goal: return true if the weight of words in consistently increasing throughout the Array

Examples:
"Can you just leave?"
 (67 + 97 + 110) () () ()....

 returns true if all 
  - the current is smaller than the next 

DS: 
I: string 
Interim: Arrays 
O: boolean 

Algorithm:
- delete special chars 

- init a weights_arr = []

- iterate over the words (split by space) # Why ---> transform arr??
  - with each iteration 
    - iterate over chars 
      - call ord on each letter this becomes the new arr val 
      - sum 

- check that all the weights are in incraesing order 
  - weights.sort is the same as weights_arr, true if so 

=end 

def increasing_word_weights(str)
  str = str.delete('^a-zA-Z ')

  weights_arr = str.split

  weights_arr.map! do |word|
    word.chars.map {|ch| ch.ord}.sum
  end
  weights_arr.sort == weights_arr
end 

p increasing_word_weights("Why not try?") == true
p increasing_word_weights("Face your fears, never settle.") == true
p increasing_word_weights("DON'T SHOUT!") == true
p increasing_word_weights("Can you just leave?") == true
p increasing_word_weights("You will push ahead, creating solutions!") == true
p increasing_word_weights("All that money doesn't guarantee happiness.") == true
p increasing_word_weights("Full steam ahead!") == false
p increasing_word_weights("Not all those who wander are lost.") == false
p increasing_word_weights("All other roads.") == false
p increasing_word_weights("Whatever you are, be a good one.") == false
p increasing_word_weights("Standing on the shoulders of giants.") == false
p increasing_word_weights("You get what you settle for.") == false
p increasing_word_weights("Inconceivable!") == true