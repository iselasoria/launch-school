
# * DONE 22m
# You have to create a method that takes in a string
# and outputs the same string processed in a particular way.
#
# The method should insert ONLY after the first occurence of each character of the input string
# all the alphabet letters that:
#
# -are NOT in the original string
# -come after the letter of the string you are processing
#
# Each added letter should be in uppercase,
# the letters of the original string will always be in lowercase.
#
# Example:
#
# input: "holly"
#
# missing letters: "a,b,c,d,e,f,g,i,j,k,m,n,p,q,r,s,t,u,v,w,x,z"
#
# output: "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
#
# You don't need to validate input,
# the input string will always contain a certain amount of lowercase letters
# (min 1 / max 50).

=begin 

I: str 
O: string 

Rules:
  - intake a word 
  - alphabet_remainder is the difference between the full alphabet and the letters in the word <- not in word
  - after each character in the input string, we need to append the remainder of the alphabet after that letter 
  - only append remainder of the alphabet if this is the first time the character is found in the input string 
  - characters in the string are lowercase and alphabet_remainder is uppercase 
- if string contains one character, then return that character <-- 

Examples:
input:  'holly'
        [h o l l y]
          ^ insert the remaidner from the letter after h of the alphabet 
        [h o l l y]
            ^inset the remaidner from the letter after o 
# anythig that has an ordinal greater than the current character 
Data Structures:
I: string 
Interim: array of characters 
O: string 

Algorithm:
- get the difference between a full alphabet and an array of characters in the input string -> NOT in the string 

-results = ''
- iterate over the chracters of the input string # h 
  - with each character
    - dump into the results
    - if the count of the current character in the results is greater than 1 
      # don't add anything push empty string 
    - otherwise # if this is the first time I find the character 
      - select from the alphabet_remainder, those characters that have ordinals greater than the current char [i j k l m n o....z] upcase these! and join selection 

=end 

def insert_missing_letters(str)
  alphabet_remainder = (('a'..'z').to_a) - (str.chars)

  results = ''
  str.chars.each do |ch|
    results << ch 
    if results.count(ch) > 1
      results << ''
    else
      results << alphabet_remainder.select {|item| item.ord > ch.ord }.join.upcase 
    end
  end
  results
end 

p insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
p insert_missing_letters("fred") == "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
p insert_missing_letters("z") == "z"
p insert_missing_letters("efgh") == "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"