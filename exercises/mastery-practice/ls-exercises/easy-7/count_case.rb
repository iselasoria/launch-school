=begin 
# TODO comea back to this one 
Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the number of characters in the string that are lowercase letters, one the number of characters that are uppercase letters, and one the number of characters that are neither.


I: string 
O: hash 

Rules:
  - keys are the case type 
  - values are the number of characters that fit that type 
  - special characters are counted as neither 
    - spaces count as special characters 

Examples: 
'abCdef 123' == { lowercase: 5, uppercase: 1, neither: 4 }
'' = { lowercase: 0, uppercase: 0, neither: 0 }

Algorithm:
- initialize as hash woth 0 as default and lowercase, upercase, neither as keys
- iterate over the string 
  - if char is capital letter, then increment caps_count 
  - if char is a lowercase letter, then increment lower_count 
  - if it's other, then increment neither_count

=end 

def letter_case_count(str)
  case_hash = { :lowercase=> 0, uppercase: 0, neither: 0}


  str.chars.each do |ch|
    puts "Is #{ch} a lowercase letter: #{ch == ch.downcase}"
    puts "Is #{ch} a upcase letter: #{ch == ch.upcase}"
    if ch == ch.downcase!
      case_hash[:lowercase] += 1
    elsif ch == ch.upcase! 
      case_hash[:uppercase] = 1
    elsif 
      case_hash[:neither] = 1
    end
  end 
  case_hash
end

# test cases 
# p letter_case_count('abCdef 123') #== { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }