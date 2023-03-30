=begin
What is the default return value of to_s when invoked on an object? Where could you go
to find out if you want to be sure?
=end

# S: 
# By default, `to_s` will print the class of the object followed by some encoding of the object_id
# the documentation on the Object class (from which to_s) is inherited explains this. 
