=begin 

Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily. *****

If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.


Examples:

top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

top_3_words("  //wont won't won't")
# => ["won't", "wont"]


I: string 
O: array of strings 

Rules:
- return top three words in a string 
- only alphabet and apostrophes are allowed, all others get ignored 
- capitalization does not matter, don't need to retain original case for the resulting array 
- result is all lowercase 
- empty string returns empty array 

Examples:

("  ...  ") 
ignore special characters 
returns []

"e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"

e   -> 7
ddd -> 5 
aa  -> 3 
bb  -> 1 

Data Structures:
I: string 
Interim: array of words/chunks 
O: array of strings

Algorithm:

- downcase the whole string 
- remove all but a-z and apostrophes

- split at spaces and store as `chunks_arr`

- get tally each word --> use default values and store in `tally_me`

- select max three from tally_me ---> select and return keys 

=end 

def top_3_words(str)
  str = str.downcase
  return [] if str.empty? 
  

  chunks_arr = str.split

  chunks_arr.map! {|item| item.delete("^a-z'")}


  return [] if  chunks_arr.join.chars.uniq.join == "'"

  tally_me = Hash.new(0)

  chunks_arr.each do |item| 
    p item
    next if item.empty? 
    tally_me[item] += 1 
  end 

  tally_me.max_by(3) {|letter, ct| ct}.to_h.keys
end

# test cases 
# p top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"]
# p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
# p top_3_words("  //wont won't won't ") #== ["won't", "wont"]
# p top_3_words("  , e   .. ") == ["e"]
# p top_3_words("  ...  ") == []


# p top_3_words("  '  ") == []
p top_3_words("  '''  ") == []
p top_3_words("  , e   .. ") #== ["e"]

# p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]