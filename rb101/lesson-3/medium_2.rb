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

# E3 Study the code bellow and identify what will be displayed and why:
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" #pumpkins
puts "My array looks like this now: #{my_array}" # ["pumpkins","rutabaga"]

# SOLUTION 
# because the `+=` is reasignment, this means the local variable taht exists in the scope of the method
# `a_string_param` is now pointing to a variable different from the `a_string_param` that was passed as a reference.
# since they no longer point to the same object, the change here does not affect the original object but rather a new one.
# In the case of the array, it is also passed by refference, but here we use `<<` which is a method that mutates the caller,
# thus altering the original object that was passed by refference

# E4 def tricky_method_two(a_string_param, an_array_param)

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkinsrutabaga
puts "My array looks like this now: #{my_array}" # ["pumpkins"]

# SOLUTION 
# this example drives the point home; it all depends on the method used, whether it mutates the caller, and this
# dictates how ruby behaves-- pass by reference or pass by value. This example achieved the opposite
# effect as the new one

# E5 This is a tricky method, how can we change the code to make it easier to predict. The resulting method
# should not mutate either argument, but my_string should be set to 'pumpkinsrutabaga' and my_array should be set to ['pumpkins', 'rutabaga']

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# becomes 

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga" # reasignment
  an_array_param += ["rutabaga"] # reasignment

  return a_string_param, an_array_param # now returning the new objects 
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array) # now disconnecting the original objects and having them point to the new objects generated in the method

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"