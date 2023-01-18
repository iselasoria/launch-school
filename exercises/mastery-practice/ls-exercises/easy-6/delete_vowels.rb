=begin 
* DONE 6m
* Interview Prep
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.


I: array 
O: array 
Rules:
- remove vowels a e i o u 
- vowels of both upcase and downcase get removed 

Algorithm:
- Iterate over the input array 
- with each word
  - set word to the retrun of delete vowels
=end 

def remove_vowels(arr)
  vocal = %(a e i o u A E I O U)
  clean_arr = []

  arr.each do |word|
    clean_word = []
    word.chars.each do |ch|
      clean_word << ch if !vocal.include?(ch)
    end
    clean_arr << clean_word.join
  end
  clean_arr
end

# test cases 
p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']