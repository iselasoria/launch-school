=begin 
There are two types of potions:

    Growing potion: "A"
    Shrinking potion: "B"

    If "A" immediately follows a digit, add 1 to the digit.
    If "B" immediately follows a digit, subtract 1 from the digit.

Create a function that returns a string according to these rules, removing the potions once they've been consumed.

Examples
after_potion("3A78B51") ➞ "47751"
# 3 grows to 4, 8 shrinks to 7

after_potion("9999B") ➞ "9998"

after_potion("9A123") ➞ "10123"

after_potion("567") ➞ "567"

Notes

    Digits that do not have a potion on their immediate right should be left alone.
    A digit will always either be followed by zero or exactly 1 potion.

I: string 
O: string 

Rules:
- A--> adds 1 
- B--> subtracts 1 
- a potion affects the number directly before it only 
- end result should not have any potion 
- if next number is numeric, then I can store the current num 

Examples:
- "567" --> "567"

-"1A2A3A4A" -> '2345'
  23

DS:
I: strings
interim: arrays 

Algorithm:
- init after_str to ''

iterate over the characters in input string and their index 
  - with each one if the next item is not a number (it's a letter)
      - from the current number, either subtract 1 or add 1
  - otherwise, if the next number is a number, 
      - push current into `after_str`

=end 

def after_potion(str)
  after_str = ''

  str.chars.each_with_index do |ch, idx|
    
    if str.chars[idx + 1] == 'A'  # if next num is 
      ch = ch.to_i 
      ch += 1
      after_str << ch.to_s
    elsif str.chars[idx + 1] == 'B'
      ch = ch.to_i
      ch -= 1
      after_str << ch.to_s
    else# next char Numeric -> looks at next item 

      after_str << ch unless (ch == 'A' || ch == 'B')
    end
  end
  after_str#.delete('^0-9')
end

p after_potion("567") == "567"
p after_potion("3A78B51") == "47751"
p after_potion("9999B") == "9998"
p after_potion("9A123") == "10123"
p after_potion("1A2A3A4A") == "2345"
p after_potion("9B8B7B6A") == "8767"