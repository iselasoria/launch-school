=begin
* DONE 18m36s
Write a method that takes a non-empty string argument, 
and returns the middle character or characters of the argument. 
If the argument has an odd length, you should return exactly one character. 
If the argument has an even length, you should return exactly two characters.


Input: string 
Output: string 

Rules:
- srting is non-empty
- returns middle character 
  - odd length returns one middle character
  - even length returns two middle characters
- implicit: spaces count toward the count of characters 

Goal: to return the middle of the string 

Examples:
'I love ruby' ==> length is 11
'I love ruby'
 012345678910
 return 'e' at position 5

'Launch School' ==> legth is 12
'Launch School'
 0123456789101112
 returns ' ' at position 6

 'Launchschool' ==> length is 12
  01234567891011
  returns 'hs' at position 5 and 6 --> half and half - 1

Data: 
-in: string 
-interim: array 
-out: string 

Algorithm:
- determine first half
- determine second half 
- if size of string is odd, return right in the middle + 1
- otherwise, return last of first half and first of second 


=end

def center_of(str)
  middle_char = str[str.size/2]

  middle_char
  str.size.odd? ? middle_char : str[(str.size / 2 )- 1..(str.size / 2)]
end

# test cases 
p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'