=begin 
# * DONE 19m
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up. 

1. The input string will always be lower case but maybe empty.
2. If the character in the string is whitespace then pass over it as if it was an empty seat

I: string 
O: array of string 

Rules:
- for the whole length of the string 
  - first character in the string stands up first 
  - only one character is standing up at a time 
  - the array contains as many characters as are present in the input string 
- string can have spaces
  - ignore spaces but don't skip them all together 

Examples:
"hello"
Hello hEllo heLlo helLo hellO 

"two words"
Two words tWo words twO words two Words two wOrds...

" gap "
" Gap " " gAp " " gaP "

Data Structures:
I: string 
Interim: array 
O: array 

Aglrothm:
- if string is emtpy, return empty string 
- init wave_arr
- iterate over the whole length of the array 
- with each character/run of the wave 
  - if the current character is a space, next 

  - concatenatin of the following makes the wave
    - sitting = from starting index up to but not including current index 
    - standing is the current character 
    - waiting = current index + 1 to the end
  - concatenation gets pushed to wave_arr 
=end 

def wave(str)
  wave_arr = []

  (0...str.size).each do |idx|
    next if str[idx] == ' '
    sitting = str[0...idx]
    standing = str[idx].upcase
    waiting = str[idx + 1..-1]
 
    wave = sitting + standing + waiting 
    wave_arr << wave 
  end
  wave_arr
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == []

p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]