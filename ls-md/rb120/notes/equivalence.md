A simple matter of comparison becomes quite complex when you consider the fact that in Ruby
_"everything is an object"_.

By default, we can use `==` operator (which is really a [[fake operator]]) to compare the values of two objects. The code below checks if the two variables have the same value:
```ruby 
str1 = "The Golden Girls"
str2 = "The Golden Girls"

  

p str1 == str2   # true
p str1.object_id # 60
p str2.object_id # 80
```
Even though we can see the objects are _NOT_ the same object, the `==` still returns true. It's comparing values.

Since everything in Ruby is an object, then everything that _is_ has come from a [[class]]. 
We know `==` is a fake operator and that it is in fact a method, so this means that we can (and  should) override the behavior of the inherited method to make it do what we expect. The `==` in the code above is actually an reference to the overriding implementation of `==` defined by the `String` class. The "real" `==` actually comes from `BasicObject` class and in its default state it checks whether two objects are the same object. 
We can see from the output of that code that returns `true` even though we can simultaneously see that the `object_id` for the two is different, that `String` class must have an implementation that overrides the one inherited from `BasicObject`.

`.equal?` checks to see if the two things being compared have the same values _and_ are in fact the same object. 
```ruby
str1 = "The Golden Girls"
str2 = "The Golden Girls"

p str1.equal?str2 # false 
p str1.object_id  # 60
p str2.object_id  # 80
```