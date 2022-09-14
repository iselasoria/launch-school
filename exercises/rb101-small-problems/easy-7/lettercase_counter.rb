=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string and then returns a hash that contains
three entries: 
- one represents the number of characters in the string that
  are lowecase letters
- one the number of characters that are uppercase, and 
- one the number of characters that are neither.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string object
Output: a hash that contains three enrties
---------------------------RULES-----------------------------------------
Explicit: hash must contain one entry per type of lettercase-- captial, lowecase, neither
Implicit: non-alphanumeric characters go automatically into the neither category
--------------------------EXAMPLES---------------------------------------
- Read the string object that comes in as argument
- break it apart to have an array
- iterate over the new array
- test with case statement or if statement
  - set the value in each category in the hash
- return the new hash object
=end
# ----------------------------ALGO----------------------------------------
CAPS = ('A'..'Z').to_a
# p CAPS
LOWS =('a'..'z').to_a
# p LOWS
def letter_case_count(str)
  hashi_object = str.chars.each_with_object({uppercase: 0, lowercase: 0, neither: 0}) do |ch, hash|
 
                  if CAPS.include?(ch)
                    hash[:uppercase] += 1
                  elsif LOWS.include?(ch)
                    hash[:lowercase] += 1
                  else
                    hash[:neither] += 1
                  end
                end
 
hashi_object
end


# test cases
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }