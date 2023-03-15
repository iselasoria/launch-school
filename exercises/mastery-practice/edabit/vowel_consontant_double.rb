=begin 
Write two functions:

    One to retrieve all unique substrings that start and end with a vowel.
    One to retrieve all unique substrings that start and end with a consonant.

The resulting array should be sorted in lexicographic ascending order (same order as a dictionary).
Examples
get_vowel_substrings("apple")
➞ ["a", "apple", "e"]

get_vowel_substrings("hmm") ➞ []

get_consonant_substrings("aviation")
➞ ["n", "t", "tion", "v", "viat", "viation"]

get_consonant_substrings("motor")
➞ ["m", "mot", "motor", "r", "t", "tor"]

Notes

    Remember the output array should have unique values.
    The word itself counts as a potential substring.
    Exclude the empty string when outputting the array.

I: array 
O: array 

Rules:
- two methods:
  - one for susbtrings taht end and start with vowels 
  - one for substrings taht end and start with consontants 
  - if there are none, return empty array 
  - dont include emprty substrings 
  - word can be a substring 

Examples:
"apple"
vowel_padded        consonant_padded 
a                   p
apple               pp 
e                   ppl 
                    pl 
                    l 

DS:
- I: string
Interim: array  
O: arrays 

Algorithm:
vowels:
- init subs array to empty Array
  - iterate from start to edn of the string and set moving idx 
    - iterate from movind index to end of string and set another moving index 
      - define a slice from start to end using the moving indexes 
      - only push to substring array if the slice both ends and starts with a vowel 

consonant:
- init subs array to empty Array
  - iterate from start to edn of the string and set moving idx 
    - iterate from movind index to end of string and set another moving index 
      - define a slice from start to end using the moving indexes 
      - only push to substring array if the slice both ends and starts with a consonant 
=end 


def get_vowel_substrings(str)
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      subs << slice if %w(a e i o u).include?(slice.chars.first) && %w(a e i o u).include?(slice.chars.last)
    end   
  end
  subs.sort.uniq
end 

def get_consonant_substrings(str)
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice = str[st..nd]
      subs << slice if !%w(a e i o u).include?(slice.chars.first) && !%w(a e i o u ).include?(slice.chars.last)
    end 
  end
  subs.sort.uniq
end

p get_vowel_substrings("apple") == ["a", "apple", "e"]
p get_vowel_substrings("carrot") == ["a", "arro", "o"]
p get_vowel_substrings("aviation") == ["a", "ati", "atio", "avi", "avia", "aviati", "aviatio", "i", "ia", "iati", "iatio", "io", "o"]
p get_vowel_substrings("motor") == ["o", "oto"]
p get_vowel_substrings("rhyme") == ["e"]
p get_vowel_substrings("hmm") == []

p get_consonant_substrings("apple") == ["l", "p", "pl", "pp", "ppl"]
p get_consonant_substrings("carrot") == ["c", "car", "carr", "carrot", "r", "rot", "rr", "rrot", "t"]
p get_consonant_substrings("aviation") == ["n", "t", "tion", "v", "viat", "viation"]
p get_consonant_substrings("motor") == ["m", "mot", "motor", "r", "t", "tor"]
p get_consonant_substrings("rhyme") == ["h", "hy", "hym", "m", "r", "rh", "rhy", "rhym", "y", "ym"]
p get_consonant_substrings("hmm") == ["h", "hm", "hmm", "m", "mm"]