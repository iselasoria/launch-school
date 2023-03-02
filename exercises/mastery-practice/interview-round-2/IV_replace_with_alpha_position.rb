=begin 
* DONE 10m34s
In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" ( as a string )

Rules:
- ignore special chars 
DS: 
hash to store letter and position 

Algorithm:
- make a hash with numbers(position) as keys adn letters as values 
- init result = ''
- iter over the characters in the string
  - retrieve the number at the letter in the hash (look for lowercase)
  - dump into result
- return result 

=end 

def alphabet_position(str)
  return '' if str.chars.none? {|i| ('a'..'z').include?(i)}

  alpha_hash = ('a'..'z').zip('1'..'26').to_h

  result = ''
  str.each_char do |ch|
    next if !('a'..'z').include?(ch.downcase)

    result <<  alpha_hash[ch.downcase] << ' '
  end
  result.strip!
end

# test cases 

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
