=begin
* DONE 4m
Build a program that asks a user for the length and width of a room in meters and 
then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

=end 
CONVERSION_FACTOR = 10.7639
puts "Enter the lenght of the room in meters: "
l = gets.chomp.to_f
puts "Now enter the width in meters: "
w = gets.chomp.to_f
area_sqm = l * w 
area_sqft = (area_sqm * CONVERSION_FACTOR).round(2)
puts "The area of the code is #{area_sqm} square meters (#{area_sqft})."
