[[oop]]

Objects encapsulate [[state]] meaning they make their [[instance variables ]]inaccessible outside of themselves . They are instances of the class that was used to create them and have access to their class' instance methods. However, they do _not_ share state with any other instance of the same class, since [[inheritance]] is a matter of class-to-class or -class-to-module. This is also why can say that objects do not inherit behavior from their [[class]], instead classes define behavior for objects. 

If a class were a cookie cutter, the object would be the cookie used to make it. 

---


### What is shared amongst objects of the same class?
Objects instantiated from the same class all have access to the behaviors defined by that class, this includes [[getter]] and [[setter]] methods. However, they do **not** share instance variables. 

Additionally, objects of the same class also share [[class variables]], which have [[scope]] at the class level. Instances of a class have access to the same value so overriding affects all instances. 

### The strange case of seemingly inherited instance variables...
To the careless eye, it can appear as though instance variables are inherited in Ruby because we can inherit instance methods in which instance variables are defined, such as [[initialize]] or [[attr_*]]. But don't be fooled by this, classes inherit behavior _only_ and these methods just happen to define instance variables. 

#### code-sample
Given a simple class definition
```ruby
class Dog ;end 
```
We can instantiate an object like this:
```ruby
fido = Dog.new 
```

tags: #major 