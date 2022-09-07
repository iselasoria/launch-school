# Nested Collections

## Referencing Elements
Referencing an element in an array:

```
arre = [3,5,7]
arre[0] # => 3
arre[1] # => 5
arre[2] # => 7
```

Referencing an element in the second layer of an array:
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
In the example above, the second line of code is doing two things. The first is _**element reference**_. It is referencing `arr[0]` which returns `[1,3]`. The second thing that line is doing is _**element update.**_ 
The part of the line `[1] = 5` is actually equal to `[1, 3][1] = 5`. So this whole line is actually a chained action that first references an element and then 
destructively updates it.

Another example to drive that point home:
```
arr = [[1], [2]]

arr[0] << 3
arr # => [[1, 3], [2]]
```

In the example above, we have the same idea going on: the first part, `arr[0]` is the portion of the element reference. The `<< 3` can be though of as a chain to the return value of the `arr[0]` which was `[1]`. So now we have essentially `[1] << 3`.

## Other Nested Data Structures

It is possible to have a nested hash inside an array:
```
[{ a: 'ant' }, { b: 'bear' }]
```

```
arr = [['a', ['b']], { b: 'bear', c: 'cat' }, 'cab']

arr[0]              # => ['a',['b']]
arr[0][1][0]        # => 'b'
arr[1]              # => { b: 'bear', c: 'cat' }
arr[1][:b]          # => 'bear'
arr[1][:b][0]       # => 'b'
arr[2][2]           # => 'b'
```
## Variable Reference for Nested Collections

In the the code below, we see that there are local variables that are placed in an array object but they are in turn referencing array objects themselves.

_What happens if we modify `a` after placing it into the array?_
```
a = [1, 3]
b = [2]
arr = [a, b]
arr # => [[1, 3], [2]]

a[1] = 5
arr # => [[1, 5], [2]]
```

When we modified `a` by doing `a[1] = 5`, the nested array `arr` is updated too because `a` is pointing to the array object that is in `arr`.

### Mental Model
| CODE          | BEHIND THE SCENES |
| ------------- |:-----------------:|
| `a = [1,3] `    | a --> `[1,3]`     |
| `b = ['b']`     | b --> `['b']`    |
| `arr = [a, b]  `    | arr -->   `[1,3]` <-- a   |
|                     |            `[2]` <-- b|
|       `a[1]`        |    arr --> `[1,5]`  <-- a   |
|                     |     `[2]`      <-- b  |