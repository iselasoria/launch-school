=begin
* DONE 3m
Create a function that takes a string and returns true if the sum of the position of every letter in the alphabet is even and false if the sum is odd.

is_alpha("i'am king")  ➞ true
# 9 + 1 + 13 + 11 + 9 + 14 + 7 = 64 (even)

is_alpha("True") ➞ true
# 20 + 18 + 21 + 5= 64 (even)

is_alpha("alexa") ➞ false
# 1 + 12 + 5 + 24 + 1= 43 (odd)

=end 

def is_alpha(str)
  alpha = ('a'..'z').to_a.zip(1..26).to_h 

  val = str.chars.map {|ch| alpha[ch]}.compact.inject{|i, sum| i + sum}#.sum
  val.even? ? true : false 
end

p is_alpha("i'am king") == true
p is_alpha("True") == true
p is_alpha("alexa") == false