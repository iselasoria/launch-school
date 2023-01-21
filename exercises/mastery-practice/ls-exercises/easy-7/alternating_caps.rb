=begin 
* DONE 
 TODO Interview Practice
Write a method that takes a String as an argument, and returns a new String that contains the original value using a staggered capitalization scheme in which every other character is capitalized, and the remaining characters are lowercase. Characters that are not letters should not be changed, but count as characters when switching between upper and lowercase.


I: string 
O: string 

Rules:
- space does matter! 

Goal: to capitalize the alternating letters in a string 

Algorithm:
- initialize a an empty string result
- initialize a boolean and set it to true
- iterate over the chars in the word 
  - if the boolean is true, 
    - add into the result string the upcase version of the char 
  - otherwiseL
    - add the uppercase version 
  - toggle the boolean so that the next word wont need it 
  - return the result 
=end 

def staggered_case(string)
  result = ''
  needs_cap = true
  string.chars.each do |char|
    if needs_cap
      result += char.upcase
    else
      result += char.downcase
    end
    needs_cap = !needs_cap
  end
  result
end

# 'I LoVe lAuNcH ScHoOl!'
  #  0 0123 012345 0123456
  #  c clcl clclcl clclclc 

# test cases 
p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'