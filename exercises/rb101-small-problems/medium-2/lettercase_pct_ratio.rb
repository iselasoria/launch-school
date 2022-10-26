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
    - handle case where only one case is present
      - if no upper and no lower
        - return a hash {:lowercase => 0, :uppercase => 0, :other => number_here}

- main method
- initialize an array containing the result of case_count which is has ex: {:lowercase=>5, :uppercase=>1, :other=>4}

  - iterate each with object to create a new hash
    - keys will be keys from the case_count hash
    - values will be the return of calling pct on the value from the case_counts hash and using the string length as the total

=end

def pct(number, total)
  (100.0 * number) / total
end

def count_case(str)
  list = str.chars
  upper = 0
  lower = 0
  other = 0

  prelim = list.each_with_object({}) do |letter, hash|

            alpha_low = ('a'..'z').to_a
            alpha_cap = ('A'..'Z').to_a 
          

            if !alpha_low.include?(letter) && !alpha_cap.include?(letter)
              hash[:neither] = other += 1
            elsif letter == letter.upcase
              hash[:uppercase] = upper += 1
            elsif letter == letter.downcase
              hash[:lowercase] = lower += 1
            end
          end
# handles the edgecases where only one case is present
  if  upper == 0 && lower == 0
    prelim[:lowercase] = 0
    prelim[:uppercase] = 0
    prelim[:neither] = other
  elsif upper == 0 && other == 0
    prelim[:lowercase] = lower
    prelim[:uppercase] = 0
    prelim[:neither] = 0
  elsif lower == 0 && other == 0
    prelim[:lowercase] = 0
    prelim[:uppercase] = upper
    prelim[:neither] = 0
  end
  
  prelim
end


def letter_percentages(str)
  case_counts = count_case(str)


  letter_pct = case_counts.each_with_object({}) do |(case_type, num), hash|
                hash[case_type] = pct(num, str.size)
              end
  letter_pct.sort_by {|type, pct| pct}.to_h
end

# p count_case('AbCd +Ef')

# test cases
p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

# DONE