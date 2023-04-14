Ruby does not have multiple-inheritance per se, but it does have a way to mimic the behavior-- module [[mixins]]. We can include as many modules as we wish, and Ruby will use them from the last-to-first added. 

```ruby
module Clawable
  def interact
    "Clawing your face!"
  end
end

module Purrable
  def interact
    "purrrr purrrr purrrr"
  end
end

  
class Mammal
  attr_reader :interact
  
  def interact
    "meow"
  end
end

  
class Cat < Mammal
  include Purrable
  include Clawable

  def interact
    "I'm a cat defying all logic and speaking English. And what?!"
  end
end


kitty = Cat.new

p kitty.interact # see different scenarios bellow
```

#### Scenario 1: as is
Result: `"I'm a cat defying all logic and speaking English. And what?!"`
Ruby will always first attempt to resolve the method inside the boundaries of its enclosing structure-- the `Cat` class in this case, and here it does find it so it executes that method. 

#### Scenario 2: comment out the `interact` instance method in `Cat` class 
Result: `"Clawing your face!"`
The code above will output `Clawing your face!` because it will first seek to resolve the method definition within the boundaries of the calling structure-- the `Cat` class. Since Ruby first searches from last-added to first-added modules, it goes to search within `Clawable` module first and resolves the method there.

#### Scenario 3: comment out `# include Clawable`
Result: `"purrrr purrrr purrrr"`
Commenting out the line `include Clawable` means Ruby now searches `Purrable`-- now the last (and only) of the [[mixins]] added to try to resolve the method. It finds a method by that name and executes it. 

#### Scenario 4: comment out `# include Purrable`
Result: `"meow"`
Now if we comment both mixins, we are forcing Ruby to go look elsewhere up the inheritance chain. Next spot is the [[superclass]], it goes and finds a method by that same name so it executes it. 


