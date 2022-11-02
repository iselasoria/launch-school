=begin
Write another method that returns true if the string passed as an argument is a palindrome,
false otherwise. This time, however, your method should be case-insensitive, and it should
ignore all non-alphanumeric characters. If you wish, you may simplify things by calling
the palindrome? method you wrote in the previous exercise.


------------------------------------E
'356a653'
 356
    a
     653
 ---> the method finds every character in the same order in either direction

'123ab321'
 123
    a      -----|
     b     -----|
      321
  --------> here the method finds a b when it goes backward and an a when going forward, so not a plaindrome

------------------------------------A
- clean the string 
  - downcasing all 
  - deleting anything that is not a letter or a number

=end

def palindrome?(str)
  str == str.reverse ? true : false
end

def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

# test cases
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false