=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes a string and returns a new string in which every
character is doubled.
--------------------------PROBLEM----------------------------------------
Questions:
Input: string
Output: string
---------------------------RULES-----------------------------------------
Explicit: 
- doubles the input string
Implicit: 
- new string
--------------------------EXAMPLES---------------------------------------
str = 'cat'
output_str = 'ccaatt'

# ----------------------------ALGO----------------------------------------
- read the string
- inatiate an empty variable, this will hold the final result
- initiate a new variable and set to the return of the string as an array
- iterate through the array
  - for each element in the collection, double it
  - push each element into the final results variable
- return the variable that contains the result
=end

def repeater(str)
  stringy = str.chars
  doubled_arr = stringy.map do |letter|
                  letter * 2
                end
  doubled_arr.join
end

repeater("cat")

# test cases
p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''