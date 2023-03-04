=begin 
* DONE 16m37s

https://gist.github.com/stephensl/05982181ff92990e9e4d9611d352d3bc

Write a method to find the longest common prefix string amongst an array of strings
If no common prefix, return empty string.
All given inputs are in lowercase letters a-z.


I: array of strings 
O: string 

Rules:
- only lowercase english characters 
- prefix---> the start of a word 
- if no common prefix is found, return an empty string 

Goal: find and return the common prefix 

Examples:
                    flower, flow, flight 
start at idx 0      f 
check that f exists at current position in all the words, then idx1, then idx2, etc ...


DS:
arrays and strings 

Algorithm:

- init prefix = ''

- iterate over first word characters and indexes 
  - if current char is present in all of the arrays words at char index
  - **if all? words in the collection have current char at the same index as this first word*
    - push char to prefix 
  - break if not present 

- return prefix 
=end 

def common_prefix(arr)
  prefix = ''


  arr.first.chars.each_with_index do |ch, idx|
    if arr.all? {|word| word.chars[idx] == ch}
      prefix << ch
    end
  end
  prefix
end


p common_prefix(%w(flower flow flight)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'

