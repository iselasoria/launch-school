=begin 
https://www.codewars.com/kata/58223370aef9fc03fd000071

Given a variable n,

If n is an integer, Return a string with dash'-'marks before and after each odd integer, but do not begin or end the string with a dash mark. If n is negative, then the negative sign should be removed.

If n is not an integer, return the string "nil".

I: integer 
O: string 

Rules:
- if `n` is an integer, return a string with dash before and after each odd int 
- DO NOT begin or end the string with a dash
  - even if the first or last digits are odd integers, don't add a dash before it
- If `n` is negative, remove the dash 
  - happens at the top 
- nil input returns nil object 
- 0 input returns '0' string object 


Examples:
input: 274
type:  eoe
dash:  2-7-4

input: 5311
type:  0000
dash:  5-3-1-1

input: 974302
type:  ooeoee
dash:  9-7-4-3-02


Data Structures:
I: integer or  nil
Iterim: array 
O: string

Algorithm:
- if input number is negative, make it positive 
- if input number is nil, return 'nil'

- initialize a string object `results_string`
- get the digits in the input integer 
- iterate over the digits
  - if the current number in the iteration is odd AND its index is not 0 OR its not -1
    push a dash 
    push the number 
    push another dash 
  - otherwise 
    push number 
- return results_string

=end 

def dashatize(input)
  return 'nil' if input == nil

  input < 0 ? clean_num = input * -1 : clean_num = input 

  results_string = []
  digits = clean_num.digits.reverse

  digits.each_with_index do |num, idx|
    if num.odd? && idx != 0 # use array size - 1
      # if results_string.last != '-'
        results_string << "-" unless results_string.last == '-'
        results_string << num.to_s 
        results_string << "-" 
      #else
        #results_string << num.to_s + '-'
      # end 

    else
      results_string << num.to_s
    end
  end
  # p results_string.last

  if results_string.last == '-'
    results_string.pop
  end
  results_string.join
end





p dashatize(274) == "2-7-4" 
p dashatize(5311) == "5-3-1-1"
p dashatize(86320) == "86-3-20"
p dashatize(974302) == "9-7-4-3-02"

p dashatize(nil) == "nil"
p dashatize(0) == "0"
# 
p dashatize(-1) == "1"
p dashatize(-28369) == "28-3-6-9"


# Expected: "5-2-7-9-2-5-9-5-2", instead got: "52-7-9-2-5-9-5-2" 
# first odd shouoldnt be completely ignored, it shouold still its preceding dash 