# What do each of these output?
a = %w(a b c d e)
puts a.fetch(7) # error, out of bounds
puts a.fetch(7, 'beats me') # "beats me" <-- used when the call is out of bounds
puts a.fetch(7) { |index| index**2 } # 47

