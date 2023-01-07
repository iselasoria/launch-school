=begin 
Write a method that will take a short line of text, and print it within a box.

EXAMPLES:
print_in_box('To boldly go where no one has gone before.')
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+

You may assume that the input will always fit in your terminal window.


Input: string 
Output: a series of strings 

Rules:
  - max 150 chars--> terminal size
   - the text will always fit
  - there exist the following lines:
    - border
    - empty--> size of the string 
    - string --> padded 
    - empty--> suze of the string 
    - string --> padded 
    - border 
=end 


def border(str)
  puts "+-" + "-" * str.size + "-+"
end

def empty_line(str)
  puts "|" + " " * (str.size + 2) + "|"
end

def text_line(str)
  puts "| #{str} |"
end


def print_in_box(str)
  border(str)
  empty_line(str)
  text_line(str)
  empty_line(str)
  border(str)

end

p print_in_box("To boldly go where no one has gone before. ")