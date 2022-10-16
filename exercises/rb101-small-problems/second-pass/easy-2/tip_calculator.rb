=begin
-----------------------INSTRUCTIONS--------------------------------------
Create a simple tip calculator. The program should promto for a bill amount adn a tip rate.
The program must compute the tip and then display voth the tip and the total amount of the tip.

--------------------------PROBLEM----------------------------------------
Questions:
Input: 
Output: 
---------------------------RULES-----------------------------------------
Explicit: 
Implicit: 
--------------------------EXAMPLES---------------------------------------
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
----------------------------ALGO----------------------------------------
=end

puts "What is the bill?"
bill = gets.chomp.to_f

puts "What is the tip percentage?"
tip_pct = gets.chomp.to_f


total_tip = (bill * (tip_pct/100)).round(2)
grand_total = (bill + total_tip).round(2)

puts "The tip is $#{total_tip}."
puts "The total is $#{grand_total}."

# DONE