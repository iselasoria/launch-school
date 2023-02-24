=begin 
https://edabit.com/challenge/YRc8FrKtbHK4MCR7m

Create a function that takes a string and returns the reversed string. However there's a few rules to follow in order to make the challenge interesting:

The UPPERCASE/lowercase positions must be kept in the same order as the original string (see example #1 and #2).
Spaces must be kept in the same order as the original string (see example #3).


special_reverse_string("Edabit") ➞ "Tibade"

special_reverse_string("UPPER lower") ➞ "REWOL reppu"

special_reverse_string("1 23 456") ➞ "6 54 321"

    ##########################################
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
        PLEASE DON'T DELETE THISSSSSSSSSS
    #########################################
I: string 
O: string 

Rules:
- reverse the characters in the input string 
- uppercase/lowercase status stays the same!
- spaces stay in the same position 
Implict:
- special characters can be included in the input string 
  - they get reversed, treated the same as letters 

Examples / Model Solution:
input:   'Edabit'
upcase:   0_____
downcase: _12345 
reversed: tibade 
          Tibade 

input: 'addition(3, 2) = 5'
upcase  _________ ### think about special chars and upcase/downcase 
* if the string has no upcase letters, then just mind the space and reverse 

input:     "Where's your dog Daisy?"
spaces idx:        7    12   16
upcase:     "0________________17_____"

Data Structures:
I: string 
Interim: array of characters/hash to track positions  
O: string 

Algorithm:

Helper Method: case_checker(str, status)
  - takes a character 
  - if status is true, meaning it's meant to be capital 
    - upcase the character 
  - otherwise
    - downcase the character 


Main Method: special_reverse_string(str)
- iterate over string characters(and idx) and store in a hash the position of the spaces and store in `space_positions_hash` # {7 => ' ', 12 => ' ', 16 => ' '}
  - store in `case_hash` the status of each character # {0 = true, 1 => false, 2 => false, ...} # true is upcase 

- remove spaces from input string # "Where'syourdogDaisy?"
  - reverse chars "?ysiadgodruoys'erehw" and store in `result`

- itreate over the result and its index # "?ysiadg odru oys 'erehw"
  - if index is found in the space_positions_hash
    - insert into the stirng, the value at the key (idx) from space_positions_hash
  
=end 

def case_checker(str, status)
  status ? str.upcase : str.downcase
end


def special_reverse_string(str)
  str_shallow = str.dup
  space_positions_hash = {}
  case_hash = {}

 
  str.chars.each_with_index do |ch, idx|
    if ch == ch.upcase && ('A'..'Z').include?(ch)
      case_hash[idx] = true 
    else
      case_hash[idx] = false
    end
    if ch == ' '
      space_positions_hash[idx] = ch
    end
  end 
  
  rev_string = ''
  str = str.delete(' ')
  str.chars.reverse_each {|letter| rev_string << letter }
 


  results = rev_string
 
  str_shallow.chars.each_with_index do |letter, idx|
    if space_positions_hash.keys.include?(idx)
      results.insert(idx, space_positions_hash[idx])
    end 
  end 
  


  results.chars.map.with_index do |ch, idx| 
     case_checker(ch, case_hash[idx])
  end.join

end


def special_reverse_string(str)
  positions = {}

  str.chars.each_with_index do |char, idx|
    if char == " "
      positions[idx] = char 
    elsif char == char.upcase && ('a'..'z').include?(char.downcase)
      positions[idx] = true
    end 
  end 

  str = str.downcase.reverse.delete(' ')

  positions.each do |idx, value|
    if value == ' '
      str.insert(idx, value)
    elsif value == true
      str[idx] = str[idx].upcase
    end 
  end 

  str
end 

# # test cases 
# p special_reverse_string('Edabit') == 'Tibade'
# p special_reverse_string('UPPER lower') == 'REWOL reppu'
# p special_reverse_string('1 23 456') == '6 54 321'
# p special_reverse_string('Hello World!') == '!dlro Wolleh'
p special_reverse_string("Where's your dog Daisy?") #== "?ysiadg odru oys 'erehw"
# p special_reverse_string('addition(3, 2) = 5') == '5=)2,3(noit id d a'
# p special_reverse_string("It's known that CSS means Cascading Style Sheets") == "Stee hsely tsgn IDA csacs Naemsscta Htnwo Nks'ti"