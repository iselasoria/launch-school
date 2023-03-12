=begin 
* DONE 19m42s
Each letter in a sentence is worth its position in the alphabet (i.e. a = 1, b = 2, c = 3, etc...). However, if a word is all in UPPERCASE, the value of that word is doubled.

Create a function which returns the value of a sentence.

get_sentence_value("abc ABC Abc") ➞ 24
# a = 1, b = 2, c = 3

# abc = 1 + 2 + 3 = 6
# ABC = (1+2+3) * 2 = 12 (ALL letters are in uppercase)
# Abc = 1 + 2 + 3 = 6 (NOT ALL letters are in uppercase)

# 6 + 12 + 6 = 24

Examples
get_sentence_value("HELLO world") ➞ 176
get_sentence_value("Edabit is LEGENDARY") ➞ 251
get_sentence_value("Her seaside sea-shelling business is really booming!") ➞ 488

Notes
  Ignore spaces and punctuation.
  Remember that the value of a word isn't doubled unless all the letters in it are uppercase.

  I: string 
  O: integer 

  Rules:
  - each letter is worth its position in the alphabet 
  - the value of the word is doubled when letters are all caps 
  - if only proper capitalization--> just treat it as lowercase 
  - add up all the 
  - special characters and punctuation are ignored and return 0
  - empty stings also return 0 


  Examples:
                      "HELLO world"
  find value of word   double single sum 

  DS:
  string 
  arrays 
integers 

Algorithm:
- empty string returns 0 

- delete all but a-zA-Z adn ' '
- init alphabet_values to hold letters and positions 
- split the string by the space words_arr 

- iterate over the words_arr # transformed [12,455,76]
  - for each word 
    - iterate over teh characters 
      - retrieve the values from the alphabet_values (added value of the word )
    - if word is upcased, then multiply the sum by 2
  - take the sum of the transformed words_arr
=end


def get_sentence_value(str) 
  alphabet_values = ('a'..'z').to_a.zip(1..26).to_h # rememeber to search for downcase 

  str.delete!('^a-zA-Z ')
  
  return 0 if str.empty?

  words_arr = str.split

  words_arr.map do |word|
    ch_sum = word.chars.map do |ch|
        alphabet_values[ch.downcase]
      end.sum
    if word == word.upcase 
      # double returb
      ch_sum * 2
    else
      ch_sum
    end 
  end.sum
end


p get_sentence_value("abc ABC Abc") == 24
p get_sentence_value("HELLO world") == 176
p get_sentence_value("Edabit is Legendary") == 160
p get_sentence_value("Her seaside sea-shelling business is really booming!") == 488
p get_sentence_value("edabit Edabit EDABIT") == 164
p get_sentence_value("expensive words") == 198
p get_sentence_value("FISH AND CHIPS") == 232
p get_sentence_value("this sentence is like a piece of hay in a needle stack") == 423
p get_sentence_value("CAN YOU STOP SHOUTING?! I CAN'T HEAR MYSELF THINK!!!") == 966
p get_sentence_value("a whisper in the wind...") == 205
p get_sentence_value("Isn't it funny how the word BIG is physically smaller than the word small?") == 777
p get_sentence_value("this is a really pricey sentence: ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ") == 2503
p get_sentence_value("Oranges and APPLES") == 236
p get_sentence_value("Edabit is LEGENDARY") == 251

p get_sentence_value(",.;[,.;][,.;[,.][,.;,.][") == 0
p get_sentence_value("                    ") == 0
p get_sentence_value("") == 0