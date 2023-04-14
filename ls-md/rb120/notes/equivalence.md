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

#### A word on symbols and integers
Symbols and integers are immutable in Ruby. Since we know we can't change them then to be pointing to the same value means to also _BE_ the same object. 
```ruby 
arr1 = [1, 2, 3]
arr2 = [1, 2, 3]

arr1.object_id == arr2.object_id # => false


sym1 = :something
sym2 = :something

sym1.object_id == sym2.object_id # => true


int1 = 5
int2 = 5

int1.object_id == int2.object_id # => true
```

	If we define custom classes and we want to compare them, we _must_ define the implementation of how we expect `==` to behave. 

Here we have a custom class representing Physics courses.  We instantiate to objects of the class containing the exact same values for the two instance variables that initialize sets. We can see Ruby still evaluates these two to be false. This is because it is using the `BasicObject` implementation that compares if they _are_ the same object. 
```ruby
class PhysicsCourse
	def initialize(prof, semester)
		@prof = prof
		@semester = semester
	end
end

phy101 = PhysicsCourse.new('Dr. Aurilia', 'Fall')
phy102 = PhysicsCourse.new('Dr. Aurilia', 'Fall')

p phy101 == phy102 # false 
```
The way to fix this is to override the `==` method that was inherited from `BasicObject` and give it the behavior we want-- if two objects contain the same value, then we want them to evaluate to equal. 
```ruby
def ==(other)
	(prof == other.prof) && (semester == other.semester)
end
```
Now we have told our class how to handle comparison. Note how inside the method definition we use `==` too, but this time we use `String#==` which is an overriden implementation of the inherited method from `BasicObject`. 