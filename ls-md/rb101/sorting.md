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


## Comparison
Ruby looks at tow objects and performa a comparison to determine their order. 

### The `<=>` Method
This method is the one to perform the comparison between two objects of the same type. The return of this method is 
- If first object is less than the second object:
	- `-1`
- If first object is equal to the second object:
	- `0`
- If first object is greater than the second object:
	- `1`

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

## The ASCII Table
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

## General Ordering Rules to Remember
- Uppercase letters come before lowercase
- Digits and most punctuation come before letters
- Accented characters, which are part of the extended ASCII table, come after the main ASCII table