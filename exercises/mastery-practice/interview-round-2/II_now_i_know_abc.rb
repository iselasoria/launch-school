=begin 
* DONE 15m45s
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

I: string 
O: boolean 

Rules:
- each letter can only be used ONCE 

Goal: check if input word only uses one letter per block

DS:
arrays 

Algorithm:
- init CHUNKS_ARR to a nested array containing pairs of letters
- iterate over the input string 
  - with each iteration 
    - when I find the current letter, I'll remove from chunks_arr 
    - check if any subarrays are empty
     - return false if it's ever true 
- return true as a catch-all

=end 

def block_word?(str)
  chunks_arr = [
  ['B','O'],['X','K'],['D','Q'],['C','P'],
  ['N','A'],['G','T'],['R','E'],['F','S'],
  ['J','W'],['H','U'], ['V','I'],['L','Y'],['Z','M']]


  str.chars.each do |letter|
    chunks_arr.each do |sub|
      if sub.include?(letter)
        sub.delete(letter)
      end
    end
  end
  chunks_arr.any? {|chunk| chunk.empty?} ? false : true
end


# test cases 
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true