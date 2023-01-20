=begin
* DONE 25m
https://www.codewars.com/collections/636cb9ba2aae8f0031a347f9
Given a lowercase string that has alphabetic characters only and no spaces, return the highest value of consonant substrings. Consonants are any letters of the alphabet except "aeiou".

We shall assign the following values: a = 1, b = 2, c = 3, .... z = 26.

For example, for the word "zodiacs", let's cross out the vowels. We get: "z  d  cs"

-- The consonant substrings are: "z", "d" and "cs" and the values are z = 26, d = 4 and cs = 3 + 19 = 22. The highest is 26.
solve("zodiacs") = 26

For the word "strength", solve("strength") = 57
-- The consonant substrings are: "str" and "ngth" with values "str" = 19 + 20 + 18 = 57 and "ngth" = 14 + 7 + 20 + 8 = 49. The highest is 57.
For C: do not mutate input.

I: string 
O: integer 

Rules:
- each letter has a value according to its position in the alphabet a=1. b=2, c=3...
- we need to remove vowels 
- we nedd to find substrings (of only consonants)


Examples:
input:      "zodiacs"
consonants: "z  d  cs"
consonant_subs: "z","d","cs"
values: z = 26, d = 4 and cs = 3 + 19 = 22. The highest is 26.
return: solve("zodiacs") = 26

Data Structures: 
I: srting 
Interim: 
- nested array of substrings 
- hash object containing letters and their values 
O: integer 

Algorithm:
Helper Method: gen_subs(str)
- generate substrings containing only consonants

Main Method: solve(arr)
- make a call to gen_subs(arr) and store in `susb`
- make a hash with letters and values
- iterate over the substrings array #=> "z","d","cs"
  - iterate over the characters in each chunk 
    - access their values and sum them 
  - retrieve and return the highest sum of the chunks
=end

def gen_subs(str)
  subs = []
  (0...str.size).each do |starting|
    (starting...str.size).each do |ending|
      slice = str[starting..ending]
      subs << slice
    end
  end
  subs.select do |sub|
    sub.chars.all? {|letter| !%(a e i o u).include?(letter)}
  end
end


def solve(str)
  subs = gen_subs(str)

  alphabet = ("a".."z").to_a.zip(1..26).to_h

  subs.map do |chunk|
    chunk.chars.map {|ch| alphabet[ch]}.sum
  end.max

end

p solve("zodiac") ==26
p solve("chruschtschov") ==80
p solve("khrushchev") ==38
p solve("strength") ==57
p solve("catchphrase")== 73
p solve("twelfthstreet")==103
p solve("mischtschenkoana")==80
