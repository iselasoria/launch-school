=begin 
Create a function that takes in a sentence and returns a running array of consonants per word and vowels per word.
Examples

string_code("Happy Birthday To Me!")
➞ ["4 6 1 1", "1 2 1 1"]

# Consonants - 4 : [H, p, p, y], 6 : [B, r, t, h, d, y], 1: [T], 1 : [M]
# Vowels - 1: [a], 2 : [i, a], 1: [o], 1: [e]

string_code("I'd like to drink my first glass of champagne.")
➞ [ "1 2 1 4 2 4 4 1 6", "1 2 1 1 0 1 1 1 3"]

string_code("The first man to walk on the moon was Neil Armstrong.")
➞ [ "2 4 2 1 3 1 2 2 2 2 7", "1 1 1 1 1 1 1 2 1 2 2" ]

Notes
    Count y as a consonant.
    Capitalization does not matter.
    Only count letters and disregard all other characters (e.g. numbers, punctuation, etc).
    A space between numbers is required (["1 2 3", "4 5 6"] vs. ["1,2,3", "4,5,6"]).



I: string 
O: array of strings 

Rules:
  - return should be two elements long:
    1: the number of consonants per word -> str separated by space
      - contain a total of str.size numbers 
    2: number of vowels per word -> str separated by space
     - contain a total of str.size numbers 

  - capitalization doesnt matter 
  - only count letters 
  - in the case where there only either consonants or vowels, there will be a 0 

Examples:
          "Let them eat cake."
expect: two strings of 4 numbers each 
        "Let them eat cake."
c:        2   3     1   2
v:        1     1   2. 2
return ["2 3 1 2", "1 1 2 2"]

DS:
I: string 
Interm: Array
O: arays 

Algorithm:
- split sentence into `words` 

- init vowels_ct = []
- init cons_ct = []

- iteraete over words 
  - for each word 
    - count vowels and store in vowels_ct
    - count consonants and store in cons_ct
- return a nested array that contains cons_ct and vowels_ct both joined by a space 
=end

def string_code(str)
  str.delete!('^a-zA-Z ')
  words = str.split 
  
  cons_ct = []
  vowels_ct = []

  words.each do |word|
    vowels_ct << word.chars.select {|ch| %w(a e i o u ).include?(ch.downcase)}.size
    cons_ct << word.chars.select {|ch| !%w(a e i o u ).include?(ch.downcase)}.size
  end 

  [cons_ct.join(' '), vowels_ct.join(' ')]
end 

p string_code("I'd like to drink my first glass of champagne.") == ['1 2 1 4 2 4 4 1 6', '1 2 1 1 0 1 1 1 3']
p string_code("The first man to walk on the moon was Neil Armstrong.") == [ '2 4 2 1 3 1 2 2 2 2 7', '1 1 1 1 1 1 1 2 1 2 2']
p string_code("I've got a lovely bunch of coconuts.") == [ '1 2 0 4 4 1 5', '2 1 1 2 1 1 3' ]
p string_code("There they are a'standing in a row.") == [ '3 3 1 6 1 0 2', '2 1 2 3 1 1 1' ]
p string_code("Let them eat cake.") == [ '2 3 1 2', '1 1 2 2' ]
p string_code("It does not matter how slowly you go as long as you do not stop.") == [ '1 2 2 4 2 5 1 1 1 3 1 1 1 2 3', '1 2 1 2 1 1 2 1 1 1 1 2 1 1 1']
p string_code("To be or not to be, that is the question.") == [ '1 1 1 2 1 1 3 1 2 4', '1 1 1 1 1 1 1 1 1 4' ]
p string_code("Believe you can and you're halfway there.") == [ '3 1 2 2 2 5 3', '4 2 1 1 3 2 2' ]