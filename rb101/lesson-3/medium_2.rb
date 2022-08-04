# E1 predict the outcome of each call to `object_id`

a = "forty two" #123
b = "forty two" #124
c = a # 123

puts a.object_id
puts b.object_id
puts c.object_id

# SOLUTION c is pointing to the same object local variable a is 
# pointing to. local variable b was initialized as a totally different string

# E2