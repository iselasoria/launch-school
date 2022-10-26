=begin
--------------P
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise.
To be properly balanced, parentheses must occur in matching `(` and `)` pairs.

Note that balanced pairs must each start with a (, not a ).

Input:
- string
Output:
- boolean

Rules:
- Explicit:
  - parentheses must come in complementary pairs like `()` in order to meet the criteria
- Implicit:
  - if an input string contains an odd number of parentheses, we can discard it as it wont have a complementary parenthesis to match it
  - if an input string doesnt have equally matching opening and closing parentheses, we can discard it too
    - this is to say if a string has four opening parentheses and two closing parentheses, this wont pass so an even number is not the only criteria
  - if parentheses are only closing or only opening, the string is not balanced
  - if the first parenthesis is closing, the string is not balanced
Goal:
Determine if the parentheses are evenly matched with their complementary pair
--------------E
'What (is) this?' ---> This has one opening and one closing so it evaliuates to true
'((What)) (is this))?' ---> This has three opening parentheses and four closing parentheses, so it evaluates to false
')Hey!(' ---> This starts with a closing parenthesis so it evaluates to false


--------------D/M
Model Solution:
input: '((What)) (is this))?'
list =  ["(", "(", "W", "h", "a", "t", ")", ")", " ", "(", "i", "s", " ", "t", "h", "i", "s", ")", ")", "?"]
count opening parentheses:
list.count('(') ----> 3
count closing parentheses:
list count(')') ----> 2

---
'What ((is))) up('

--------------A
- initialize a variable that points to an array of characters in the input string
- check position of opening parenthesis
- check position of closing parenthesis
  - if open_position < closing position (if opening comes first)
    - count instances of opening parentheses
    - count instances of closing parentheses
      - if opening == closing
        - true
      - else
        - false
  - iterate over chars
    - if char '(' open_tally
    - if char ')' close_tally
    break if 
=end

def balanced?(string)
  list = string.chars

  opening_parentheses = list.count('(')
  closing_parentheses = list.count(')')

  # puts "Opening count: #{opening_parentheses}"
  # puts "Closing count: #{closing_parentheses}"

  open_position = list.index('(')
  closing_position = list.index(')')

  # puts "Open position #{open_position}"
  # puts "Closing position #{closing_position}"

  # puts open_position < closing_position

  return true if opening_parentheses == 0 && closing_parentheses == 0 # if no parenthesis present at all

  if (opening_parentheses == closing_parentheses) && (open_position < closing_position) # same number of open/close and the open comes first
    true
  else
    false
  end

  
end
# test cases
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false # idk what this is