When looking to resolve a method, Ruby will first search in the enclosing structure-- the class of the calling object. If it does not find it, it travels up the [[inheritance chain]] also known as the look up path, to try to resolve it. We can see the lookup path by calling `ancestors` on the class:

```ruby
module TravelingTeacher
end

module SummerTimeTeacher
end

class Teacher; end

class SubstituteTeacher < Teacher
	include SummerTimeTeacher
	include TravelingTeacher
end


p SubstituteTeacher.ancestors #[SubstituteTeacher, TravelingTeacher, SummerTimeTeacher, Teacher, Object, PP::ObjectMixin, Kernel, BasicObject]


```
We can see that Ruby first tries to resolve methods from the class of the calling object, then from mixin modules (in order of last to first added), then custom [[superclass]] and lastly ruby native superclasses. 

tags: #ancestors 