=begin 

* DONE 59s

Print all even numbers from 1 to 99, inclusive, 
to the console, with each number on a separate line.
=end 

(1..99).to_a.each do |num|
  puts num if num.even?
end