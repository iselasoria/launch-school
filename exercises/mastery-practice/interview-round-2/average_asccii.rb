=begin 
* DONE 15m28s
Each character in the English Alphabet has an ASCII Char Code.

Create a function that converts any word in a given sentence to upper case if the sum of the ASCII codes of the letters in the word is greater than the global average for the sentence. The global average of a sentence is the sum of all the word values divided by the number of words.

For example:
Word  Tell  me  the  time
Sum  401  210  321  431

Since on average, a word in this sentence has a char code sum of 340.75, "Tell" & "time" would be returned capitalised: "TELL me the TIME"

Examples
average_ascii("Tell me the time") ➞ "TELL me the TIME"
# Global Average for char code sum of a word is 340.75

average_ascii("To be or not to be") ➞ "To be or NOT to be"
# Global Average for char code sum of a word is 230.33

average_ascii("Edabit helps you learn in bitesize chunks") ➞ "EDABIT HELPS you learn in BITESIZE CHUNKS"
# Global Average for char code sum of a word is 533.43

Notes
  Do not count whitespace as part of a word.
  There will be no punctuation/special characters in the tests.
  If a word does not meet the capitalisation citeria, don't fully lowercase it ⁠— leave it how it is (i.e. the first words of a sentence should not be fully lowercased if they don't meet the criteria).
  The char code of a capital letter will be different than its lowercase counterpart.
  When you find the global average, it may help to round it to 2 decimal places, then compare against it.

I: string 
O: string 

Rules:
- capitalization matters
- don't accoujt for spaces 
- no special characters 

  - sum all the character ord values in each word 
  - take an average of the entire sentence 
  - come back to the sentence and upcase all the characters in the word that is above the global averate of the sentence 
- leave capitalization as you found it, unless it's obviously capitalized 
- when calculating global average, round to two decimal places

Examples:
input:    "To be or not to be"
ord sum
global_avg is the sum of all word sums over words collection size --> round 2 decimal places 
transform to update capitals 

DS:
strings 
arrays 

Algorithm:
- split string into collection of words words_arr

- iteratet over the words --> transformation store in `word_sums`
  - iterate over its chars to access their ord val -> transofrm 

- calculate global_avg as sum of word_sums / words collection size --> round 2 decimals 

- iterate over word_arr 
  - if word sum is larger than the global ave, upcase all 
  - otherwise, leave as i found it 

  - join words_arr with space and return 
=end 
def average_ascii(str)
  words_arr = str.split 

  word_sums = words_arr.map do |word| # Edabit 
                word.chars.map do |ch| # E
                  ch.ord
                end.sum
              end
  global_average = ((word_sums.sum).to_f / (words_arr.size).to_f).round(2)

  words_arr.map.with_index do |word, idx|
    if word_sums[idx] > global_average
      word.upcase 
    else
      word
    end 
  end.join(' ')
end 

p average_ascii("Edabit helps you learn in bitesize chunks") == "EDABIT HELPS you learn in BITESIZE CHUNKS"
p average_ascii("To be or not to be") == "To be or NOT to be"
p average_ascii("What you egg") == "WHAT you egg"
p average_ascii("Made by Harith Shah") == "Made by HARITH Shah"
p average_ascii("Boom") == "Boom"
p average_ascii("The most addictive way to learn") == "The most ADDICTIVE way to LEARN"