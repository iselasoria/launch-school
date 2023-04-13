The creation of an [[object]] of a given [[class]]. 
When we instantiate an object we are making a call to the class method `::new` which in turn triggers the [[initialize]] method and gets the object created. 

---

In the code below, we have an object called `burbujita` which is an instance of the `Cat` class. 
```ruby 
burbujita = Cat.new
```

With Ruby standard library classes, we don't need a call to new. We simply define an object [[literal]] like in the code below, but keep in mind `String`, `Array`, `Integer` , etc that we're familiar with are also classes as opposed to `data types` and so all that applies to classes applies to them. 
```ruby 
arr = [4,5,6,7]
```
We can see that regardless of how we instantiated it, the object references its [[class]]. 
```ruby
joe_name = "Joe"
xavier_name = String.new("Xavier")

p joe_name.class #Srting 

p xavier_name.class #String 
```
