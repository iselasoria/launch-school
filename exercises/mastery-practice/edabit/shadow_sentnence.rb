=begin 
* DONE 21m09s
Given two sentences, return whether they are shadows of each other. This means that all of the word lengths are the same, but the corresponding words don't share any common letters.

Examples
shadow_sentence("they are round", "fold two times") ➞ true

shadow_sentence("own a boat", "buy my wine") ➞ false
# No words share common letters, but "a" and "my" have different lengths.

shadow_sentence("his friends", "our company") ➞ false
# Word lengths are the same but "friends" and "company" share the letter "n".

shadow_sentence("salmonella supper", "birthright") ➞ false
# Setences with different numbers of words.

Notes
    All sentences will be given in lowercase, and will have no punctuation.
    Return false if the sentences have different numbers of words.

I: string 
O: boolean 

Rules:
- two sentences are shawdows of eachother if:
  - they have the number of words 
    - those words are the same length 
    - words don't share any characters 

- if the sentences are the same return false 

Examples:
    'impossible poetry' |  'gargantuan cliffs'
len:      2                           2 
w_z:  10         6               10         6
if all above is true, and not overlap of characrers, then true 

  DS:
  I: string 
interm: arrays 
  O: bolean 

  Algorithm:
  - count the number of words (split) if not the same return false 

  - zip words to eachoter 

  - iterate over the words again 
    - each word size should match 
  
  - intersect their characters.
    - if the return of the intersection is empty, return true, false otherwise 
=end

def shadow_sentence(str1, str2)
  return false if str1 == str2
  return false if str1.split.size != str2.split.size

  pairs = str1.split.zip(str2.split)
  
  pairs.each do |par|
    intersection = par[0].chars & par[1].chars 
    # p par
    # p par[0]
    # p par[1]
    if par[0].size == par[1].size && intersection.empty?
      next 
    else
      return false 
    end
  end
  true 
end

p shadow_sentence('own a boat', 'buy my wine') == false

p shadow_sentence('a normal sentence', 'a normal sentence') == false
p shadow_sentence('his friends', 'our company') == false
p shadow_sentence('they are round', 'fold two times') == true
p shadow_sentence('impossible poetry', 'gargantuan cliffs') == true
p shadow_sentence('seemingly unlimited', 'cutthroat crossbows') == true
p shadow_sentence('empty cookie jar', 'adorn fluffy wig') == true

p shadow_sentence('salmonella supper', 'birthright') == false