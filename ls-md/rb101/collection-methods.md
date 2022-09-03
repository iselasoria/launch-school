# Common Ruby Methods

## [`Enumerable#any?`](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-any-3F)
This method is made available to the `Array` and `Hash` modules. It looks at the collection and if the criteria specified by the block is true for any element in the collection, it will return true.

It's important to note there are **_two_** return values to be aware here:
1. The return value of the block, which `.any?` uses to determine what its return value will be
2. The `.any?` return value itself

- Example:
```
[1, 2, 3].any? do |num|
  num > 2
end
# => true
```
_When used with a hash:_
```
{ a: "ant", b: "bear", c: "cat" }.any? do |key, value|
  value.size > 4
end
# => false
```

---

## [`Enumerable#all?`](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-all-3F)
This method is similar to .`any?` in that it also looks at the return of the block to determine _its_ return. The difference is that `.any?` will only return true if the return value of the block is `true` or truthy in any iteration.

- Example
```
[1, 2, 3].all? do |num|
  num > 2
end
# => false
```
_When used with a hash_

```
{ a: "ant", b: "bear", c: "cat" }.all? do |key, value|
  value.length >= 3
end
# => true
```

---

## [`Enumerable#each_with_index`](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-each_with_index)

Much like `.each`, this method also is used for iteration, it also returns the original collection it was called on, and ignores the return value of the block. The main difference is `each_with_index` has a second argument it passed to the block, the index.

- Example:
```
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

# The index of 1 is 0.
# The index of 2 is 1.
# The index of 3 is 2.
# => [1, 2, 3]
```

_Note that this method when used with a hash will treat the first argument as the *key-value-pair* and the second argument as the index. The first argument now represents an array containing both the key and the value. This bit is very different from `.each`:

```
{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end

# The index of [:a, "ant"] is 0.
# The index of [:b, "bear"] is 1.
# The index of [:c, "cat"] is 2.
# => { :a => "ant", :b => "bear", :c => "cat" }
```

---

## [`.Enumerable#each_with_object`](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-each_with_object)

This method, on top of taking a block, it also takes a 

![[each_with_object.excalidraw.png]]

- Example
```
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]
```
_In this example we are passing an empty array as the method argument to .`each_with_object`. Then we are passing `num` as the first argument to the block. This represents each element in the array `[1,2,3]`. The `array` variable is the second argument we are passing to the block. This represents the empty array that we passed in as an argument to the method._

_We are essentially initializing the empty array and then populating it with only the elements in the original collection for which the block returns true_

_When used with a hash:_
```
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last <--- this bit here is what's pushing the last item in the key/value into the new array
end
# => ["ant", "bear", "cat"]
```

Notice how we can capture the `key, value` pair individually by using parentheses in the argument. 

```
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }
```

---
## [`Enumberable#first`](https://ruby-doc.org/core-3.1.2/Enumerable.html#method-i-first)
This method does not take a block, but it can take optional arguments and returns the first `nth` elements of a collection as determined by the argument. If no argument is given, it will just return the first element in a collection.

-Example:
```
irb(main):016:0> [1,2,3,4,5,6].first(3)
=> [1, 2, 3]
irb(main):017:0> 
```

```
[1, 2, 3].first
# => 1
```
`.first` has an interesting behaviour when it is used with a hash:

```
{ a: "ant", b: "bear", c: "cat" }.first(2)
# => [[:a, "ant"], [:b, "bear"]]
```


1. Remember that hashes are _not_ technically organized. Since Ruby 1.9, Ruby let's you use some order like "first" but technically hashes are unordered lists.
2. Notice how the result of calling `.first` on a hash with an argument results in a nested array. If you must use a hash, you can convert it back using:

    `[[:a, "ant"], [:b, "bear"]].to_h`

`.first` is hardly ever used on a hash though, it is a lot more typical to use it with arrays.


---