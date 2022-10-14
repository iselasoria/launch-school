
# ! 7 kyu 
=begin
-----------------------INSTRUCTIONS-----------------------------------
The vowel substrings in the word `codewarriors` are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.
--------------------------PROBLEM-------------------------------------
Questions: do we account for uppercase letters too?
Input: string
Output: integer
---------------------------RULES--------------------------------------
Explicit: 
- alpha characters only: vowels and consonants
- no spaces
- return must be the length of the longest vowel substring
Implicit: 
--------------------------EXAMPLES------------------------------------
"codewarriors" ==> o,e,a,io
The longest substring length is 2

"suoidea" ==> u, uo, uoi, e, ea
The longest substring length is 3
----------------------------ALGO--------------------------------------
- helper method for substrings
  - initialize a variable to hold vowels
  - filters for only substrings where every character is a vowel
- substrings.max to get the longest substring 
- return the longest substring
=end

VOWELS = ['a','e','i','o','u']
def sub(str)
  index = (0..str.length - 1).to_a
  possible_index = index.product(index)

  only_valid_ranges = possible_index.reject do |start_idx, end_idx|
                        start_idx > end_idx
  end

  substrings = only_valid_ranges.map do |starting, ending|
    str[starting..ending]
  end

  vowel_subs = []


  substrings.map do |sub|
    sub.chars.each do |letter|
      if letter.match(/[aeiou]/)
        vowel_subs << sub
      end
    end
  end
  result = vowel_subs.keep_if do |suby|
    suby.chars.all? {|letter| VOWELS.include?(letter)}
  end
  result.map {|item| item.length}.max
end

p sub("codewarriors")

p sub("codewarriors") == 2
p sub("suoidea") == 3
p sub("iuuvgheaae") == 4
p sub("ultrarevolutionariees") == 3
p sub("strengthlessnesses") == 1
p sub("cuboideonavicuare") == 2
p sub("chrononhotonthuooaos") == 5
p sub("iiihoovaeaaaoougjyaw") == 8


# * DONE