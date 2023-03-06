=begin 
* DONE 07m37s
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

Examples:
weirdcase( "String" )#=> returns "StRiNg"
weirdcase( "Weird string case" );#=> returns "WeIrD StRiNg CaSe"


I: string 
O: string 

Rules:
- even index is to be upercase 
- odd index is to be lowercase 
- only alphabetical characters
- single spaces separate the word 

Examples:
'This is a test' 
 ulul ul u ulul 
 ThIs Is A TeSt 

 DS: 
 strings 
 arrays--> index 
 
Algorithm:
- split string into words `words_arr`
- iterate over words_arr
  - for each word, iterate over its chars and index 
    - if even, upercase 
    - if odd, downcase 
  return words Array joined by space 
=end 

def weirdcase(str)
  words_arr = str.split 

  words_arr.map do |word|
    word.chars.map.with_index do |ch, idx|
      idx.even? ? ch.upcase : ch.downcase
    end.join
  end.join(' ')
end

# test cases 

p weirdcase('This') == 'ThIs'
p weirdcase('is') == 'Is'
p weirdcase('This is a test') == 'ThIs Is A TeSt'
