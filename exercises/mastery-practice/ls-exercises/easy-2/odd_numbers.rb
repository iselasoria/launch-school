=begin 
* DONE 1m
Print all odd numbers from 1 to 99, inclusive, to the console, 
with each number on a separate line.
=end

r = (1..99).to_a 

r.each do |num|
  puts num if num.odd? 
end