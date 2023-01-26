=begin 
* DONE 15m
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

I: Integer
O: integer 

Goal: determine if the input is a double number, if it is, return it as is, otherwise return it double 


Rules:
- a double number is:
  - even number of digits 
  - leftside digits are exactly the same as the rightside digits --> this implies cuttint in half
- single digit input returns a singe digit

Examples:
- 44, 4444, 103103 and 7676 are double numbers
- 444, 334433 and 107 are not 

- 37 ---> left and right are not the same, so not a double number 
returns double --> 74



Data Structures:
arrays 

Algorithm:
- get the digits in the number 
- iterate though the digits 
  - if the first and the last are the same adn the size of the digits array is even, 
    - return input * 2

=end
# TODO redo this one

def twice(num)
  ds = num.digits.reverse

  middle = ds.size / 2

  left_slice = ds[0...middle]
  right_slice = ds[middle..-1]
  return num if left_slice == right_slice
  return num * 2


end

# test cases 
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214

p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10