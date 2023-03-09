=begin 
* DONE 21
Given a letter, created a function which returns the nearest vowel to the letter. If two vowels are equidistant to the given letter, return the earlier vowel.
Examples

nearest_vowel("b") ➞ "a"
nearest_vowel("s") ➞ "u"
nearest_vowel("c") ➞ "a"
nearest_vowel("i") ➞ "i"

Notes
  All letters will be given in lowercase.
  There will be no alphabet wrapping involved, meaning the closest vowel to "z" should return "u", not "a".

I: string 
O: string 

Rules:
- if input a vowel return input string 
- return the closes vowel 
- equidistant vowels, return first 

DS: 
I: string 
Interm: string and numbers 
O: string 

Algorithm:
- zip position with alpha and store in `alphabet_positions`
  - init an alphabet variable to hold a-z range 
  - transform alphabet into position 

init diffs_arr = []
- iterate over teh alphabet_positions
  - skip if letter is not a vowel
  - calculate diference as current position - input position 
  - push diff and current char to diffs_arr as a tiny arr 

- find minimum of diffs_arr
- return only the character 
=end

def nearest_vowel(str)
  # return str if %w(a e i o u).include?(str)
  alphabet_positions = ('a'..'z').zip(1..26).to_h

  diffs_arr = []
  alphabet_positions.each do |letter, position|
    next if !%w(a e i o u).include?(letter)
    diff = (position - alphabet_positions[str]).abs # position of vowel - position of input string 
    diffs_arr << [diff, letter]
  end
  p diffs_arr
  diffs_arr.min_by{|item| item[0]}[1]

end

p nearest_vowel("a") == "a"
p nearest_vowel("e") == "e"
p nearest_vowel("i") == "i"
p nearest_vowel("o") == "o"
p nearest_vowel("u") == "u"
p nearest_vowel("b") == "a"
p nearest_vowel("c") == "a"
p nearest_vowel("d") == "e"
p nearest_vowel("f") == "e"
p nearest_vowel("g") == "e"
p nearest_vowel("h") == "i"
p nearest_vowel("j") == "i"
p nearest_vowel("k") == "i"
p nearest_vowel("l") == "i"
p nearest_vowel("m") == "o"
p nearest_vowel("n") == "o"
p nearest_vowel("p") == "o"
p nearest_vowel("q") == "o"
p nearest_vowel("r") == "o"
p nearest_vowel("s") == "u"
p nearest_vowel("t") == "u"
p nearest_vowel("v") == "u"
p nearest_vowel("w") == "u"
p nearest_vowel("x") == "u"
p nearest_vowel("y") == "u"
p nearest_vowel("z") == "u"