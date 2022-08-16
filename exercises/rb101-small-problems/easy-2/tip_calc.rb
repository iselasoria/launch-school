=begin
create a calculator. It should prompt for a bill
amount and tip rate.
The program should computer the tip and then display
both the tip and the total amount of the bill.
EXAMPLE:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

=end

def prompt(msg)
  puts "=>#{msg}"
end

prompt("What is the bill?")
bill = gets.chomp.to_i

prompt("What is the tip percentage?")
pct = gets.chomp.to_f

tip = bill * (pct/100)
total = bill + tip

puts "The tip is #{tip}"
puts "The total is #{total}"