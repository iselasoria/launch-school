=begin
-----------------------INSTRUCTIONS--------------------------------------
Modify the method from the previous exercise so it ignores non-alphabetic characters
when determingin whether it should uppercase or lowercase each letter. The non-alphabetic
characters should still be inlcuded in the return value, they just wont count when toggling case.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: string
---------------------------RULES-----------------------------------------
Explicit: 
- ignore non-alpha chars for the purpose of case toggle
- don't just delete non-alpha chars, they should still be in the return string
- alternating case
Implicit: 
--------------------------EXAMPLES---------------------------------------
- read string
- iterate through string characters
- if index is odd, upcase
- if index is even, downcase


before:
=> 'I LoVe lAuNcH ScHoOl!'
now:
=> 'I lOvE lAuNcH sChOoL!'
=end
# ----------------------------ALGO----------------------------------------
def staggered_case(str)
  altered_string = str.chars.each_with_index do |letter, idx|
                    p letter

                      if idx % 2 == 0 && letter !=  /[a-z]/i
                        letter.upcase!
                      elsif idx % 2 != 0 && letter !=  /[a-z]/i
                        letter.downcase!
                      elsif letter !=  /[a-z]/i
                        letter.upcase!
                      end
                  
                    end

                  
  altered_string.join
end

# TODO come back to this problem

# test cases
# p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') #== 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'