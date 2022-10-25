=begin
Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

Input: string
output: an array of strings 

Rules:
  - a plalindrome is case sensitive
  - must contain more than one letter
  - its characters are the same forwards and Backwards 
  - special characters count towards whether or not a string is palindromic 

Goal: return an array of only those substrings that are palindromes

--------E 
'abcd' ---> contains only unique characters so we discard the chance of palindrome ----> []
'madam' ---> ['madam', 'ada']
--------D 
--------A
- Helper method: substrings
  - initialize an empty array to hold the substrings
  - iterate over the input string
  - starting at index 0 and ending at the string
    - each iteration is a number
    - iterate one level deeper from that current number in the iteration and ending at the end of input string 
      - each iteration is a number that refers to the ending index 

- Helper method: is_palindrome?
  - read input String
    - if input string == input string reversed
      True
    - false otherwise 

- Main method: palidnromes 
  - read the input string 
    - call substrings helper on input string and store in a variable `subs`
    - select from `subs` only those substrings that are longer than 1 char
      - iterate over the newly created list of substrings 
        - with each iteration, call is_palindrome? on each element ie) each substring 
  - return only palindromic substrings 
        


=end



def substrings(str)
  output = []
  (0...str.length).each do |i|
    (i...str.length).each do |j|
      output << str[i..j]
    end
  end
  output
end

def is_palindrome?(str)
  str.chars == str.chars.reverse
end

def palindromes(str)
  subs = substrings(str)

  subs.keep_if {|sub| sub.size > 1}

  subs.select do |suby|
    is_palindrome?(suby)
  end
end


# palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == ['ll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada','adam-did-mada', 'dam-did-mad', 'am-did-ma', 
            'm-did-m', '-did-', 'did','-madam-', 'madam', 'ada', 'oo']
p palindromes('knitting cassettes') == ['nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']
