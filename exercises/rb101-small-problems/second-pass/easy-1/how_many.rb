=begin
-----------------------INSTRUCTIONS--------------------------------------
Werite a method that counts the number of occurances of each element in a given array.
--------------------------PROBLEM----------------------------------------
Questions:
Input: array
Output: hash
---------------------------RULES-----------------------------------------
Explicit: 
- count each occurrence of a word in the array
- words are case sensitive
Implicit: 
--------------------------EXAMPLES---------------------------------------
pets = ['cat','dog','hamster','cat','cat','dog']
cat => 3
dog => 2
hamster => 1
----------------------------ALGO----------------------------------------
- read the array
- initiate a hash object
- iterate over the array
  - check the word at every iteration, add to the count each time

=end

def count_occurrences(arr)
  
  arr.each_with_object({}) do |word, hash|
    hash[word] = arr.count(word)
  end
end

p count_occurrences(vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
])

# DONE