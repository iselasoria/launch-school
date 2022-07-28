### Pseudo-Code
### write out pseudo-code (both casual and formal) that does the following:

# E1 write a method that returns the sum of two integers
=begin
read the first number
read the second number
add the two numbers together
display result
=end

=begin
READ the first number
READ the second number
perform addition operation on the two numbers
OUTPUT the result
=end

# a method that takes an array of strings, and returns a string that is all those strings concatenated together

=begin
iterate through a collection of strings
perform string concategnation on each element
display the resul
=end

=begin
READ an array
ITERATE through each element
SET a variable that will catch the new result
with each iteration, take the current element and add it to the new variable previously set
=end

# a method that takes an array of integers, and returns a new array with every other element from
# the original array, starting with the first element. For instance:

# Copy Code
# everyOther([1,4,7,2,5]) # => [1,7,5]

=begin
iterate through the array
create a variable to catch the new array
select the first element and throw it into the array
skip the next element
select another element and so on until the end of the collection
=end

=begin
READ an array
SET variable to catch new array
SELECT first element and capture it in the new variable
SKIP the next
CAPTURE the following element
SKIP the next until the end of the collection
OUTPUT the resulting array

=end

# a method that determines the index of the 3rd occurrence of a given character in a string.
# For instance, if the given character is 'x' and the string is 'axbxcdxex', the method should
# return 6 (the index of the 3rd 'x'). If the given character does not occur at least 3 times, return nil.

=begin
read the character passed as an argument
iterate through the characters in the string
set an empty variable to work as a counter for the occurances of a character
with each iteration of the character add 1 to its corresponding counter
if the counter of the char is equal to 3, stop and return the inex at the collection
if the char doesnt happen 3 times, return nil
=end

=begin
READ char passed in as argument to the method
ITERATE through the collection of characters in the string
SET counter = 0
with each iteration if the |current_variable| == char passed in as argument,counter += 1
IF counter == 3 return index at collection
ELSIF counter < 3 return nil
=end


# a method that takes two arrays of numbers and returns the result of merging the arrays. 
# The elements of the first array should become the elements at the even indexes of the returned array, 
# while the elements of the second array should become the elements at the odd indexes. For instance:
# merge([1, 2, 3], [4, 5, 6]) # => [1, 4, 2, 5, 3, 6]

=begin
READ first array
READ second array
SET variable for new collection, the merged array
iterate array1, with each iteration track the index and set odd indexes to the current iteration of the second array
=end
