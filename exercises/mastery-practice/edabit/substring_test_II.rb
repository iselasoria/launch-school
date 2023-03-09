=begin
* DONE 13m30s
Given 2 strings, find out if there is a substring that appears in both strings. Return true if you find a substring that appears in both strings, or false if not. Only consider substrings that are longer than one letter long. 

I: two string 
O: boolean 

Rules:
- if there is at all a common substring in both words, true. False if not 
- if there are any empty strings in the input, automatic false 
- numbers can be in the string 
- case****


DS: 
I: strings 
Interim: arrays 
O: boolean 

Algorithm:

Helper Method: gen_subs(str)
- generate subs 

Main Method: substr_test(str)
- return false if str1 is empty or string2 is empty 

- generate substring for both strings 
- if any of the first string's subs are found in the second's return true 
  - if the result of an intersection is not empty 


=end 

def gen_subs(str)
  subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      slice  = str[st..nd]
      subs << slice if slice.size > 1
    end
  end
  subs
end 

def substr_test(str1, str2)
  return false if str1.empty? || str2.empty?
  str1_subs = gen_subs(str1)
  str2_subs = gen_subs(str2)

  common = str1_subs.intersection(str2_subs)
  common.empty? ? false : true
end
p substr_test('Something', 'Fun') == false 
p substr_test('Something', 'Home') == true
p substr_test('Something', '') == false
p substr_test('', 'Something') == false
p substr_test('Banana', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true