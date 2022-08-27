# what will the following print and why?

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []


array1.each { |value| array2 << value }
# p array2
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# p array1.object_id
# p array2.object_id

# Moe
# Larry
# CURLY
# SHEMP
# Harpo
# CHICO
# Groucho
# Zeppo

# This is because in the first call to each, we use the destructive methoid `<<` to phush each element in array1 into
# aray2, thus we end up with a copy of array1 but not the same object. Then in the second call to each, we update
# the array1 in place, therefore now we have that the object referenced by array2 has been changed.