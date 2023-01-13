=begin
18m47s
In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, 
unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year
unless the year is evenly divisible by 400. Assume this rule is good for any year greater than year 0. 
Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.


Rules:
- the following area true of leap years
  - divisible by 4 and NOT by 100
  - divisible by 100 AND divisible by 400 

Examples: 
2016
2016 / 4   --> 504
                      \____ even when divided by 4 AND not even when divided by 100 
                      /
2016 / 100 --> 20.16

2016 / 400 --> 5.04 ----> if it is divisible by 100, we need to check once more because if it is divisible by 400 it could still be a leap year

1900
1900 / 4   --> 475 \_____ divisible by 4, BUT this is also divisible by 100 so this makes it not a leap year
1900 / 100 --> 19  /
1900 / 400 --> 4.75

Data:
integers

Algorithm:
- `by_four` check if the number is divisible by 4 
  - if it is not, short circuit and return false
  - otherwise, 
    - check if it is divisible by 100 AND by 400, if it is return true 
    - otherwise return false 
=end

def leap_year?(year)
  by_four = year % 4 == 0

  if by_four && !(year % 100 == 0)
    return true 
  elsif (year % 100 == 0) && (year % 400 == 0)
    return true
  else
    return false
  end
end


p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true