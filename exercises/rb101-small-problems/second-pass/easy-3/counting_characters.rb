=begin
Write a program that will ask a user for an iunput of a word or multiple words and give
back the number of characters. Spaces are not counted.

input:
Please write word or multiple words: walk
output:
There are 4 characters in "walk".

input:
Please write word or multiple words: walk, don't run
output: 
There are 13 characters in "walk, don't run".
=end

puts "Please input a word or multiple words:"
sentence_1 = gets.chomp

sentence_2 = sentence_1.gsub(' ','')

counter = sentence_2.chars.size

puts " There are #{counter} in #{sentence_1}."