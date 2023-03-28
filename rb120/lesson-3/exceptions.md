## Raising Exceptions
---

Not raising exceptions will make your code crash. An exception just means ruby is signalling that the 
code is behaving unexpectedly. 

### When to handle an exception
Most errors we should handle come from the `StandardError` class which includes dividing by zero, bad user input or bad conversion. These errors are generally safe to signal and continue running the program. However, there are some errors that we actually want to put a stop to our code instead of running it, like a syntax error. Some errors might be so bad that if we raise exceptions but let them run, we could be making debugging downstream very difficult. 

### How to handle an exceptional state

**The `begin`/`rescue` block.**

Never rescue exceptions from the `Exception` class because this will trickle down and rescue all the 
other exceptions classes that inherit from it. Very dangerous!


```ruby
begin
  # put code at risk of failing here
rescue TypeError
  # take action
end
```

You can have branches to decide how to handle exceptions:
```ruby
begin
  # some code at risk of failing
rescue TypeError
  # take action
rescue ArgumentError
  # take a different action
end
```

Or you can just use the following syntax:
```ruby
begin
  # some code at risk of failing
rescue ZeroDivisionError, TypeError
  # take action
end
```

### Exception Objects and Built-In Methods

