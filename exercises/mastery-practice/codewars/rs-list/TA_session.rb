# Have the method division_stringified(num1, num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas.
#
# If an answer is only 3 digits long, return the number with no commas.
#
# Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".
#
# Note: 2 divided by 3 should return '1'

=begin 

I: two integers 
O: string 

Rules:
- num1 gets divided by num2 
- return the result as a string, formatted with commas
- Impplicit Rules:
  - numbers have to be divided as floats 
  - then rounded up 
- execption?: num1 is 1, return will be zero --> maybe? floor?

Examples:
input: (2, 3) 
       2.0 / 3.0
       0.666
       ceiling brings me up to the next number 
       number to string 

input: (6874, 67)
        6874.0 / 67.0
        102.5
        ceiling brings me up to 103 
        number then goes to string 

        (503394930, 43))
        11706859<--- after rounding 
        '11706859'

Data Structures:
I: two integers 
Interim: floats 
O: string (number) formatted 

Notes:
* can split the number at place values 
  - hundreds 
  - thousands
  ...
Algorithm:
Helper Method: format_num(num)
  - get the thousands, hundrds, tens 
  - join with a comma 

Main Method: division_stringified(num1, num2)
- if num1 is 1, then return '0' 

- cast each number to float 
- perform division on the numbers
- decided whther to round up to down
  - perform divmod on division result (includes the decimal) and the intger equivalent of the division result and store in `remainder`
  - if remainder[1] is less than to 0.5, then round down
  - if it's greater than or equal to 0.5 then round up
  --> new divison result 
- call format_num(num)


=end
def format_num(num)
  places = 1000 # thousands place 
  # placement_condition = places.map {|item| num.divmod(item) }
  hundreads = num.divmod(places)
  hundreads.map.with_index do |item, idx| 
    if idx == 0
      item.divmod(places)
    else
      item
    end
  end.flatten.join(',')

end

p format_num(100000)

def rounding(num)
  round_up_diff = (num.ceil - num).abs
  round_down_diff = (num.floor - num).abs
  round_up_diff <= round_down_diff ? num.ceil : num.floor
end 

def division_stringified(num1, num2)
  new_str = []

  result = rounding(num1.to_f / num2).to_s

  return result if result.size <= 3
  result.reverse.chars.each_with_index do |char, idx|
    new_str << ',' if idx % 3 == 0
    new_str << char 
  end 

  new_str = new_str.reverse
  new_str.pop if new_str.last == ','
  new_str.join
end 



# def division_stringified(num1, num2)
#   return '0' if num1 == 1

#   division = (num1.to_f / num2.to_f) # 102.59
#   if division > 1
#     whole_and_remainder = division.divmod(division.to_i) # 102.59.divmod(102)
#     if whole_and_remainder[1] < 0.5
#       division = division.floor 
#     else
#       division = division.ceil 
#     end
#   else
#     division = division.ceil
#   end
# division
  
#   # div_formated = format_num(division)
# end

# p division_stringified(2, 3) #== "1" ### handle edge case when retuyrn is only deciaml 
# p division_stringified(5, 2) #== "3"
# p division_stringified(7, 3) #== "2"
# p division_stringified(6874, 67) #== "103"
# p division_stringified(503394930, 43) #== "11,706,859"
# p division_stringified(100000, 1) #== "100,000"

# p division_stringified(1, 10) == "0"
# p division_stringified(1, 30) == "0"

=begin 

input and out out is a good things!

buuld up rules with test cases 

- caution about getting to algo too soon!
- caution be language agnostic!!!!
- good to use simple methods when you cant remember bad ass ones 

=end 

# 11706859.divmod(1000) ---> 11706, 859