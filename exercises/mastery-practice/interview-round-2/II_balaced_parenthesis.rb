=begin 
* DONE 14m18s
Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

I: string 
O: boolean 

Rules:
- balanced parentheses means an even number of parentheses in the string 
- balanced:
  - '(' and ')'
- strings don't always have to include parenthesis, and if so it is balanced by default 
- cannot start with closing parentheses 


Examples:
'What (is this?' --> only 1, so false 


'((What) (is this))?' ---> equal number of parentheses types, true 

'What ((is))) up(' ---> closes the two existing pairs, and then adds another closing--> false 

DS:
Strings 
arrays 

Algorithm:
- init a balanced counter to 0 
- init not_valid_check set to ''
- iterate over the characters in the string 
  - with each iteration 
    - push the char to not_valid_check
      - if not_valid_check has a count of ')' to 1 and count of ')' to zero, return false 
    - when I find a '(', add to balanced 
    - when I find a ')' subtract from balanced
    - return false if the number is ever negative 
- true if balanced is equal to 0 

=end 

def balanced?(str)
  balanced = 0
  not_valid_check = ''
  str.each_char do | ch|
    not_valid_check << ch 
     # if check the first closing parentheses
    if ch == '('
      balanced += 1
    elsif ch == ')'
      balanced -= 1 
    end 
   
    return false if balanced < 0 # if there are more closing than opening
  end
  balanced.even?
end


p balanced?('What (is this?') == false
p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false