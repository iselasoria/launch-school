=begin
What will the following code print, and why? Don't run the code 
until you have tried to answer.
=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2 # Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo

# The code on line 8 pushes each element from array1 into array2 
# On line 9, when use the mutating method upcase! on each value if the value starts with C or S, we are
# really affecting the second array as well because the second array references the same object as array 1