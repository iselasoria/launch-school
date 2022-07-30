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

# E3 Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important","urgent")
puts advice

# E4 The ruby array class has several kethids for removing items from the array.
# Two of them have very similar names. How do these differ, what does each do?

numbers = [1,2,3,4,5]
numbers.delete_at(1)
numbers.delete(1)

=begin
SOLUTION
The method `delete_at` will delete whatever element is at the given array index, in this case index 1.
So the first method is a destructive method that will remove the umber 2 from the array and it will return
the number it removed. 
The second method also destructive will remove the number that it has as an argument, so the number 1. It returns the number it removed.
The main difference is `delete_at` searches the array for the element at that position, while `delete` searches the array for that value.
=end

# E5 Programatically determine if 42 lies between 10 and 100.
(10..100).cover?(42)

