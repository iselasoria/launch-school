
=begin 
* DONE 14m10s
Create a function that takes a single string as argument and returns an ordered array containing the indices of all capital letters in the string.

Examples
index_of_caps("eDaBiT") ➞ [1, 3, 5]
index_of_caps("eQuINoX") ➞ [1, 3, 4, 6]
index_of_caps("determine") ➞ []
index_of_caps("STRIKE") ➞ [0, 1, 2, 3, 4, 5]
index_of_caps("sUn") ➞ [1]

Notes

    Return an empty array if no uppercase letters are found in the string.
    Special characters ($#@%) and numbers will be included in some test cases.
    Assume all words do not have duplicate letters.

I: string 
O: array 

Rules:
- return empty array if there are no capitals in the input 
- assume you can have special chars and no duplicate letters 
- return an ordered array (ascending order) of the indeces where we found capitals 
- numeric strings are also to return empty array ***



Examples:
"sUn"
 _1_ --> [1]

"@xCE#8S#i*$en"
 __23__6______ --> [2,3,6]

 DS: 
 I: string
 Interm: array (of chars) 
 O: array 

 Algorithm:
 - return empty arr if all letters are downcased 
 - make an array of all alphabetic chars 

 - init results_arr 
 - iterate over the string characters and its index 
    - skip if current character is not a capital letter or non alphabetic 
    - if it is, push to results_arr

- return results_arr
=end 

def index_of_caps(str)
  return [] if str.chars.all? {|item| item == item.downcase}
  alpha = ('a'..'z').to_a + ('A'..'Z').to_a 

  results_arr = []
  str.chars.each_with_index do |ch, idx|
    next if (ch != ch.upcase) || !(alpha.include?(ch))
    results_arr << idx 
  end
  results_arr
end

p index_of_caps("eDaBiT") == [1, 3, 5]
p index_of_caps("eQuINoX") == [1, 3, 4, 6]
p index_of_caps("STRIKE") == [0, 1, 2, 3, 4, 5]
p index_of_caps("sUn") == [1]
p index_of_caps("SpiDer") == [0, 3]
p index_of_caps("accOmpAnY") == [3, 6, 8]
p index_of_caps("@xCE#8S#i*$en")== [2, 3, 6]
p index_of_caps("Fo?.arg~{86tUx=|OqZ!") == [0, 12, 16, 18]

p index_of_caps("determine") == []
p index_of_caps("1854036297") == []