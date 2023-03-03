=begin 
* DONE 6m58s
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string and you must return that string in an array where an uppercase letter is a person standing up. 
Rules
 1.  The input string will always be lower case but maybe empty.

 2.  If the character in the string is whitespace then pass over it as if it was an empty seat

wave("hello") => ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

I: string 
O: array of strings 

Rules:
- space matters but gets skipped as an empty space 
- waiting done/standing/waiting

Algorithm:
init waves = []
- iterate over the str characters 
  - skip spaces 
    - done from start to current index exclusive 
    - current index 
    - waiting from next to end 
    push ola to waves

return waves 

=end 

def wave(str)
  waves = []

  (0...str.size).each do |idx|
    next if str[idx] == ' '
    done = str[0...idx]
    waiting = str[idx+1..-1]
    standing = str[idx].upcase
    ola = done + standing + waiting
    waves << ola
  end
  waves
end

# test cases 
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave("") == [] 
p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]

