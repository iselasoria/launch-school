=begin 
Given array of strings made only of lowercase letters, return array of all characters that show up in all strings within the given array (including duplicates) For example, if a character occurs 3 times in all strings, but not 4 times, you need to include that character three times in the final answer.

I: array of words  
O: Array of letters 


Rules:
- only lowercase letters 
- finding common characters to all strings --> don't include if only found in 1 or 2
- dupes must be included

Examples:
      ['cool', 'lock', 'cook']
consider the word with unique chars  as the first one 
round1  co
check for current in all items in teh array, if so save it 

DS: 
I array 
Interim: array 
O: array 

Algorithm:
- if every word contains repeat letters, return empty
- get the sizes of the words, and find the smallest unique # ['cool', 'lock', 'cook']
- set word with unique chars as `checker_word` # lock 

- init results_arr
- iterate over the checker_word chars # l 
  - check if current letter exists in all of the words
    - if it does, store in results_arr
- return results_arr
=end 


def common_chars(arr)
  checker_word = arr.select {|word| word.chars.uniq == word.chars}.first
  return [] if checker_word.nil?


  results_arr = []
  checker_word.chars.each do |ch|
    results_arr << ch if arr.all? {|item| item.include?(ch)}
  end 
  results_arr.sort
end


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




p common_chars(['cool', 'lock', 'cook']) #== ['c', 'o']
p common_chars(['hello', 'goodbye', 'booya', 'random']) #== ['o']
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz)) #== []



