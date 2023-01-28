# *ALGORITHM*
# -Initialize new string to empty string.
# -Iterate through the chars of the alphabet.
#   -On each iteration:
#     -Iterate through the chars of the input string. 
#     -On each iteration: 
#       -If the current char (lower or uppercase) is equal to the current alphabet char 
#         -Add it to the new string 
# -Return new string 

=end 

def alphabetized(str)
  alphabet = ('a'..'z').to_a 
  
  alphabet.each_with_object([]) do |alpha_char, new_str| # a A
    str.chars.each do |str_char|
      if str_char == alpha_char || str_char == alpha_char.upcase
        new_str << str_char
      end 
    end 
  end.join

end 