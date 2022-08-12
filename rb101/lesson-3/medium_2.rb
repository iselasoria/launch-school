# E1 predict the outcome of each call to `object_id`

a = "forty two" #123
b = "forty two" #124
c = a # 123

puts a.object_id
puts b.object_id
puts c.object_id

# SOLUTION c is pointing to the same object local variable a is 
# pointing to. local variable b was initialized as a totally different string

# E2 what is the outcome of each call to `object_id`?

a = 42
b = 42
c = a

puts a.object_id # 123
puts b.object_id # 123
puts c.object_id # 123

# SOLUTION
# in this case, because integers are immutable, all of them reference the same object-- integer 42
# there is only one integer 42, and that is why they all point to it, even though `b` was not eplicityl
# initalized to point to it
