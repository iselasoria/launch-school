=begin
-----------------------INSTRUCTIONS--------------------------------------
Given the array:
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
Write a program that prints out groups of words that are anagrams. Anagrams
are words that have the same exact letters but in a different order. The output 
should look something like this:
["demo", "dome", "mode"]
["neon", "none"]
#(etc)
--------------------------PROBLEM----------------------------------------
Questions:
Input: array
Output: several arrays
---------------------------RULES-----------------------------------------
Explicit: 
- anagrams have the same letters but in different order
Implicit: 
- anagrams are the same length
--------------------------EXAMPLES---------------------------------------
['demo','mode','dome']
groups expected:
demo, dome, mode
none, neon
tide, diet, edit, tied
fowl, flow, wolf
evil, vile, live, veil
----------------------------ALGO----------------------------------------
- read the array
- iterate through the array
  - iterate through each word   
    - if every letter in the word is contained in the previous word, dump it in an anagram array
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

d_group = []
f_group = []
n_group = []
t_group = []
e_group = []

words.each do |word|
  if word.chars.include?('d') && word.chars.include?('o')
    d_group << word
  elsif word.chars.include?('f')
    f_group << word
  elsif word.chars.include?('n')
    n_group << word
  elsif word.chars.include?('t') && word.chars.include?('e')
    t_group << word
  else 
    e_group << word
  end
end


p d_group
p f_group
p n_group
p t_group
p e_group

# demo, dome, mode
# none, neon
# tide, diet, edit, tied
# fowl, flow, wolf
# evil, vile, live, veil

# * DONE but return to this question https://launchschool.com/exercises/3e3f841c


