# ! 7 kyu
=begin
-----------------------INSTRUCTIONS--------------------------------------
Consider the word "abode". We can see that the letter a is in position 1 and b 
is in position 2. In the alphabet, a and b are also in positions 1 and 2. 
Notice also that d and e in abode occupy the positions they would occupy
in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that
occupy their positions in the alphabet for each word. For example:

Given an array of words, return an array of the number of letters that
occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]


--------------------------PROBLEM----------------------------------------
Questions:
Input: array of strings
Output: array of integers
---------------------------RULES-----------------------------------------
Explicit: 
- count the characters for which the position in the word of each array is equal to the
  position in the alphabet
Implicit: 
--------------------------EXAMPLES---------------------------------------
["abode","ABc","xyzD"] #==> [4, 3, 1]
["abide","ABc","xyz"] #==> [4,3,0]
["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"] #==> [6,5,7]
["encode","abc","xyzD","ABmD"] #==> [1, 3, 1, 3]

----------------------------ALGO----------------------------------------
- set an index for all letters in the alphabet
- set a new array that will hold the result
- iterate over every word in the array
  - get the count of all the characters if the index of the current character in the array is the same as the alphabet index
    - push the counts into a new array
- return the array of the counts
=end

# TODO come back to this


def alpha_sym(arr)
  alphabet = ('a'..'z').to_a
  alphabet_index = []
  alphabet_info = alphabet.each_with_index do |letter, idx|
                    # alphabet_index << 
                    p letter[idx]
                  end
  alphabet_index
  
end

# test cases
p alpha_sym(["abode","ABc","xyzD"]) #==> [4, 3, 1]
# alpha_sym(["abide","ABc","xyz"]) #==> [4,3,0]
# alpha_sym(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) #==> [6,5,7]
# alpha_sym(["encode","abc","xyzD","ABmD"]) #==> [1, 3, 1, 3]