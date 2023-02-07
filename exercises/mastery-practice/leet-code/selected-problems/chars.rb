=begin 
Given array of strings made only of lowercase letters, return array of all characters that show up in all strings within the given array (including duplicates) For example, if a character occurs 3 times in all strings, but not 4 times, you need to include that character three times in the final answer.

I: array 
O: array 

Rules:
- elements in the array are all lowercase letters 
- find characters that appear in every string in the array 
- if the letters in each elemen in the input array are unique, then return []

Goal: find characters that appear in every string in the array 

Examples:
arr = ['bella', 'label', 'roller']
common characters = [e, l, l]


arr = ['hello', 'goodbye', 'booya', 'random']) 
common characters = ['o']

arr = ['cool', 'lock', 'cook'] == ['c', 'o']

Data Structures:
I: array 
Interim: array 
O: array 

Scratchspace:
if any of the characters in the word, are found in all the words in the array, then add 

Algorithm:
- iterate over the characters of the first word 
  - if the character is included in all the array elements 
    - add to results_arr 
=end 


# def common_chars(arr)
#   results_arr = []

#   first_tally = arr[0].chars.tally

#   first_tally.each do |letter, ct|
#     arr.each do |word| 
#       if word.count(letter) == ct
#         results_arr << letter * ct 
#       end
#     end
#   end
  
#   results_arr
# end

def common_chars(array)
  word = array[0]
  letters = []

  word.chars.each do |char|
  
    count = array.map do |word|
      word.count(char)
    end.min
  if letters.include?(char)
    next
  end
    count.times do
    letters << char
end
  end
  letters
end 



p common_chars(['bella', 'label', 'roller']) #== ['e', 'l', 'l']
p common_chars(['cool', 'lock', 'cook']) #== ['c', 'o']
# p common_chars(['hello', 'goodbye', 'booya', 'random']) == ['o']
# p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz)) == []

# https://leetcode.com/problems/find-common-characters/