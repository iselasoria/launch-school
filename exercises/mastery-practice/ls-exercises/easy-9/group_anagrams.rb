# *DONE 5m
# Given an array:

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
=begin
Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in
them but in a different order. Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)
=end 

=begin
Algorithn:
Helper Method: anagram?(str)
- if str.chars are the same as reversed, then its true 

Main Method: 


=end

p words.sort.group_by {|item| item[0] }.to_a