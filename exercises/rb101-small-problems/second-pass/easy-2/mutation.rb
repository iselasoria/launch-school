=begin
-----------------------INSTRUCTIONS--------------------------------------
What does this code print?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

--------------------------PROBLEM----------------------------------------
Questions:
Input: 
Output: 
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------

----------------------------ALGO----------------------------------------
=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

=begin
This code starts off with an array of strings, and then an empty array.
In the first call to `each`, each object in the first arrray is pushed to the second arrray.
In the second call to `each`, each object is then upcased using the mutating method `upcase!` if they start with C or S
Since this method mutates the caller, and the elements in the array1 that we pushed to array2 have now been changed, we now see that the elements in the second
array are also altered since array2 still references the original objects at each element.
=end

# DONE