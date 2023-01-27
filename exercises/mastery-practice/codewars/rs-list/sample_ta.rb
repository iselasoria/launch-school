# * DONE 40m
# Given a string s, reverse the string according to the following rules:

# - All the characters that are not English letters remain in the same position. 
# - All the English letters (lowercase or uppercase) should be reversed.
# - Return s after reversing it.

=begin

I: string 
O: string 


Rules:
- alpha characters get reversed 
- lowercase and upercase 
- special characters stay in the same place 
- return a string 

Examples: 
"ab-cd"
"dc-ba"

"hellO"--> all chars get reversed 
"Olleh"

string  :      "Test1ng-Leet=code-Q!"
taken   :           1  -    =    - !
indexes :       012345678910111213141516171819 
staying :           4  7      12        17  19
other_ch:       TestngLeetcodeQ
other_re:       QedocteeLgntseT


Qedo1ct-eeLg=ntse-T!


Scratchpsace:
- track the index of the special characters --> hash {4 => '1', 7 => '-', 12 => '='}

- iterate over the reversed chars that stay and their index 
  - when the index is found on the characters hash
    - insert the value from the hash, at the index specified in the hash 

Algorithm:

Helper Method: char_hash(str)
- iterate over the string 
- when the character is not found in the alphabet
  - set (in a new hash) index as the key, and character as the value

Main Method: reverse_only_letters(str)
- call char_hash and store in `char_index` #=> {4 => '1', 7 => '-', 12 => '='}

- if the string includes character beyond the alphabet 
- delete special characters from string # => 'TestngLeetcodeQ'
- reverse newly mutated string # =>  'QedocteeLgntseT'
- otherwise
  reverse string 
- iterate over the hash 
  - insert into reversed string the value at the index 
=end

def char_hash(str)
  str.chars.each_with_index.with_object({}) do |(ch, idx), char_index|
    if !('a'..'z').to_a.include?(ch) && !('A'..'Z').include?(ch)
      char_index[idx] = ch
    end
  end
end

def reverse_only_letters(str)

  no_need = str.chars.all? do |ch| 
    (('a'..'z').to_a + ('A'..'Z').to_a).include?(ch)
  end

  return str.reverse if no_need

  char_index = char_hash(str)

  str.delete!('^a-zA-Z').reverse!
  
  char_index.each do |idx, char_to_insert|
    str.insert(idx, char_to_insert)
  end

  str
end

p reverse_only_letters("ab-cd") == "dc-ba"
p reverse_only_letters("Test1ng-Leet=code-Q!") == "Qedo1ct-eeLg=ntse-T!"
p reverse_only_letters("--__123") == "--__123"

p reverse_only_letters('hellO') == 'Olleh'