# Nested Collections

## Refencing Elements
Referncing an element in an array:

```
arre = [3,5,7]
arre[0] # => 3
arre[1] # => 5
arre[2] # => 7
```

Refencing an element in the second layer of an array:
```
arr = [[1,4],[3]]
arr[0] # => [1,4]
arr[1] # => [3]
```

```
arr[0][1] # => 4
```


## Updating Elements

```
arr = [[1, 3], [2]]
arr[0][1] = 5
```
In the example above, the second line of code is doing two things. The first is _**element reference**_. It is refencing `arr[0]` which returns `[1,3]`. The second thing that line is doing is _**element update.**_ 
The part of the line `[1] = 5` is actually equal to `[1, 3][1] = 5`. So this whole line is actually a chainned action that first refences an element and then 
destructively updates it.

Another example to drive that point home:
```
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```

In the example above, we have the same idea going on: the first part, `arr[0]` is the portion of the element reference. The `<< 3` can be though of as a chain to the return value of the `arr[0]` which was `[1]`. So now we have essentially `[1] << 3`.