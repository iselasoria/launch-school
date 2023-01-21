=begin 
* DONE 5m
 TODO Interview Practice
 
Write a method that takes a string as an argument and returns a new string in which every uppercase letter is replaced by its lowercase version, and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

I: string 
O: new string 

Goal: to swap the case for the letters 

Examples:
'CamelCase' 
'cAMELcASE'
'Tonight on XYZ-TV' 
'tONIGHT ON xyz-tv'

Data Structures:
arrays 

Algorithm:
- iterate over the string 
- if we find a lowercase, set it to uppercase 
- if we find an uppercase, set it to lowercase 

=end 

def swapcase(str)
  str.split.map do |word|
    word.chars.each do |letter|
      if letter == letter.downcase
        letter.upcase!
      elsif letter == letter.upcase 
        letter.downcase!
      end
    end.join
  end.join(' ')
end

# test cases 
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'