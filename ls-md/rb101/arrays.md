`multiple assignment` is when you assig more than one value on the same line. When an array is assigned to two variables on the same line, each element of that array gets assigned to one of the variables. #TODO get better example


## Array#slice 

`arr = [1, 'two', :three, '4']`

`arr.slice(3, 1) # => ["4"]` <-- returns "4" inside an array object because we passed in a start index and a range

`arr.slice(3..3) # => ["4"]` <-- returns "4" inside an array object because we passed in a starting index and a range

`arr.slice(3)    # => "4"` <-- when we dont pass in a range, the `Array#slice` method will return just the element itself, in this case the string `"4"`

## Element Reference Gotchas

### Out of Bounds Gotchas
Feferncing an array element that is out of bounds will return `nil` so beaware of that
especially problematic in the case of arrays since an array can contain all kinds of object
including `nil`

`Array#fetch` is the best method to prevevent tryign to retrieve an element out of bounds. It will throw an error
```
arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil
```
When using `Array#fetch`:
```
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
             #        from (irb):3:in `fetch'
             #        from (irb):3
             #        from /usr/bin/irb:11:in `<main>'
```

## Negative Indices
The last element in an array or a string can be accessed by referencing index `-1`. The negative index starts at `-1` and works backwards

```
[ ][ ][ ][ ][ ]
 0  1  2  3  4
-5 -4 -3 -2 -1
```

## Element Assignment
This is a destructive action, so the original object is modified
```
str = "joe's favorite color is blue"
str[0] = 'J'
str # => "Joe's favorite color is blue"
```