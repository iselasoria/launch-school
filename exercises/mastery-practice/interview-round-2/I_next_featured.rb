=begin 
* DONE 15m41s
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. 
Return an error message if there is no next featured number.


I: int 
O: int 

Rules:
  - Featured Numbers:
    - odd
    - multiple of 7 
    - digtis are unique

  - starting from the input integer 
    - check every number to see if its featured 
      - retun the first featured you find
  - return error message if no number is found 

Examples:
input: 12
rule out evens 

13 --not divisible by 7
15 --not divisible by 7
17 --not divisible by 7
19 --not divisible by 7
21 --not divisible by 7

DS:
arrays 

Algorithm:
Helper Method: is_featured?(n)
  - return true if divisible by 7 AND all unique digits AND odd 

Main Method: featured(num)

- init current_num to num 
- runner = 0

- enter a loop 
  - if num.even? && runner 0 
    current_num incremenets by 1
  - otherwise, incremembnet by 2

  check tracker with the is_featured? method, return first truthy 


=end 

def is_featured?(n)
  n.odd? && (n.digits.uniq.size == n.digits.size) && (n % 7 == 0)
end

def featured(num)
  return "There is no possible number that fulfills those require" if num.digits.size >= 10

  current_num = num 
  runner = 0

  loop do 
    if num.even? && runner == 0
      current_num += 1
    else
      current_num += 2
    end
    return current_num if is_featured?(current_num)


  end
  
end 

# test cases:
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547

# p featured(999_999_987) == 1_023_456_987
p featured(9_999_999_999) # -> There is no possible number that fulfills those require