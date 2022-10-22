=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not usse both letters from any given block.
Each block can only be used once. 

Write a method that returns true if the word passed in as an arugment can be spelled from this set of blocks, false otherwise.

----------P
input: potentially a nested array
output: boolean

Goal: return true if the word in test case uses exactly one of the pairs in the input collection, false if it uses more than one
----------E
Model Solution:
'BATCH' == true  
B is in the block with O and O does not get used
A is in the block with N and N does not get used
T is in the block with G and G does not get used
C is in the block with P and P does not get used
H is in the block with U and U does not get used

----------A
- helper method xor
  - 
- initiate a nested array that holds the pairs of letters
- iterate over nested array (top level iteration) --> ex) ['B','O']
  - one leverl deeper in the itration---> 'B' we might need index
    - if test_case_word.chars includes current element and element at index + 1
      - false
    - otherwise
      - true


=end


def block_word?(test_string)
  bloques = [['B','O'], ['X','K' ], ['D','Q'], ['C','P'], [ 'N','A'], ['G','T'], ['R','E'], ['F','S'], ['J','W'], ['H','U'], ['V','I'], ['L','Y' ], ['Z','M']]

  bloques.each_with_index do |pair, idx|
    p test_string.chars.include?(pair[0]) && test_string.chars.include?(pair[1])
    p test_string.chars.include?(pair[0]) && !test_string.chars.include?(pair[1])
    p !test_string.chars.include?(pair[0]) && test_string.chars.include?(pair[1])

    # p pair
    # if test_string.chars.include?(pair[0]) && test_string.chars.include?(pair[1])
    #   false
    # elsif test_string.chars.include?(pair[0]) && !test_string.chars.include?(pair[1])
    #   true
    # elsif !test_string.chars.include?(pair[0]) && test_string.chars.include?(pair[1])
    #   true
    # end
  end
end

# test cases

p block_word?('BATCH') == true
# p block_word?('BUTCH') == false
# p block_word?('jest') == true
