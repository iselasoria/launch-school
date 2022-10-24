=begin
--------------P
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise.
To be properly balanced, parentheses must occur in matching `(` and `)` pairs.

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

Goal:
Determine if the parentheses are evenly matched with their complementary pair
--------------E
'What (is) this?' ---> This has one opening and one closing so it evaliuates to true
'((What)) (is this))?' ---> This has three opening parentheses and four closing parentheses, so it evaluates to false
')Hey!(' ---> This only contains closing parentheses so it evaluates to false


--------------D
--------------A
=end

# test cases
balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false