=begin 
* DONE 7m
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

=end

def double_consonants(str)
  result = ''

  str.chars.each do |letter|
    if !%(a e i o u A E I O U - ! 4).include?(letter)
      result << letter << letter
    else
      result << letter
    end
  end
  result
end
# test cases
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""