=begin
Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters. 

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are separatedseperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata punctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation

for reference: http://en.wikipedia.org/wiki/Typoglycemia


I: string 
O: string 

Rules:
- first and last characters remain in the same place 
- chracters in between first and last get sorted alphabetically
- punctuation remains in the same place 
  - limited to:
    "." "'" "-" ","
- only spaces separate words 
- capitalization doesn't matter 
- empty string returns an empty string 
- strings with a size of 2 chars or less return the string itself 


Examples:
- 'professionals'
   _rofessional_
   paefilnoorsss
- "me"
  "me"

- 'card-carrying'
   _ard-carryin_
  'caac-dinrrryg'


Data Structures:
I: string 
Interim: arrays / hash 
O: string

Algorithm:
- if input string size is less than 3, return the string 
- iterate over string and sore in a new hash `special_hash` each position in original string

- iterate over the input string split by spaces 
  - with every word 
    - delta_word = ''
    - define chars_to_change as word at index 1 up to second to last index
    - sort the characters in chars_to_change
    - concatenate first char with chars_to_change and last character in the word 
      - push the new concatenated string into delta_word # p + aefilnoorss + s ---> paefilnoorsss
  - store transformed array into `words_transformed` ---> string 

  - iterate over words_transformed ___string___
    - from special_hash[index] insert the value into the specified index 
=end

def scramble_words(str)
  return str if str.size < 3

  special_hash = {}

  str.chars.each_with_index do |ch, idx|
    if !('a'..'z').include?(ch)
      special_hash[idx] = ch
    end
  end

  words_arr = str.delete('^a-z ').split


  word_transformed = words_arr.map do |word|
    # p word
    delta_word = ''
    chars_to_change = word[1...-1]
    delta_word << word[0] + chars_to_change.chars.sort.join + word[-1]
  end.join

  special_hash.each do |idx, special_char|
    word_transformed.insert(idx, special_char)
  end

  word_transformed
end

#####

# def insert_special_char(hash, str)
#   hash.each do |k, v|
#     # puts k 
#     # puts v
#     str = str.insert(k, v) # "you've"
#   end
#   str
# end

# hash = {4 => '.'}
# str = 'dbca'

# p insert_special_char(hash, str)

# def scramble_words(str)
#   return str if str.size < 4
#   clean_char_array = []

#   str.split.each do |word|
#     special_char_hash = {}
#     clean_string = ''
#     word.chars.each_with_index do |char, idx|
#       if ('a'..'z').to_a.include?(char)
#         clean_string << char
#       elsif ["-", ",", "'", "."].include?(char)
#         special_char_hash[idx] = char
#       end
#     end
    
#     clean_string = clean_string[0] + clean_string[1..-2].chars.sort.join + clean_string[-1]

#     clean_char_string = insert_special_char(special_char_hash, clean_string)
#     clean_char_array << clean_char_string
#   end

#   clean_char_array.join(' ')
  
#   # p special_char_hash
#   # clean_string
# end

p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'

p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
p scramble_words("she's bliss antediluvian a, he's she's. think pulchritudinous") #== "seh's bilss aadeiilntuvn a, he's seh's. think pcdhiilnortuuus"

"seh's bilss aadeiilntuvn a, he's seh's. think pcdhiilnortuuus" # codewars
"seh's bilss aadeiilntuvn a, ah'e sse'h. sthin kpcdhiilnortuuus" # mine 