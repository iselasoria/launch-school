=begin
Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.


----------Algo 
- get digits 
- get digits reversed
- check if they are the same, return true
- otheriwise retrun false 

=end

def palindromic_number?(num)
  num.digits == num.to_s.chars.map(&:to_i)
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true