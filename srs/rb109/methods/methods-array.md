# `Kernel#tap`


# `Enumerable#any?`
If the criteria specified by the block is true for _any_ element, this method will return `true`.

|  #  | Return Values |
| --- |:-------------|
| 1 | return of the block, used by `.any?`     |
| 2 | return of `.any?`     |
#flashcard

# `Enumerable#all?`
This method returns true if _any_ iteration returns a truthy block.

|  #  | Return Values |
| --- |:-------------|
| 1 | return of the block, used by `.all?`     |
| 2 | return of `.all?`     |
#flashcard


# `Enumerable#each_with_index`
Very similar to `.each`-- it does not care about the return of its subsequent block and it returns the original collection it was called on. The difference is it takes additional block parameter-- the index. When used in a hash, use parentheses to grab keys and values independently-- other wise this method treats it as a pair, and the second param will be the index.
```
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end
```

#flashcard

# `Enumerable#each_with_object`
This method takes two parameters in its block and an argument. We essentially initialize an empty array, and populate it with the elements in the collection for which the block returns true.

```
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]
```
With a hash:
```
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last array
end
# => ["ant", "bear", "cat"]
```
#flashcard

# `Enumerable#first`
This method takes optional argument and returns the first `nth` elements in the collection as determined by the argument. If no argument is passed, it will return the first element in the collection.
```
irb(main):016:0> [1,2,3,4,5,6].first(3)
=> [1, 2, 3]
irb(main):017:0> 
```
A bit unexpected with a hash:
```
{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]
```
When called on a hash this method returns a nested array because hashes are technically not ordered. Hardly ever does it get used with a hash though. #flashcard


# Enumerable#include?
This method takes an argument which is the item we want to search for in the collection that calls it.

```
[1, 2, 3].include?(1)
# => true
```
What happens when we use it with a hash?

`.include?` is actually an alias for `Hash#key` or `Hash#has_key?` and therefore `.include?` only searches the keys _NOT_ the values.

```
{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false

{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true
```
#flashcard

# `Enumerable#partition`
Divides elements from a collection based on the return of the block and returns two collections with the elements for which the block returned 1) true and 2) false.

```
[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]
```
Since this returns a nested array it makes the most sense to use this when assigning each partition to two different variables:

```
odd, even = [1, 2, 3].partition do |num|
  num.odd?
end

odd  # => [1, 3]
even # => [2]

```
#flashcard


# `Array#length`
returns an integer which represents the length of the array.

```
array = [0, 1, 2, 3, 4]
array.length
# => 5
```
#flashcard

# `Array#last`
Returns the last element in the array
```
array = [0, 1, 2, 3, 4]
array.last
=> 4
```
#flashcard
# `Array#take`
Returns the nth element in the array, depending on the argument passed.
```
array = [0, 1, 2, 3, 4]
array.take(3)
=> [0, 1, 2]
```
#flashcard

# `Array#drop`
This method returns the elements after `n` elements in the array
```
array = [0, 1, 2, 3, 4]
array.drop(3)
=> [3, 4]
```
#flashcard
# `Array#pop`
This method permanently removes the last element of an array
```
array = [0, 1, 2, 3, 4]
array.pop
=> [0, 1, 2, 3]
```
#flashcard
# `Array#shift`
This method permanently removes the first element in an array and returns it.
```
array = [0, 1, 2, 3, 4]

array.shift
=> 0  
array
=> [1, 2, 3, 4]
```
#flashcard
# `Array#push`
Adds an element at the end of an array. Mutates and returns the same object.
```
array = [0, 1, 2, 3, 4]
array.push(99)
=> [0, 1, 2, 3, 4, 99]
```
#flashcard
# `Array#unshift`
This method adds an element to the beginning of an array. Mutates and returns the same object.
```
array = [2, 3]
array.unshift(1)
=> [1, 2, 3]
```
#flashcard

# `Array#delete`
Permanently removes from an array the element specified in the argument.
```
array = [0, 1, 2, 3, 4]
array.delete(1)
=> [0, 2, 3, 4]
```
#flashcard
# `Array#delete_at`
Permanently deletes from an array the element at the specified index.
```
array = [0, 1, 2, 3, 4]
array.delete_at(0)
=> [1, 2, 3, 4]

```

# `Array#reverse`
This method reverses an array, but returns a new one, it is non-mutating.
```
irb(main):001:0> array = [0, 1, 2, 3, 4]
=> [0, 1, 2, 3, 4]
irb(main):002:0> array.object_id
=> 70251627035420
irb(main):003:0> array.reverse.object_id
=> 70251627110860
irb(main):004:0> 
```
#flashcard


# `Array#join`
Returns a string of all the elements of the array separated by the separator parameter.
If no separator is passed, the method will join all elements together.
```
irb(main):010:0> pets
=> ["Clarice", "Burbus"]
irb(main):011:0> pets.join(" & ")
=> "Clarice & Burbus"
irb(main):012:0> pets.join
=> "ClariceBurbus"
```
#flashcard

# `Array#uniq`
This method takes in an array containing duplicates and returns a new array containing only unique elements from the original array.
```
array = [1, 1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 7, 8]
array.uniq
=> [1, 2, 3, 4, 5, 6, 7, 8]
```
#flashcard

# `Array#concat`
This method appends the elements from an array to the original array. This method can take
in multiple arrays as an argument, which will in turn append multiple arrays to the original array.
```
array = [0, 1, 2, 3, 4]
array.concat([5, 6, 7], [8, 9, 10])
=> [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
#flashcard

# `Array#sort`

# `Array#flatten`

# `Array#each_index`

# `Array#count`

# `Array3assoc`

# `Array#difference`

# `Array#fetch`

# `Array#fill`

# `Array#intersect?`

# `Array#intersection`

# `Array#keep_if`

# `Array#reject`

# `Array#zip`


