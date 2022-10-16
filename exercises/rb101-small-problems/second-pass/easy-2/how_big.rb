=begin
-----------------------INSTRUCTIONS--------------------------------------
Build a program that asks a user for the length and width of a room in emters
and then displays the area of the room in both square meters adn square feet.
1 sq.m == 10.7639 sq.ft
--------------------------PROBLEM----------------------------------------
Questions:
Input: 
Output: 
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
----------------------------ALGO----------------------------------------
=end
CONVERSION = 10.7639
puts "Enter the length of the room in meters: "
l = gets.chomp.to_f
puts "Enter the width of the room in meters:"
w = gets.chomp.to_f
area_sqm = (l * w).round(2)
area_sqft = (area_sqm * CONVERSION).round(2)
puts "The area of the room is #{area_sqm} square meters (#{area_sqft} square feet)."