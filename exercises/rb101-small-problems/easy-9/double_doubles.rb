=begin
-----------------------INSTRUCTIONS--------------------------------------
A double number is a number with an even number of digits whose left-side
digits are exactly the samas its right-side digits. For example. 
44, 103103, and 7676 are all double numbers 444, 334433, and 107 are not.

Write a methof that returns 2 times the number provided as an arguments,
unless the argument is a double numbers; doulble numbers should be returned as-is.
--------------------------PROBLEM----------------------------------------
Questions:
Input: integer
Output: inter 
---------------------------RULES-----------------------------------------
Explicit: 
- both the number and their order has to be the same for it to be a double number
Implicit: 
- not mirror image numbers like 443344
--------------------------EXAMPLES---------------------------------------

----------------------------ALGO----------------------------------------
- set local variabel to hold the string characters in the number
- iterate through the collection of characters-- for this step we'll need integers instead of chars
  - if the character in the current iteration is a double, return the number
      - doubles:
        - if the first half is equal to the second half
  - elsif, the character at the current iteration is not a double, multiply it by 2
=end

def halfsies(num)
  individuals = num.to_s.chars
  len = individuals.length
  first_half = individuals[0, individuals.size / 2]
  second_half = individuals[individuals.size / 2 , individuals.size - 1]
 
  if len.odd?
    false
  elsif len.even? && first_half == second_half
    true
  end
end

def twice(number)
  if halfsies(number)
    number
  else
    number * 2
  end
end


# p twice(444) #== 888
# p twice(107) #== 214

# test cases
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# * DONE