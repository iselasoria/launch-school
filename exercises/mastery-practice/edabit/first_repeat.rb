=begin 
* DONE 7m18s
Create a function that takes a string and returns the first character that repeats. If there is no repeat of a character, then return "-1".
Examples

first_repeat("legolas") ➞ "l"

first_repeat("Gandalf") ➞ "a"

first_repeat("Balrog") ➞ "-1"

first_repeat("Isildur") ➞ "-1"

Notes

Tests are case sensitive.

I: string 
O: string 

Rules:
- return -1 if there are only unique characters 

- count the occurences of letters 
- return the firs letter that repeats 

Examples:
input: 'pippin'
p -> 3

input: 'Isildur'
** check for case sensitivity 
  - return character if the count is more than 1

DS:
- arrays of characters 

Algorithm:
- iterate over the characters in the input string 
  - for each char 
  ** case matters!
    - return ch if current character count is more than 1 in the whole string 

- '-1'
=end 

def first_repeat(str)
  str.chars.each do |ch|
    return ch if str.count(ch) > 1
  end

  '-1'
end 

p first_repeat("legolas") == "l"
p first_repeat("Balrog") == "-1"
p first_repeat("Isildur") == "-1"
p first_repeat("Gollum") == "l"
p first_repeat("Galadriel") == "a"
p first_repeat("pippin") == "p"
p first_repeat("Saruman") == "a"