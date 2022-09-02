# `.each`
`.each` is a method in the `Array` and `Hash` classes that allows us to **_iterate_** through a collection. It is the most basic, and efficient form of iteration and it mirrors `loop` in behaviour.

Important distictions about `.each`:
- Used for basic iteration
- It does not care about the return value of the block
- It returns the original collection

## Example
```
irb :001 > [1, 2, 3].each do |num|
irb :002 >   puts num
irb :003 > end
1
2
3
=> [1, 2, 3]    
```
---


# `.select`
`.select` is a method that is in fact part of the `Enumerable` class but it is made available to the `Array` and `Hash` classes.

`.select` is used when we want to **_select_** elements in the original collection. This method relies on the return of the block to make its selection, which is always a boolean.

`.select` works by selecting elements from the original collection for which the blocked returned a truthy value.


## Example
_Since any `num + 1` will return an integer, and an integer is considered truthy, `.select` will select the element corresponding to that itration._
  
```
irb :001 > [1, 2, 3].select do |num|
irb :002 >   num + 1
irb :003 > end
=> [1, 2, 3]
```
_In contrast, this example shows how `.select` is dependent on the return of the block. Just like in a method, the return of the block is the last line executed in it. Since the last line is a call to the `puts` method, and `puts` always returns `nil`, the call to `.select` returns "falsey" and therefore no elements get selected:_ 

```
irb :001 > [1, 2, 3].select do |num|
irb :002 >   num + 1
irb :003 >   puts num
irb :004 > end
1
2
3
=> []
```
---

# `.map`
`.map` is another method that is part of the `Enumerable` class and made available to the `Array` and `Hash` classes. 

`.map` is used for **_transformation_**. Like `.select`, this method also relies on the return of the block and returns a new collection. However, `.map` returns a new collection that has transformed elements from the original collection.

## Example
_At its most basic use, `.map` transforms the elements in a collection._
```
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num * 2
irb :003 > end
=> [2, 4, 6]
```

_If we have a block that returns booleans? The result is an array of booleans._
```
irb :001 > [1, 2, 3].map do |num|
irb :002 >   num.odd?
irb :003 > end
=> [true, false, true]
```
_If we have a block that returns `nil`?_
```irb :001 > [1, 2, 3].map do |num|
irb :002 >   num.odd?
irb :003 >   puts num
irb :004 > end
1
2
3
=> [nil, nil, nil]
```
_If we have a block that does nothing?_
```
irb :001 > [1, 2, 3].map do |num|
irb :002 >   'hi'
irb :003 > end
=> ["hi", "hi", "hi"]
```

_The thing to remember with `.map` is-- it will always return a transformed array so don't expect to see elements from the original array._
---


| Method           | Action                         |   Cares about return of block?      | Returns Original or New Collection? | Length of Returned Collection|
| ---------------- |-------------------------------:|:----------------------------------: |-------------------------------------|------------------------------|
| `.each`          |  iteration                     | No                                  |Returns the original collection      | Length of original           |
| `.select`        | selection                      |Yes                                  |Returns a new collection             | Length of original or less   |
| `.map`           | transformation                 |Yes                                  |Returns a new collection             |Length of original            |