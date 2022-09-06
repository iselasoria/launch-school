# Sorting
---
## Basics of Sorting
Sorting makes the most sense if its performed on an array since they are ordered collections.
As of Ruby 1.9,  we are allowed to sort hashes but since a hash is accessed by key/value sorting becomes almost unnecessary.

Ruby provides the following methods to perform basic sorting:
- `.sort`
- `.sort_by`

Example:
```
[2, 5, 3, 4, 1].sort # => [1, 2, 3, 4 ,5]
```
Here, the return value is a new array with the integers ordered sequentially.


### Comparison
Ruby looks at tow objects and performa a comparison to determine their order. 

#### The `<=>` Method
This method is the one to perform the comparison between two objects of the same type. The return of this method is 
- If first object is less than the second object:
	- `-1`
- If first object is equal to the second object:
	- `0`
- If first object is greater than the second object:
	- `1`
- If the two objects cannot be compared:
	- `nil`

Example:
```
2 <=> 1 # => 1
1 <=> 2 # => -1
2 <=> 2 # => 0
'b' <=> 'a' # => 1
'a' <=> 'b' # => -1
'b' <=> 'b' # => 0
1 <=> 'a' # => nil
```

### The ASCII Table
When it comes to ordering strings, Ruby looks to the string's position on the ASCII table to determine which one comes first.

**ASCII Character Order**
ASCII order also known as `ASCIIbetical oder`. 
- All uppercase letters come beforelowercase. For instance, `Z` comes before `a`.
- Digits and many punctuation marks come before letters.

Examples:
```
'A' <=> 'a' # => -1
```

```
'!' <=> 'A' # => -1
```

To get the position on the ASCII table, we can call `ord` on a string:

```
'b'.ord # => 98
'}'.ord # => 125
```

In the above example, since we know the `}` has a greater value position on the ASCII table, we expect it to come after `b`, and it does:

```
'b' <=> '}' # => -1
```

### General Ordering Rules to Remember
- Uppercase letters come before lowercase
- Digits and most punctuation come before letters
- Accented characters, which are part of the extended ASCII table, come after the main ASCII table

## The `sort` Method
Sorting can also be done with a block. Here we pass two arguments, which are the two that need to be compared.

```
[2, 5, 3, 4, 1].sort do |a, b|
  a <=> b
end
# => [1, 2, 3, 4, 5]

```
In th example below, by switching the order in which the comparison is made we can get the sorted array in desceneding order:
```
[2, 5, 3, 4, 1].sort do |a, b|
  b <=> a
end
# => [5, 4, 3, 2, 1]
```

### `String#<=>`
looks at the string character by character. So if two strings start with `a` then it looks at the second character, and so on.

Comparing a string that is longer than the other, the longer string will be considered greater.

### `Array#sort`
Comparison of arrays happens like this:
`arre1[i]  <=> arre2[i]`

If any result in the comparison is `-1`, then the result of the comparison will be `-1`.
- `[0, 1, 2] <=> [0, 1, 3] # => -1`

If the result in the comparison is `1`, then the result of the comparison will be `1`.
- `[0,1,2] <=> [0,1,1] # => 1`

When the comparison results in `0` (meaning all available comparable characters are the same):

- Returns `-1` if `arre1` is smaller than `arre2`

	`[0, 1, 2] <=> [0, 1, 2, 3] # => -1`
- Returns `1` if `are1` is larger than `arre2`

	`[0, 1, 2] <=> [0, 1] # => 1`
- Returns `0` if both `arre1` and `arre2` contains the same characters and are the same length.
---

**Exercises:**

_What is returned here:_
```
['arc', 'bat', 'cape', 'ants', 'cap'].sort
```
SOLUTION-
['ants','arc','bat','cap','cape']

`String#<=>` looks at the string character by character. So if two strings start with `a` then it looks at the second character, and so on.

This method also considers length. In th case of `cap` and `cape`, they have the same three letters in common, but `cape` is considered "greater" because it has a longer lenght.


_What is returned here:_
```
[['a', 'cat', 'b', 'c'], ['b', 2], ['a', 'car', 'd', 3], ['a', 'car', 'd']].sort
```

SOLUTION-
`['a', 'car', 'd'],['a', 'car', 'd', 3],['a', 'cat', 'b', 'c'],['b', 2]`

## The `sort_by` Method

This method is called with a block, which determines how the items are compared:

```
['cot', 'bed', 'mat'].sort_by do |word|
  word[1]
end
# => ["mat", "bed", "cot"]
```
We are telling the method to only look at the element in position 1, and it therefore ignores all the rest.

We could sort a hash by pasing key-value pair as arguments to the block.

**Quirk:**

Suppose you have the hash:

`people = { Kate: 27, john: 25, Mike:  18 }`

and you want it sorted in alphabetical order.
`sort_by` uses the ASCII position to determine order and in the ASCII table, capitals come before lower case. Simply calling `sort_by` would give us

```
people.sort_by do |_, age|
  age
end
# => [[:Mike, 18], [:john, 25], [:Kate, 27]]
```
This is not what we want. We can see the keys are symbosl and check documentation for `Symbol#<=>`. We can see that it exists and that it works by first calling `to_s` on a symbol. So effictively, `Symbol#<=>`
just compares strings.
Now, for the issue with capitalization we can use `Symbol#capitalize` so that at the time of comparison, all are capitalized.

```
people.sort_by do |name, _|
  name.capitalize
end
# => [[:john, 25], [:Kate, 27], [:Mike, 18]]
```