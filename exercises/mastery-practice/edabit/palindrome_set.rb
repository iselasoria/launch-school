=begin 
* DONE 41m00s
Strings can be segregated into both their letter and digit components.

    A double palindrome is when a string's letter component and digit component are both palindromes.
    A single-palindrome is when either (but not both) the letter component or the digit component are palindromes.

To illustrate:

"cab97ac79"
# double-palindrome: "cabac" and "9779" are both palindromes.

"1abc4de1"
# single-palindrome: "141" is a palindrome.

Write a function that maps double palindromes to the number 2, single palindromes to the number 1, and everything else to the number 0.

Examples
palindrome_set(["cb77c", "ccc888", "ccc789", "abc89"]) ➞ [2, 2, 1, 0]

palindrome_set(["789", "555", "ccc", "abba"]) ➞ [0, 1, 1, 1]

palindrome_set(["7a", "5f", "6c"]) ➞ [2, 2, 2]

Notes
    A string is composed of only letters or only numbers, can be at most a single palindrome (see example #2).
    All single character components are trivially palindromes (see example #3).
    All letters will be lower cased.

I: array of strings 
O: array of integers 

Rules:
- palindrome:
  - same forward and backwar 

- a string can be all numbers (str) or all string characters, if so it can only have the chance at being single palindrome 
- for strings with numbers and alphabetic characters, we must look at numbers and alphabetic chars individually to determine if it's a palindrome 
- single num and single charactert, automatic palindrome
- empty string return an array of 0 

Examples:

input: ["18a99b89cc881ba", "p7o8p987", "p7o", "p7o8"]          ======  [1, 2, 1, 0]

nums:   189989881            78987        7     78
check       false             true      true    false  
chars:    abccba              pop         po      po 
check:       true             true       false   false

palindrome types:
check       false             true      true      false  
check:       true             true       false   false
result_arr    1                 2           1     0 

DS:
I: arrays 
O: arrays 


Algorithm:
Helper Method: palindrome?(str) --> boolean 

Main Method: palindrome_set(arr)

# detatch letters from numbers store in different arrays `numeric` and `letters`
- init mother_numeric to []
- init mother_letters to []
  - iterate over array 
    - with each item, run partition on numbers and store in either mother_letters or mother_numeric
# account for empty values where there was only either a letters string or a numeric stirng 
  - tranform the mother arrays to contain 
  - ['&','@']
# for each array `mother_numeric` and `mother_letters`
  - iteterate over arr --> transform to booleans
    - check for palindrome 
-  numeric and letters --> booleans now 
- zip numeric and letters store in `paired_and_compared`
- transform `paired_and_compared` to a count of true 

=end 

def palindrome?(str)
  return false if str.empty? # this doesn't mean it's an actual string -_-
  str == str.reverse
end

# p palindrome?('ab')

def palindrome_set(arr)
  return [0] if arr[0].empty? 

  mother_numeric = []
  mother_letters = []
  arr.each do |tiny_str|
    numeric, letters = tiny_str.chars.partition{|item| item.to_i.to_s == item}
    mother_numeric << numeric 
    mother_letters << letters 
  end
  p mother_numeric
  p mother_letters
  # mother_letters.map! do |item| 
  #   if !item.empty?
  #     item 
  #   else
  #     ['&','@']
  #   end
  # end 
  # mother_numeric.map! do |item|
  #   if !item.empty?
  #     item 
  #   else
  #     ['&','@']
  #   end
  # end
  mother_numeric.map! {|item| palindrome?(item)}
  mother_letters.map! {|item| palindrome?(item)}

  paired_and_compared = (mother_letters).zip(mother_numeric)
  # p paired_and_compared
  paired_and_compared.map {|pair| pair.count(true)}

end

# p palindrome_set(["cb77c", "ccc888", "ccc789", "abc89"]) ==  [2, 2, 1, 0]
# p palindrome_set(["18a99b89cc881ba", "p7o8p987", "p7o", "p7o8"]) ==  [1, 2, 1, 0]
p palindrome_set(["ab9a", "abba", "aa78bb8bbaa7", "a88a"]) #==  [2, 1, 2, 2]
# p palindrome_set(["789", "555", "ccc", "abba"]) ==  [0, 1, 1, 1]
# p palindrome_set(["7a", "5f", "6c"]) ==  [2, 2, 2]
# p palindrome_set(["7ab", "5fc", "6cd"]) ==  [1, 1, 1]
# p palindrome_set(["87ab", "15fc", "26cd"]) ==  [0, 0, 0]
# p palindrome_set(["1234ab", "144a441"]) ==  [0, 2]

# p palindrome_set([""]) ==  [0]