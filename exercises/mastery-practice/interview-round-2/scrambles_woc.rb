=begin
* DONE 24m05s
Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise return false. 

For example: 
str1 is 'rkqodlw' and str2 is 'world' the output should return true

I: two string objects 
O: boolean 

Goal: determine if string 1 can be be rearranged to make string 2

Rules:
- portion of string1
- true if string1 can be rearragend into string2 
  - false if it's not possible 

Implicit Rules:
  - all letters have to be present in both of the strings 
  - in string1, I need to have at least as many of each character as I have in string2 

Examples:
'javaass' and 'jjss'
* can't be made because I need two 'j's and string1 only has one 

'katas' and 'steak'
* can't be made because I need an 'e' and string1 doesn't have one 


DS: 
I: two strings 
Interim: arrays of characters / hash to track counts of letters 
O: boolean 

Algorithm:
- check if all the characters in string1 are included in string2 


- get a tally of letter occurences in each string 
  * `available_tally`
  * `required_tally`

- iterate over available_tally # {j => 1, a=>3,..}
- skip letters not present in both 
  - return false if current count(value) less than the count(value) in the required_tally

- true 
  



=end 
def scramble(str1, str2)
  return false if !str2.chars.all? {|ch| str1.chars.include?(ch)}
  
  # get tallys 
  available_tally = str1.chars.tally
  required_tally = str2.chars.tally 

  # check counts 
  available_tally.each do |letter, ct|
    next if !required_tally.keys.include?(letter)
    return false if ct < required_tally[letter]
  end
  true
end


p scramble('javaass', 'jjss') == false 
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqty', 'codewars') == true
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true 

p scramble('katas', 'steak') == false

