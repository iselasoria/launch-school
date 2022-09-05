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
