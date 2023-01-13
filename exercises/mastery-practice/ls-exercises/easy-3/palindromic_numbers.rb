=begin 
* DONE 1m48s
Write a method that returns true if its integer argument is palindromic, 
false otherwise. A palindromic number reads the same forwards and backwards.


=end 

def palindromic_number?(num)
  stringify = num.to_s.chars.join
  stringify == stringify.reverse
end

# test cases
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true