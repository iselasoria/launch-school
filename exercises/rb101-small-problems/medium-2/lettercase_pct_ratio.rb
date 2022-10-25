=begin
In the easy exercises, we worked on a problem where we had to count the number of 
uppercase and lowercase characters, as well as characters that were neither of those two. 
Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: 
- one represents the percentage of characters in the string that are lowercase letters, 
- one the percentage of characters that are uppercase letters, 
- and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

----------P
Input: string
Output: hash

Rules:
- explicit:
  - entry 1 ---> lowercase pct
  - entry 2 ---> uppercase pct
  - entry 3 ---> neither pct
- implicit:
  - strings will never be empty
  - spaces count toward 'neither'
----------E
letter_percentages('abCdef 123') ---> 5 out of 10, 1 out of 10, 4 out of 10 ---> { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') ---> 3 out of 8, 3 out of 8, 2 out of 8 ---> { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') ---> 0 out of 3, 0 out of 3, 3 out of 3 ---> { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
----------D/M
Model Solution:
pct = (100.0 * number) / total ------> we want floating point numbers
- 'abCdef 123' ---> (100.0 * 5)/ 8
----------A
helper method to calculate pct
- define pct(number, total)
  - return (100.0 * number) / total

define helper method count_case(str)
- initialize variables: upper, lower, other
    - initialize an array of characters containing the characters from the input string
    - iterate over string characters
      - if current element is equal to element.upcase
        - upper += 1
      - if current element is equal to element.downcase
        - lower += 1
      - else
        - other += 1

- main method
- initialize an array containing a list of characters in the string
  - count capitals
    - call pct
  - count lowercase
    - call pct
  - count all other chars
    - call pct

  - initialize empty hash
    - iterate 3 times
      - set hash at lower equal to lower_pct
      - set hash at upper equal to upper_pct
      - set hash at other equal to other_pct
=end

def pct(number, total)
  (100.0 * number) / total
end

def count_case(str)
  list = str.chars
  upper = 0
  lower = 0
  other = 0

  list.each_with_object({}) do |letter, hash|
    if letter == letter.upcase
      hash[:uppercase] = upper += 1
    elsif letter == letter.downcase
      hash[:lowercase] = lower += 1
    else
      hash[:other] = other += 1
    end
  end
  

end
# todo currently not working, needs to count case better, come back to algo

p count_case('123')

# test cases
# p letter_percentages('abCdef 123') #== { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
# p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
# p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

