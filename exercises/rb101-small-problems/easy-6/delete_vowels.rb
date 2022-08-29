=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes an array of stringsd, and returns an array of 
the same string avaluies, except the vowels a,e,i,o,u. 
--------------------------PROBLEM----------------------------------------
Questions: is the array being returned the same as the input array or is 
it a new object altogether?
Input: array of strings
Output: an array of the same string values without the vowels
---------------------------RULES-----------------------------------------
Explicit: remove all the vowels in the input array
Implicit: 
--------------------------EXAMPLES---------------------------------------
=end
input_arr = %w(rosa)
VOWELS = %w(A E I O U a e i o u)


# input_arr.each do |word|
#   word.chars.delete_if do |letter|
#     letter.include?(VOWELS)
#   end
#   # word.chars.delete_if do |letter|
#   #   letter.include?(vowels)
#   # end
# end
# ----------------------------ALGO----------------------------------------
def remove_vowels(strings)
  strings.map do |word|
    p word.delete('AEIOUaeiou')
  end
end
# test cases

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']