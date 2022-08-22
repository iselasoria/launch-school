# E1
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

# E2
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


# E3 
counter = 0

loop do
  counter += 1
  next if counter.odd?
  puts counter
  break if counter > 5
end

# EXPLANATION
# local variable `counter` is initialized to 0.
# the loop begins and its first step increases the counter
# in the first iteration `counter = 1`. The following line
# states that if the counter is an odd number, the rest of the code should be ignored-- `next` does this
# Since `counter = 1` is in fact odd, the rest of the code is not executed and the loop returns to the top, now
# `counter = 2`, the `next` condition is not met this time and so the following line gets executed, where the
# program outputs the value of counter, which at the second iteration it is `2`. The subsequent break condition is not 
# met and therefore the loop returns again to the top. Since the loop essentiall skips odd numbers, the output of the program is:
# 2
# 4
# 6
# notice how the counter was placed at the top, before next. Having it after next would make this an infitinite loop as it would encounter
# an odd and just ignore the counter that comes after it. Also, notice how we changed it to `counter > 5` this is because
# if we had `counter == 5` the loop would find `next` and just skip that iteration.