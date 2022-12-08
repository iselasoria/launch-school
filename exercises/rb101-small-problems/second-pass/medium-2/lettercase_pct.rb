=begin
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.


Problem:
______

Input: string 
Output: hash 
Rules:

  explicit:
    - hash must contain three entries:
      - pct of chars that are lowercase 
      - pct of chars that are uppercase 
      - pct of chars that are special characters
    - assume string contains at least one character
  implicit:
    - spaces get counted under special characters 
    - format pct to 1 decimal place 

GOAL: to count the percentage of occurance of each of the three categories: uppercase, lowercase and special characters and return a hash where key is type and value is percentage formated to one decimal place 

Examples / Model Solution:
______
'abCdef 123'
lowercase => 5 
uppercase => 1
special   => 4

- to calculate pct:
  (100 * occurance) / total characters
  [5, 1, 4]
  100 * 5 -> 500 / 10 --> 50 pct
  100 * 1 -> 100 / 10 --> 10 pct 
  100 * 4 -> 400 / 10 --> 40 pct
returns: { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }

Data:
______
Data Points to Capture:
- character 
- count of each character

Data Structures in Use:
- in: string 
- interim: hash, arrays 
- out: hash

Algorithm:
___
Helper Method: pct(num, total)
def pct(number, total)
  (100.0 * number) / total
end

Helper Method: tally_case(str)
- initialize `lowercase`, `uppercase`, `neither`
  - iterate over string 
    - if current character is lowercase
      - increment lowercase 
    - otherwise if it is uppercase
      - increment uppercase
    - otherwise 
      - increment neither 
Main Method: letter_percentages(str)
- calculate `string_size`

- iterate over characters in the input string 
  - 
=end 


def pct(number, total)
  (100.0 * number) / total
end

def letter_percentages(str)
  lowercase = 0
  uppercase = 0
  neither = 0

  str.chars.each do |letter|
    p letter
    if letter == letter.downcase
      lowercase += 1
    elsif letter == letter.upcase
      uppercase += 1
    else
      neither += 1
    end
  end
  p lowercase
  p uppercase
  p neither

end



# test cases
p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }