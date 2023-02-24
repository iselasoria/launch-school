=begin 
https://www.codewars.com/kata/529b418d533b76924600085d

Complete the function/method so that it takes a PascalCase string and returns the string in snake_case notation. Lowercase characters can be numbers. If the method gets a number as input, it should return a string.

"TestController"  -->  "test_controller"
"MoviesAndBooks"  -->  "movies_and_books"
"App7Test"        -->  "app7_test"
1                 -->  "1"


I: string or number 
O: string 

Rules:
- PascaleCase means every word is separated by an uppercase character 
- snake_case means every word is separated by an underscore 
- if there is a number in the string in PascalCase, it gets grouped with the preceding word 
  - words are only ever split at uppercase characters 
- if the input is an ineger, return the string equivalent 

Examples:
input: 'TestController'
        Test Controller ---> starts a new word at the capital letter 
        test controller --> downcase 
        test_controller --> joined with '_'

input: 'App7Test'    
        App7 Test
        app7 test 
        app7_test 

Data Structures:
I: string 
Interim: arrays of words --> need to consider characters 
O: string 

Algorithm:
- if input is a number, return the string equivalent 

- init words_col = [] # ['Test','Controller']
- init word = ''
- iterate over the characters in the input string 
  - push chars to word 
  - when I find an upcased character
    - push word to words_col 
    - reset word to empty 

- transform words_col to downcased all chars in the words ["test","controller"]
- join by '_' and return 
=end 

# def to_underscore(input_object)
#   return input_object.to_s if input_object.kind_of? Integer 
  
#   words_col = []
#   word = ''

#   input_object[0...-1].chars.each_with_index do |char, idx| 
#     # if word and words_col are empty, push character to word 
#     # keep pushing into word unless you find an upcase in the next iteration
#     # before you hit the next capital letter, store the current word in words_col 
#     #the word should be reset to ''
   
#     word << char if words_col.empty? && word.empty? 
#     word << char unless input_object[idx + 1] == input_object[idx + 1].upcase 
#     words_col << word 
#     word = ''
#   end
#   words_col
# end 

def to_underscore(input_object)
  return input_object.to_s if input_object.kind_of? Integer 
  
  input_object.chars.map.with_index do |ch, idx|
    if ch == ch.to_i.to_s 
      ch
    elsif ch == ch.upcase && idx != 0
      '_' + ch.downcase 
    elsif ch == ch.upcase
      ch.downcase
    else
      ch
    end
  end.join

end

str = 'myCamelCaseString'
arr = str.split(/(?=[A-Z])/)
p arr
https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby
# test cases 
# p to_underscore("TestTube")
# p to_underscore("TestController") == "test_controller"
# p to_underscore("MoviesAndBooks") == "movies_and_books"
# p to_underscore("App7Test") == "app7_test"
# p to_underscore("ADogIsHere") == "a_dog_is_here"
# p to_underscore(1) =="1"
