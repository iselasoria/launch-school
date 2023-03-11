=begin 

* DONE 09m20s
Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

Examples
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

triple_double(12345, 12345) == 0

triple_double(666789, 12345667) == 1


I: two integers 
O: integer 

Rules:
- firrst number must have tripple any digit, 
- second number must have double any digit 

Examples:
451999277 --> 999
41177722899 --> 99


10560002 --> 000 
100 --> 00 

DS: 
integers 
arrays 
hashes 

Algorithm:
- identify the `thrice_repeat` digit 
- check if the count of the thrice_repeat digit is 2 in the next one 

=end 

def triple_double(num1, num2)
  thrice_repeat = num1.digits.reverse.tally.select{|num, ct| ct >= 3}.keys[0]


  return 0 if thrice_repeat.nil?

  num2.digits.reverse.count(thrice_repeat) >= 2 ? 1 : 0
end 

#####refactored 

def tally_me(arr)
  tally = Hash.new(0)
  arr.each do |ch|
    tally[ch] += 1
  end
  tally
end

def triple_double(num1, num2)
  tally = tally_me(num1.digits.reverse)
  thrice_repeat = tally.select {|num, ct| ct >= 3 && num1.to_s.chars.join.include?(num.to_s * 3)}.keys[0]


  return 0 if thrice_repeat.nil?
  p "searching #{thrice_repeat}"
  num2.digits.reverse.count(thrice_repeat) >= 2 ? 1 : 0 # TODO here, we need to count instances in all potential thrice_repeat
  
end 

# test cases 
p triple_double(451999277, 41177722899) == 1
p triple_double(1222345, 12345) == 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(1112, 122) == 0

p triple_double(10560002, 100) == 1
p triple_double(5999662822231605425, 156221151)
