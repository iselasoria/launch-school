Inheritance chain refers to the collection of classes that preceded the current and that have passed down behaviors to it. We can view the inheritance chain with a call to `ancestros`. 
```ruby
module Clawable
end

class Mammal
end

class Cat < Mammal
  include Clawable 
end

p Cat.ancestors
# [Cat, Clawable, Mammal, Object, PP::ObjectMixin, Kernel, BasicObject]


```

tags: #inheritance, #ancestors, #look-up path
