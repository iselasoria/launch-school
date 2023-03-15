=begin 

Write a function that selects all words that have all the same vowels (in any order and/or number) as the first word, including the first word.

Examples
same_vowel_group(["toe", "ocelot", "maniac"]) ➞ ["toe", "ocelot"]

same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) ➞ ["many"]

same_vowel_group(["hoops", "chuff", "bot", "bottom"]) ➞ ["hoops", "bot", "bottom"]

Notes

    Words will contain only lowercase letters, and may contain whitespaces.
    Frequency does not matter (e.g. if the first word is "loopy", then you can include words with any number of o's, so long as they only contain o's, and not any other vowels).

I: array 
O: array 

Rules:
  - find words that share the same vowels in any number or order 
    - all vowels must be shared
  - if no words can be grouped, return the first word 

Examples:
- ["hoops", "chuff", "bot", "bottom"]
    o           u       o     o   ---> ["hoops", "bot", "bottom"]

- ["a", "apple", "flat", "map", "shark"])  
    a     a e       a       a     a  ---> ["a", "flat", "map", "shark"]

DS: 
I: array of strings
Interm: arrays  
O: aray of strings 

Algorithm:

- itearte over the array with a transformation store in `streamlined_arr`
  - for every word 
    - substitute consonats with white space/nothing # "hoops" --> "oo", "chuff" --> "u" ==> [single vowel, word]

- iterate over streamlined_arr # ["o", "hoops"], ["u", "chuff"]
  - group on the first element in the subarrays 
  - get the largest group and store in `almost`
  - init almost_hash to hold the string as key, and arays as values 
  {"o" => [pair],[],[]}
  -iterate oer the almost_hash keys and transform to second ele,ent 

=end

def same_vowel_group(arr)

  streamlined_arr = arr.map do |word|
    [word.gsub(/[^aeiou]/, "").chars.uniq.join, word]
  end
  almost = streamlined_arr.group_by {|item| item[0] }.max_by {|vowel, pairs| pairs.size}

  almost[1].map {|item| item[1]}
  # almost_hash = {}
  # almost.each do |ltr, pair|
  #   almost_hash[ltr] = pair
  # end
  # almost_hash
end 

p same_vowel_group(["hoops", "chuff", "bot", "bottom"]) == 
["hoops", "bot", "bottom"]
p same_vowel_group(["crop", "nomnom", "bolo", "yodeller"]) == 
["crop", "nomnom", "bolo"]
p same_vowel_group(["semantic", "aimless", "beautiful", "meatless icecream"]) #== 
# ["semantic", "aimless", "meatless icecream"]
p same_vowel_group(["many", "carriage", "emit", "apricot", "animal"]) == 
["many"]
p same_vowel_group(["toe", "ocelot", "maniac"]) == ["toe", "ocelot"]
p same_vowel_group(["a", "apple", "flat", "map", "shark"]) == ["a", "flat", "map", "shark"]
p same_vowel_group(["a", "aa", "ab", "abc", "aaac", "abe"]) == ["a", "aa", "ab", "abc", "aaac"]