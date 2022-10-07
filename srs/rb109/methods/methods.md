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
When called on a hash this method returns a nested array because hashes are technically not ordered. Hardly ever does it get used with a hash though.

# Enumerable#include?
This method takes an argument which is the item we want to search for in the collection that calls it.

```
[1, 2, 3].include?(1)
# => true
```
What happens when we use it with a hash?

`.incluce?` is actually an alias for `Hash#key` or `Hash#has_key?` and therefore `.include?` only searches the keys _NOT_ the values.

```


```
