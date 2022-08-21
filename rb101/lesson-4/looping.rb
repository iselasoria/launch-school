loop do
  number = rand(1..10)   # a random number between 1 and 10
  puts 'Hello!'
  if number == 5
    puts 'Exiting...'
    break
  end
end

# EXPLANATION
=begin
The loop enters and the fist thing it encounters is the variable number initialzied
to a random number between 1 and 10. The immediately after that the program outputs 'Hello'.
The next line is a condition taht checks if the number that variable `number` points to is equal to 5. 
If it is, the program outputs "exiting" and then breaks out of the loop.
=end

arr = [1, 2, 3, 4, 5]
counter = 0

loop do
  arr[counter] += 1
  counter += 1
  break if counter == arr.size
end

arr # => [2, 3, 4, 5, 6]

# EXPLANATION
=begin
The local variable `arr` is set to point to array object [1,2,3,4,5]
There is a local variable `counter` which is initialzied and set to 0
Then the loop starts. It first accesses the element in the array at index[counter] which 
in the first iteration is 0 and adds 1 to that. This is a destructive method so `arre` is 
permanently changed. Immediately after this 
the `counter` gets updated by 1 and so in the second iteration we will be accessing 
arr[1]. The last condition is whether the length of the array is equal to the counter. When they are the same
we will have gone through the whole array.
=end
