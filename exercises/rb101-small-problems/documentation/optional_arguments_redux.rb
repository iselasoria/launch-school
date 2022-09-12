# Supposed you have the following code, what will each print?

require 'date'

puts Date.civil # Date object -4712-01-01
puts Date.civil(2016) # => Date object 2016-01-01
puts Date.civil(2016, 5) # => Date object 2016-05-01
puts Date.civil(2016, 5, 13) # => Date object 2016-05-13