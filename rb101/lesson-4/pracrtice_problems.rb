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