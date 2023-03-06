=begin 
Write a method that takes a string as an argument and groups the number of time each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

I: string 
O: hash 

Rules:
- case does not matter 
- ignore all but alphabetical letters
- result will be a hash:
  - keys are number of occurences 
  - values are the letters taht occurr as many times as the key indicates 
- in the resulting hash, the letters should be ordered by alphabetically 
- in the resulting hash, the keys should be ordered by the highest number of occurences 

Goal: return a hash that groups the letters by the number of occurences they have in the input string 

Examples / Model Solution:
'Mississippi'
m -> 1 
i -> 4
s -> 4
p- > 2
{4=>["i", "s"], 2=>["p"], 1=>["m"]}

DS: 
I: string 
Interim: array 
O: hash 

Algorithm:
- downcase all 
- delete all but alphabetical letters 
- get a tally of the letters inthe string and sort by the value (counts) 
- reverse the tally (now it's from greatest to smallest) --> now a nested array

- init grouped_hash to {}
- iterate over the tally nested array 
  - for each key/value pair 
  - in a new hash, set key as the first item in the pair, and the value as the second item in the pair 
  *** because keys are unique, we don't want to lose the chars that have a repeated ct 

- iterate over new hash with object # {"s"=>4, "i"=>4, "p"=>2, "m"=>1}
  - check if value is a key in the new hash 
    - if it is, push the value (letter) to its array val 
  - if this is the first time I encounter it 
    - set the current value in this iterateion as key in the new hash and set equal to pushing letter 
  - transform value of g_hash to get arrays instead of strings
=end 

def get_char_count(str)
  str.downcase!
  str = str.delete('^a-z0-9')

  tally = str.chars.tally.sort_by {|ch, ct| ct}.reverse!

  clean_hash = {}

  tally.each do |par|
    clean_hash[par[0]] = par[1]
  end

  g_hash = Hash.new {|h, k| h[k] = []}
  p clean_hash

  clean_hash.each do |letter, ct|
    if g_hash.has_key?(ct)
  #     # if its already there, push to it
      g_hash[ct] << +letter
    else
  #     # set for the first time 
      g_hash[ct] = +letter
    end
  end
  g_hash.transform_values! {|val| val.split(//).sort}
end

#########################***********************##################################
# test cases 
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

###### Grouping and Counting Characters Kata

def get_char_count(str)
  # don't want capitals or special chars
  str.downcase!
  str = str.delete('^a-z0-9')

  # getting a tally, but reversing it so it's now count in descending order
  tally = str.chars.tally.sort_by {|ch, ct| ct}.reverse!.to_h

  g_hash = Hash.new {|h, k| h[k] = []} # here I want a hash with empty arrays for values
  
  tally.each do |letter, ct|
    if g_hash.has_key?(ct) # if count is already there, push to its values array
      g_hash[ct] << letter
    else # if this is the first time I encounter it, set it
      g_hash[ct] = +letter ### This is the string that froze
    end
  end
  g_hash.transform_values! {|val| val.split(//).sort} # for some reason the push gave me a string so now I split it and sort it
end


# test cases 
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

