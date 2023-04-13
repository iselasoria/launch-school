Ancestors are the classes and [[modules]] that pass down behavior down the [[inheritance chain ]].
We can view the ancestors of an object like this:
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