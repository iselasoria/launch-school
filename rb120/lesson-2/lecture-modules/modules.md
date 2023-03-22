### Modules
---

Ruby only allows for inheritance to work in a linear fashion-- behaviours can only be handed down from a `superclass` to a `subclass`. This is known as `single inheritance`. This doesn't always work for the kind of problem we might want to model. For example, consider a `Pet` class that hands down the following methods: 
- run 
- jump 
- swim 

That would work, mostly. But if we have a class for `Cat` they can't swim so that method id irrelevant. Or if we have a class `Fish`, they can't run or jump so those methods are irrelevant to them. 
Ruby's workaround for `multiple inheritance` -- receiving behaviours from disparate sources, is module mixing or `mixins`. 

Modules are a way to group similar behaviors, but they cannot instantiate objects. 

```ruby
module Swimmable
  def swim
    "swimming!"
  end
end

class Dog
  include Swimmable
  # ... rest of class omitted
end

class Fish
  include Swimmable
  # ... rest of class omitted
end
```
