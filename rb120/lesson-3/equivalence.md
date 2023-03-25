## Equivalence
---

_Everything is an object in Ruby_
Not _everything_ is an object-- methods are not objects, neither are `if` statements. For the most part
the rule holds true, but be aware that it wont always. This is important in `equivalence.`

Equivalence is the condition of being equal. This can mean several things as we see in this lesson. It can
mean equal in value, literally _the same_, etc.

Consider the following code snippet:
```ruby
str1 = "something"
str2 = "something"

str1.class              # => String
str2.class              # => String
```
Here we have two instance of the class String which contain the same values: "something". 

```ruby 
str1 = str1 + " else"
str1                    # => "something else"

str1 == str2            # => false
```
We can see that modifying one did nothing to the other. In this case we are asking Ruby if 
the _values_ those variables point to are the same. We are NOT asking if the two object _are_ the same object.
What if we _did_ want to ask the latter question? Enter `eql?`.

### `equal?`
This method lets us ask Ruby if the two objects we are comparing are the same object. 
```ruby
str1 = "something"
str2 = "something"
str1_copy = str1 # this points to the same "something" as str1

# comparing the string objects' values
str1 == str2            # => true
str1 == str1_copy       # => true
str2 == str1_copy       # => true

# comparing the actual objects
str1.equal? str2        # => false
str1.equal? str1_copy   # => true because they point to literally the same object
str2.equal? str1_copy   # => false values might be the same, but these are NOT the same objects
```
### The `==` Method
Although `==` might look like an operator, it is actually a method. The following are the same, one just makes use of Ruby's syntactical sugar:

```ruby
str1.==(str2)

str1 == str2
```
Now that we know `==` is a method, we know its behavior is determined by the class where it's defined. This method happens to come from the `BasicObject` class which all classes inherit from. From this, we can imply that if we have access to this methods via the `BasicObject`, we must also be able to override it to taylor its functionality to our needs.

```ruby 
class Person
  attr_accessor :name

  def ==(other)
    name == other.name     # relying on String#== here
  end
end

bob = Person.new
bob.name = "bob"

bob2 = Person.new
bob2.name = "bob"

bob == bob2                # => true
```
Remember, there is a method somewhere that has this functionality and it can be overridden. This method is available to `Hash`, `Array`, `Integer`, `String` and many other objects. 

By looking at this code:
`45 == 45.00                 # => true`
you can now tell that the method was overridden to handle integer to float comparison. Just keep in mind the above is `Integer#==` if you wanted to flip them it'd have to override `Float#==`. 
> Defining `==` gives you the `!=` freebie!


### `object_id`
Each object has access to the method `.object_id` which will give us access to a unique identifier of the space in memory. 

```ruby
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]
arr1.object_id == arr2.object_id      # => false

sym1 = :something
sym2 = :something
sym1.object_id == sym2.object_id      # => true

int1 = 5
int2 = 5
int1.object_id == int2.object_id      # => true
```
Notice how symbols and numbers behave differently-- this is because these data types are both immutable and their variables are pointing to the same object.. Symbols offer a slight performance optimization over strings for this reason. 

### `===`
This is an instance method that gets implicitly used by a case statement with ranges:
```ruby
num = 25

case num
when 1..50
  puts "small number"
when 51..100
  puts "large number"
else
  puts "not in range"
end
```
What it's actually doing is:
```ruby
num = 25

if (1..50) === num
  puts "small number"
elsif (51..100) === num
  puts "large number"
else
  puts "not in range"
end
```
Ruby essentially asks "If the range is a group, would this thing I'm trying to compare belong to that group?"
```ruby
String === "hello" # => true
String === 15      # => false
```

### `eql?`
This is mostly used implicitly by `Hash` and it is not used often. It determines if two objects are of the same class _and_ contain the same value. 

---
## Key Take-Aways
- `==` compares the values of objects
- `==` is a method that comes from the `BasicObject` class and by default it does not performa equality check but rather it returns true if two objects are teh same object. 
- Since `BasicObject#==` returns true if two objects are the same object, many other classes provide their own custom behavior for `#==`.
- if you must compare custom objects, you should define your own `#==` method