=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that takes twoa rguments, a string and a positive interger,
and prints the string as many times as the integer indicates

--------------------------PROBLEM----------------------------------------
Questions:
Input: integer and a string
Output: string
---------------------------RULES-----------------------------------------
Explicit: 
- pring string as many times as the integer
Implicit: 
--------------------------EXAMPLES---------------------------------------
repeat('Hello', 3)
Hello
Hello
Hello

----------------------------ALGO----------------------------------------
=end

def repeat(str, num)
  num.times do |word|
    puts str
  end
end

repeat('Hello', 3)