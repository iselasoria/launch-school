=begin 
* DONE 15m51s
Given a word, create a hash which stores the indexes of each letter in an array.

Make sure the letters are the keys.
Make sure the letters are symbols.
Make sure the indexes are stored in an array and those arrays are values.
Examples
map_letters("dodo") ➞ { :d=>[0, 2], :o=>[1, 3] }

map_letters("froggy") ➞ { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }

map_letters("grapes") ➞ { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] 


I: string 
O: hash 

Rules:
- hash is to store indexes of each character as values, and character as keys 
- letters are keys--> MUST BE SYMBOLS
- values are arrays of index 
- empty string, returns empty hash 

Examples:
"abcdefg" == {:a=>[0], :b=>[1], :c=>[2], :d=>[3], :e=>[4], :f=>[5], :g=>[6]}
 0123456

DS:
I: string 
Interm: arrays 
O: hash 

Algorithm:
- init a hash object to have default empty arrays as values 

- iterate over the strings characters and their index 
  - for each character, 
    - set the character as Symbol in the keys and push index 
- return newly created hash 
=end 

def map_letters(str)
  index_occurrences = Hash.new {|h,k| h[k] = []}

  str.chars.each_with_index do |ch, idx|
    if index_occurrences.has_key?(ch)
      index_occurrences[ch.to_sym] = idx
    else
      index_occurrences[ch.to_sym] << idx
    end
  end
  index_occurrences
end

# test cases 
p map_letters("") == {}
p map_letters("a") == {:a=>[0]}
p map_letters("abcdefg") == {:a=>[0], :b=>[1], :c=>[2], :d=>[3], :e=>[4], :f=>[5], :g=>[6]}
p map_letters("balloon") == {:b=>[0], :a=>[1], :l=>[2, 3], :o=>[4, 5], :n=>[6]}
p map_letters("imagining") == {:i=>[0, 4, 6], :m=>[1], :a=>[2], :g=>[3, 8], :n=>[5, 7]}
p map_letters("mummy") == {:m=>[0, 2, 3], :u=>[1], :y=>[4]}
p map_letters("aaaaaaabaaabaaabbb") == {:a=>[0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 13, 14], :b=>[7, 11, 15, 16, 17]}