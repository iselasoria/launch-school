=begin 
* DONE 11m35s new way | old way: 03m07s
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

I: string 
O: integer 

Rules:
- return the legnth of the longest vowel substring 
- vowels a e i o u 

Examples:
'codewarriors'
  o e a  io

DS:
- string 

Algorithm:
- gsub all the consonants with a space 
- split by space 
- return the size of the longest 

=end 

def solve(str)
  consonants = ('a'..'z').to_a - %w(a e i o u)

  str.gsub!(/(#{consonants})/, " ")
  
  arr = str.split

  arr.max_by {|item| item.size}.size
 
end

# old way * DONE 03m07s
def solve(str)
  vocales = %w(a e i o u)

  subs = []
  (0..str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      # only push if all vowels 
     subs << slice if slice.chars.all? {|item| vocales.include?(item)}
    end
  end
  subs.max_by {|item| item.size}.size
end

# test cases 
p solve("codewarriors") == 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8
