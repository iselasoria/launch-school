=begin
Build a program that asks a user for the length and width of a room
in meters and then displays the area in both sqm and sqft.
1 sqm = 10.7639 square feet

EXAMPLE:
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

=end

puts "Enter the length of the room in meters: "
length = gets.chomp.to_i

puts "Enter the width of the room in meters: "
width = gets.chomp.to_i

area_sqm = length * width
area_sqft = (area_sqm * 10.7639).round(2)

puts "The area of the room is #{area_sqm} square meters (#{area_sqft} square feet)."
