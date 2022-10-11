`multiple assignment` is when you assign more than one value on the same line. When an array is assigned to two variables on the same line, each element of that array gets assigned to one of the variables. 
```
odd, even = [1, 2, 3].partition do |num|
              num.odd?
            end
```


## Array#slice 

`arr = [1, 'two', :three, '4']`

`arr.slice(3, 1) # => ["4"]` <-- returns "4" inside an array object because we passed in a start index and a range

`arr.slice(3..3) # => ["4"]` <-- returns "4" inside an array object because we passed in a starting index and a range

`arr.slice(3)    # => "4"` <-- when we dont pass in a range, the `Array#slice` method will return just the element itself, in this case the string `"4"`

## Element Reference Gotchas

### Out of Bounds Gotchas
Referencing an array element that is out of bounds will return `nil` so be aware of that
especially problematic in the case of arrays since an array can contain all kinds of object
including `nil`

`Array#fetch` is the best method to prevent trying to retrieve an element out of bounds. It will throw an error
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
arr = [1, 2, 3, 4, 5]
arr[0] += 1 # => 2
arr         # => [2, 2, 3, 4, 5]
```
**_Note_** this is a destructive method and it will modify the original array permanently

## Enumerable Methods
Methods that make up the `Enumerable` class are available to the `Array` class too.

One example, as shown in the `sp-easy-2/sum_or_product` exercise, `Enumerable#inject` can be used as a more rubyist way of computing sums and products. 

This method can take a block and perform the given operation for every item in the array. 

For example:
```
sum = (1..input_integer).inject {|sum, number| sum + number}

or

um = (1..input_integer).inject {|product, number| product + number}
```

This takes an array, as given by the range (as specified by `(1..upper_limit)`) and maps out an operation to perform in this case either sum or product. Then it sets `number` as the variable belonging to each element in the array and performs the specified operation.