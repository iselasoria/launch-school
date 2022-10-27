=begin 
We wrote a method for moving a given number of elements from one array to another. We decide to test it on our todo list, 
but invoking move on line 11 results in a SystemStackError. What does this error mean and why does it happen?
=end

def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# recursion needs a base case:--> a condition under which it will stop. This didnt have it so the function keeps calling itself with a new decresed value
# for `n` and adding each call to the call stack. Since it jut keeps going, it will result in a stack overflow. So we add a condition at the top that says 
# return if n == 0, which means the number of elements we want removed from the todo list, minus 1 so this time we remove on item at a time and keep calling the function