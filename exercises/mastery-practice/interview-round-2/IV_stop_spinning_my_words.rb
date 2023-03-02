=begin 
* DONE 3m0s
Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples:

spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw" 
spinWords( "This is a test") => returns "This is a test" 
spinWords( "This is another test" )=> returns "This is rehtona test"

I: string 
O: string 

Rules:
- string consists of words 
- if a word is more than 5 chars long, it gets reversed 

DS:
arrays

Algorithm:
- split string into words 
- iterate over 
=end 
def spin_words(str)
  words = str.split 

  words.map do |word|
    if word.size >= 5
      word.chars.reverse.join
    else
      word
    end
  end.join(' ')

end

p spin_words("Welcome") == "emocleW"
p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"
