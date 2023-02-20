=begin
https://www.codewars.com/kata/5a3f2925b6cfd78fb0000040/train/ruby

Given a string, return the minimal number of parenthesis reversals needed to make balanced parenthesis.

For example:
solve(")(") = 2 Because we need to reverse ")" to "(" and "(" to ")". These are 2 reversals. 
solve("(((())") = 1 We need to reverse just one "(" parenthesis to make it balanced.
solve("(((") = -1 Not possible to form balanced parenthesis. Return -1.

Parenthesis will be either "(" or ")".

More examples in the test cases.

Good luck.

I: string 
O: integer 

Rules:
- parenthesis are balanced when an opening parenthesis has its closing companion 
- if only one kind (open or closed) are present, return -1 

Goal: to return the number of parenthesis flips needed to make the string balanced

Examples:
")()("
 coco--> middle pair is balanced, two outer ones need to be flipped 

"(((" ---> not possible to balace, returns -1 
 ooo

"())()))))()()("
 occocccccococo
 
"() ) () )))) () () ("

Data Structures:
- I: string
- Interim: strings 
- O: integer 

Notes:
- when tally is the same for both, if the closing parenthesis comes first, that indicates a flip 
- alternate dump into a new string open, close, open close 
  - each time the orientation of the parenthesis doesnt match, increase a flips_counter by 1 
- open parenthesis have an even index 

Algorithm:
- if all characters of the string are the same, return -1 

- iterate over the split characters by valid pair to see only `leftovers` and store 


=end 

def solve(str)
  return -1 if str.chars.uniq.size == 1
  leftovers = str.split('()')

  p leftovers
  tally_flips = 0
  flipped_str = ''
  leftovers.each do |item|
    item.chars.each_with_index do |ch, idx|
      if idx.even? && ch != '('
        tally_flips += 1 
        flipped_str << '('
      elsif idx.odd? && ch != ')'
        tally_flips +=1 
        flipped_str << ')'
      end
    end
  end
  p tally_flips
  p flipped_str
end



def solve(str)
  return -1 if str.size.odd?
  
  str = str.dup
  str.gsub!('()', '') while str.include?('()')
  
  closed_paren_count = str.count(')')
  open_paren_count = str.count('(')
  
  closed_paren_count.fdiv(2).ceil + open_paren_count.fdiv(2).ceil
end
# test cases 

# p solve(")()(") == 2
# p solve("((()") == 1
p solve("())(((") #== 3

# p solve("(((") == -1

p solve("())()))))()()(") #== 4
