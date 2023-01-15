=begin 
* DONE 21m 
  TODO Interview Practice

Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, 
write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
If one or more non-alphabetic characters occur in a row, you should only have one space in the 
result (the result should never have consecutive spaces).

Rules:
- non-alphabetic characters get replaced by spaces
- if two or more special chars appear in a row, we only want one space


Algorithm:
- initialize an alphabet list
- initialize a results string 

- iterate over the input string
  - push character if it is found in the alphabet
  - if it is not, push a space unless the previous character was also not found 

=end 

def cleanup(str)
  alphabet = ('a'..'z').to_a

  results = ''

  str.chars.each_with_index do |ch, idx|
    if alphabet.include?(ch)
      results << ch 
    else
      results << ' ' unless results[-1] == ' '
    end
  end
  results
end

# test cases 
p cleanup("---what's my +*& line?") == ' what s my line '