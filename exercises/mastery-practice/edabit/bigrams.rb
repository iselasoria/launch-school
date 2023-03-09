=begin 
* DONE 18m04s
You are given an input array of bigrams, and an array of words.

Write a function that returns true if every single bigram from this array can be found at least once in an array of words.

Examples
can_find(["at", "be", "th", "au"], ["beautiful", "the", "hat"]) ➞ true
can_find(["ay", "be", "ta", "cu"], ["maybe", "beta", "abet", "course"]) ➞ false
# "cu" does not exist in any of the words.

can_find(["th", "fo", "ma", "or"], ["the", "many", "for", "forest"]) ➞ true

can_find(["oo", "mi", "ki", "la"], ["milk", "chocolate", "cooks"]) ➞ false

Notes
  A bigram is string of two consecutive characters in the same word.
  If the array of words is empty, return false.

  I: two arrays 
  O: boolean 

  Rules:
  - arg1 -> array of bigrams 
  - arg2 -> array of words 

  - bigrams are string of two consecutive chars 
  - if array of words (arg2) is empty, return false 

  - return true if all of the bigrams can be found in at least one word 

Examples:
["ay", "be", "ta", "cu"] and ["maybe", "beta", "abet", "course"]
ay -> maybe 
be-> maybe 
ta-> beta 
cu -> NOT FOUND 

DS:
two arrays 


Algorithm:
- return false if there are no words 

- init word_bigrams = []
- iterate over the Array of words 
  - for each word 
    - gen consecutive bi grams and push to word_bigrams
- transform to join the tiny arrays 

- check if all the input bigrams are present in the word_bigrams, true if so, false if not 
=end 

def can_find(input_bigrams, words)
  return false if words.empty?

  word_bigrams = []

  words.each do |word|
    word_bigrams << word.chars.each_cons(2).to_a
  end
  word_bigrams.map! { |item| item.map(&:join)}

# p input_bigrams
# p word_bigrams

  input_bigrams.all? do |pair| 
    # p pair
    # p word_bigrams.flatten
     word_bigrams.flatten.include?(pair)
  end
end


p can_find(["at", "be", "th", "au"], ["beautiful", "the", "hat"]) == true
p can_find(["bo", "ta", "el", "st", "ca"], ["books", "table", "cap", "hostel"]) == true
p can_find(["la", "te"], ["latte"]) == true
p can_find(["th", "fo", "ma", "or"], ["the", "many", "for", "forest"]) == true
p can_find(["ay", "be", "ta", "cu"], ["maybe", "beta", "abet", "course"]) == false
p can_find(["oo", "mi", "ki", "la"], ["milk", "chocolate", "cooks"]) == false
p can_find(["la", "at", "te", "ea"], ["latte"]) == false

p can_find(["la"], []) == false