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

## Shallow Copy

You might want to make a copy of a collection before performing a major modification. Ruby allows you to do this using methods like `dup` and `clone`. The methods create a _shalow copy_ of an object. 

`clone` and `dup` only make copies of the objects they are called on, **NOT** of the objects within. So in the case of an array, we can create a copy of the array, but the elements inside it are shared, meaning the elements inside the array are still the ones in thhe original collection:

```
irb(main):001:0> arr1 = ["a","b","c"]
=> ["a", "b", "c"]
irb(main):002:0> arr1.object_id
=> 70296229279520 <------- first array
irb(main):003:0> arr2 = arr1.dup
=> ["a", "b", "c"]
irb(main):004:0> arr2.object_id
=> 70296220624500 <------- second array
irb(main):005:0> arr1[0].object_id
=> 70296229279700 <<------ first element in first array
irb(main):006:0> arr2[0].object_id
=> 70296229279700 <<------- first element in second array, notice they are the same!!
irb(main):007:0> 

```

Since the elements are shared, performing updates at the element level will change both arrays:

```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2[1].upcase!

arr2 # => ["a", "B", "c"]
arr1 # => ["a", "B", "c"]
```

`clone` works the same way:
```arr1 = ["abc", "def"]
arr2 = arr1.clone
arr2[0].reverse!

arr2 # => ["cba", "def"]
arr1 # => ["cba", "def"]
```

Notice how the first element changed in both arrays, this is due to the fact that the destructive method was called on the **_element_** not the array, which is the shallow copy.

To drive that point home, take the following code:
```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
```
Here, we are calling the destructive method `.map` on the shallow copy, `arr2`. This is why in the end we see that `arr1` is left untouched while `arr2` has been altered.

The same is not true if we fiddle with the _elements_ in the array:
```
arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
```
Here, we iterate through the shallow copy and call destructive method `upcase!` on the elements which are shared! Thus, we change the original as well.

## Freezing Objects

The main reason is that `clone` preserves the frozen state of an object while `dup` does not.

_freezing and cloning_
```
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.clone
arr2 << "d"
# => RuntimeError: can't modify frozen Array
```

_freezing and duping_

```
arr1 = ["a", "b", "c"].freeze
arr2 = arr1.dup
arr2 << "d"

arr2 # => ["a", "b", "c", "d"]
arr1 # => ["a", "b", "c"]
```

_freezing_ an object just means making a mutable object unable to be changed. 
```
str = "abc".freeze
str << "d"
# => RuntimeError: can't modify frozen String
```
As we know, integers in Ruby are immutable, so by default they are frozen.

```
5.frozen? # => true
```

Much like with `dup` and `clone`, `freeze` is applied to the object it is called on. So if we freez a collection, we can still change the objects within it because those arent frozen:
```
arr = [[1], [2], [3]].freeze
arr[2] << 4
arr # => [[1], [2], [3, 4]]


OR

arr = ["a", "b", "c"].freeze
arr[2] << "d"
arr # => ["a", "b", "cd"]
```
