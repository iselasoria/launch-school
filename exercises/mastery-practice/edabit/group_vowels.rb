=begin 
* DONE 22m00s
Write a function that takes in a word and splits the consonants one by one, but keeps the vowels in a cluster.

Examples
split("beautifully") ➞ ["b", "eau", "t", "i", "f", "u", "l", "l", "y"]

split("spoonful") ➞ ["s", "p", "oo", "n", "f", "u", "l"]

split("swimming") ➞ ["s", "w", "i", "m", "m", "i", "n", "g"]

Notes
Vowels are: a, e, i, o, u.
All letters will be in lower case.

I: string 
O: array 

Rules:
- vowels stick together, in a substring 
- consonants get split up 
Implicit Rule"
  - single vowels are split just like consonants, they have nothing to stick to 

Example: 
input: 'beautifully'
         eau i u 

DS:
I: string 
Interim: array 
O: array 

Algorithm:

- init an empty array `results`


- iterate over the input string's characters 
- init vowel_chunk to ''

  - if consonant, push to results 
  - if vowel, hold in a temp variable `vowel_chunk`
  - when I find a non-vowel again, push vowel_chunk to results array 
  - reset vowel_chunk

- return results array 
=end 

def split(str)
  results = []
  
  vowel_chunk = ''
  str.chars.each do |ch| # b e a u t
    if %(a e i o u).include?(ch)
      vowel_chunk << ch # e a u
    else
      results << vowel_chunk
      vowel_chunk = ''
      results << ch
    end
  
    
  end 
  results << vowel_chunk
  results.select {|s| !s.empty?}
end

# test cases 
p split("beautifully") == ["b", "eau", "t", "i", "f", "u", "l", "l", "y"]
p split("spoonful") == ["s", "p", "oo", "n", "f", "u", "l"]
p split("swimming") == ["s", "w", "i", "m", "m", "i", "n", "g"]
p split("courage") == ["c", "ou", "r", "a", "g", "e"]
p split("cooing") == ["c", "ooi", "n", "g"]