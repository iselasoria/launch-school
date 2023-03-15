=begin
* DONE 12m13s
Write a function that returns the longest common ending between two strings.
Examples

longest_common_ending("multiplication", "ration") ➞ "ation"

longest_common_ending("potent", "tent") ➞ "tent"

longest_common_ending("skyscraper", "carnivore") ➞ ""

Notes

Return an empty string if there exists no common ending.

I: two strings
O: string 

Rules:
- looking for ending only 
- return the common characters found 


Examples:
"potent" | "tent") == "tent"

t 
e 
n 
t ---> I ran out of letters in the second word 
** return what I have so far 

"skyscraper" | "carnivore") == ""
r ---> last character is not common 
return "" string 

DS: 
I: two strings 
Interm: array 
O: string 

Algorithm:

init a variable to hold common_chars = ''
- iterate over the first string in reverse with index 
  - if current word is the same as other string's current word, 
    - add current character to common_chars 
    - when this no longer true, return common_chars
=end

def longest_common_ending(str1, str2)
  common_chars = ''

  str1.chars.reverse.each_with_index do |ch, idx|
    if ch == str2.chars.reverse[idx]
      common_chars << ch 
    else
      return common_chars.reverse
    end
  end
end

p longest_common_ending("pitiful", "beautiful") #== "tiful"
p longest_common_ending("truck", "trick") == "ck"
p longest_common_ending("vote", "asymptote") == "ote"
p longest_common_ending("multiplication", "ration") == "ation"
p longest_common_ending("potent", "tent") == "tent"
p longest_common_ending("skyscraper", "carnivore") == ""