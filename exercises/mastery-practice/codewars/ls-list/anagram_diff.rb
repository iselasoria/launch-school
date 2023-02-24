=begin 
Given two words, how many letters do you have to remove from them to make them anagrams?
Example
  
      First word : c /od/ e /w/ ar /s/ (4 letters removed)
      Second word : /ha/ c /k/ er /r/ a /nk/ (6 letters removed)
      Result : 10

I: two string objects 
O: integer 

Rules:
  - two words are anagrams if they have the same letters in different order 
  - identify how many words are being removed from each in order to make them anagrams 

- Edge Cases:
  - if either of the strings is empty and the other one isnt, return the size of the non-empty string 
  -if both strings are unique, return the sum of their sizes 
Examples:
'codewars' and 'hackerrank'
 c  e ar         ac er a  <----- the count of the letters matters

Data Structures:
I: two strings 
interim: arrays/hash 
O: integer --> the total letters removed from both strings 

Algorithm:
- if one of the strings is non-empty and the other one is empty, return the non-empty size 
- two empty strings return 0 
- if first sorted == second sorted return 0 

- get tally for each word 
- iterate over str1 tally 
  - skip those not found 
  - select only those items that have a count of at least as many letters in the second word, as in the first --> str1 size - what is leftover in the values of the hash 
- iterate over str2 tally 
 - skip those not found 
 - select only those items that have a count of at least as many letters in the first word, as in the second -->  str2 size - what's leftover in the values hash 

- sort leftovers and get the difference between the values arrays at the same index 
  - sum up the differences in leftovers --> repeats 
- add the leftovers from the two strings full list size
  - additionally, remove an extra `repeats` number to account for duplicates
=end

def anagram_difference(str1, str2)
  tally1 = str1.chars.tally 
  tally2 = str2.chars.tally 

  leftover_first = tally1.select do |letter, ct|
                      next if !tally2.keys.include?(letter)
                      tally2.keys.include?(letter)
                    end

  leftover_second = tally2.select do |letter, ct|
                      next if !tally1.keys.include?(letter)
                      tally1.keys.include?(letter)
                    end 

  # first word size - leftover --> removed ---\__ total removed 
  # second word size - leftover --> removed --/

  # p leftover_first.sort.zip(leftover_second.sort)
  repeats = []
  leftover_first.each do |letter, ct|
    if leftover_second[letter] != ct 
      repeats << (leftover_second[letter] - ct).abs 
    end
  end
  # p repeats.sum
  dupes = repeats.sum

  total_str_size = (str1.size + str2.size)
  total_str_size- (leftover_first.values.sum + (leftover_second.values.sum - dupes))
    # add up values, not size!
          # 18                                  4           6                         2           
end
  

p anagram_difference('', '') == 0
p anagram_difference('a', '') == 1
p anagram_difference('', 'a') == 1
p anagram_difference('ab', 'a') == 1
p anagram_difference('ab', 'ba') == 0
p anagram_difference('ab', 'cd') == 4
p anagram_difference('aab', 'a') == 2
p anagram_difference('a', 'aab') == 2
p anagram_difference('codewars', 'hackerrank') == 10


(main):030:1* hsh1.map do |k, v|
  irb(main):031:2*   if hsh2.keys.include?(k)
  irb(main):032:2*     v - hsh2[k].abs
  irb(main):033:1*   end
  irb(main):034:0> end

## BEST!
def anagram_difference(str1, str2)
  str1.chars.each do |letter|
    if str2.include?(letter)
      str1.sub!(letter, '')
      str2.sub!(letter, '')
    end
  end

  str1.size + str2.size
end