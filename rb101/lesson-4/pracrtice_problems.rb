# E1 What is the return value of the `seelct` method?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# SOLUTION
[1,2,3]
# `select` looks at the return of the block which is the last expression evaluated in the block
# since the method cares about the truthiness of the return of the block and 
# 'hi' is the last expression evaluated and it is in fact a truthy value, therefore all iterations
# return truthy and all are selected

# E2 How does `count` treat a block's return value? How can we find out?

['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

# `count` looks to the return value of the block and therefore `count` starts counting all those elements in the
#  collection for which the block returns true.

# E3 What is the return value of the `reject` in the following code? Why?
[1, 2, 3].reject do |num|
  puts num
end

# SOLUTION
[1,2,3]
# `reject` returns a new array containing items where the block's 
#  return value is "falsey"-- in other words if the return value of the block was `falase` or `nil` 
#  the value would be selected. Since the return of `puts` is always `nil` that's why all the elements get selected.


# E4 What is the return value of each_with_object?
['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# SOLUTION
# => { "a" => "ant", "b" => "bear", "c" => "cat" }
# The new collection we are creating is a hash and it gets passed as a method argument to each_with_onject.
# Then, in the arguments that get passed to the block we have value which represents the current element in the iteration, and hash which
# represent this new empty hash we are creating. Inside the block we set hash[value[0]] to the "value"
# To deconstruct this, value[0] is "a" in the first iteration, "b" in the second, "c" in the third. The we use that as the new key when we 
# use hash["a"] in the first iteartion, hash["b"] in the second iteration, and hash["c"] in the last iteration. Then for each of the keys,
# we set a value. 

# E5 What does `shift` do in this code?
hash = { a: 'ant', b: 'bear' }
hash.shift

# SOLUTION
# This method removes and returns the leading element in a hash.
# So thi code will return {a:'ant'} 


# E6 What is the return value if the following statement? Why?
p ['ant', 'bear', 'caterpillar'].pop.size

# SOLUTION
# pop removes and returns the trailing elements in an array. So this then gets passed to 
# the method size which takes the length of a string or an array. Therefore the end return of 
# this whole thing is 11, because pop removed the word "caterpillar" from the array and then size 
# counts the characters in that word

# E7 What is the block's return value in the following? How is it determined?
# Also what is the return value of `.any?` in this code and what does it output?
[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# SOLUTION
# this method returns true if any element in the array meets the criteria specified by the block. In this case, 
# the last expression evaluated in the block is whether the current element is odd, therefore, the return value of
# the block is true in the first iteration, at which point the iteration stops and so puts is only called on the 
# first elements and not again.

# E8 How does `take` work? Is it destructive? How can we find out?
arr = [1, 2, 3, 4, 5]
p arr.take(2)

# SOLUTION
# this method takes an argument n, and returns a new collection containing the first n elements of the collection.
# According to the ruby documentation, it does not modify the original collection so it is not destructive
# In this example, the return of calling take on arre with 2 as the argument is [1,2]


# E9 What is the return value of `map` in this code and why?
newvar = { a: 'ant', b: 'bear' }.map do |key, value|
            if value.size > 3
              value
            end
          end
p newvar
# SOLUTION
# the return is [nil, "bear"]. `.map` returns a new collection containing the transformed elements from the original.
# It's important to remember that map always returns a transformation and that it returns a new collection the same length as the original.
# In this example, the first key-value pair does not meet the criteria, but it does still get included in the new array that gets returned, in the form of `nil`
# The second key-value pair does in fact meet the criteria specified in the block and therefore as the block states, it returns the value.

# E10 What is the return value of the following code? Why?
newvar = [1, 2, 3].map do |num|
            if num > 1
              puts num
            else
              num
            end
          end
p newvar

# SOLUTION
# This code returns [1, nil, nil]. map is a transformation, so in the first iteration, the condition is met and so it returns num in this case 1.
# The following two iterations dont meet the ccriteria and therefore it falls to puts num in the if statement, where the last evaluated expression
# is the call to puts, which returns nil. This nil gets added to the collection to be returned.