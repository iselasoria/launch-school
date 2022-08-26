# take a look at this code:
name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

# this outputs
# Alice
# Bob

# Now have a look at this:
name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# this outputs 
# BOB
# BOB
# this is because local variable name points to 'Bob' and then 'save_name'
# is directed at that same string object. Then, there is no reasignment if any sort and a 
# destructive method is used (upcase!) so this changes the original object and thus also changes the references to it

