=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string as an argument, and returns a new string that 
contains the original value using a staggered capitalizations cheme in which every other 
character i capitalized, and the remaining characters are lowercase. Characters that are not
letters should not be changed, but count as characters when switching between upper and lowercase.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: new string
---------------------------RULES-----------------------------------------
Explicit: 
- capitalization should alternate from uppercase to lowercase
- characters that are not letters should be ignored
  - they still count toward the capitalization pattern
Implicit: 
- spaces count toward the capitalization pattern
--------------------------EXAMPLES---------------------------------------
str = 'the quick brown fox'
# => 'ThE QuIcK BrOwN FoX'

- read the string
- iterate over its characters and their index
- if the index is odd, capitalize
- if the index is even, lowercase


=end

# ----------------------------ALGO----------------------------------------

# ! This concept is interesting, the return of the if statement coupled with the
# ! return of the each_with_index, might want to review later
def staggered_case(str)
    altered_string = str.chars.each_with_index do |letter, idx|
                      if idx % 2 == 0
                        letter.upcase!
                      elsif idx % 2 != 0
                        letter.downcase!
                      end
                    end
    altered_string.join
end

# test cases
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# * DONE