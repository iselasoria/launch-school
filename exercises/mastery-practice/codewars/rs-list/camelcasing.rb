=begin 

Complete the solution so that the function will break up camel casing, using a space between words.
Example

"camelCasing"  =>  "camel Casing"
"identifier"   =>  "identifier"
""             =>  ""

I: string 
O:string 


Rules:
- a new "word" begins when we find a capital letter

Examples:
"camelCasing"
 'camel Casing'

"camelCasingTest"
'camel Casing Test'

Data Structures:
I: string 
Interim: array
O: string 

Algorithm:
- initialize words_arr []
- iterate over the string characters 
  - temp_word = ''
  - if letter is lowercase, push to temp_word
  - if it's capital letter 
    - push temp_word into words_arr
    - reset temp_word to ''
    - push the current character --> cap letter 
return the words_arr joined by a space 
=end 

def solution(str)
  words_arr = []
  temp_word = ''

  str.chars.each do |letter|
    if letter == letter.downcase 
      temp_word << letter # Ca
      temp_word
    elsif letter == letter.upcase
      words_arr << temp_word
      temp_word = ''
      temp_word << letter
      # p temp_word
    end 
  end
  words_arr << temp_word
  words_arr.join(' ')
end


p solution('camelCasing')== 'camel Casing'
p solution('camelCasingTest') == 'camel Casing Test'

# refactor to only use pushing each item adn space when you find upercase 