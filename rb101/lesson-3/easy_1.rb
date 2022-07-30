# E1 What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers
=begin
SOLUTION
=> [1,2,2,3]
The `uniq` method returned a new array, and left `numbers` untouched.
=end

# E2 Describe the difference between `!` and `?` in Ruby. Exokain what would
# happen in the following scenarios:

=begin
SOLUTUON
The difference is `!` is often (though not exclusively) used to denote a method
that mutates the caller, while `?` is typically used in method definitions that
return a boolean.

______
what is != and where should you use it? --> not equals, this can be used to negate something in logic
put ! before something, like !user_name --> turns something into the opposite of its boolean equivalent
put ! after something, like words.uniq! --> this denotes a method that mutates the caller
put ? before something --> 
put ? after something --> this denotes methods that return a boolean; used in logic
put !! before something, like !!user_name --> this turns any object into its boolean equivalent 

=end