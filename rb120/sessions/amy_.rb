arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => ??
# false
sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => ??
# true
int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => ??
# true
# What will the code above return and why?

# https://launchschool.com/lessons/d2f05460/assignments/9cadd494

# `==` by default compares actual objects in memory as opposed to the value of the objects just like `equal?`
str1 = "string"
str2 = "string"
str3 = str1
# String#==
# Integer#==
p str1 == str2 # checks for value eqivalence 
p str1.equal?str2 # checks for object_id equivalence 
p str1 == str3

p (1..50) === 350