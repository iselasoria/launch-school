Instance variables are defined with an `@` symbol at the beginning. 
```ruby
name = 'Andy'
```
Their [[scope]] is at the [[object]] level and are not shared or inherited. However, it is possible for two instance variables to be pointing to the same object and thus to be able to mutate it. This still does not mean the instance variables were shared.

Unlike [[local variables]], which die at the boundaries of method definitions, instance variables live on independent from the methods that defined them. This way they can interact with other parts of the code so long as we have a way to reference their values. 

Instance variables plus their values comprise the state of an object. Instance variables bind data to an object. 

Note: something curious and peculiar about instance variables is that, again unlike local variables, when we define the class they immediately "exists" in a strange state that gives them a default value of `nil`. If we try to call an uninitialized local variable, we'd get a `NameError` exception telling us that variable does not exists. This is not the case with `ivars`-- it's almost as if they are in a weird conception state but have not yet been born.  Ruby parses the code in a class that is the equivalent of the conception of instance variables. When we bind data to them, then they are born. 