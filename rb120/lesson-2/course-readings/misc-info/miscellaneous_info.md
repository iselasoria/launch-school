## Miscellaneous Information on OOP
---
## spike
spike is throwaway code-- the brain dump before implementation where you can play around with different options before committing to any one.


## Repetitive nouns means you should make a class for it

In the RPS game we reference `move` so much and when it came time to compare objects we found ourselves writing method upon method to access their values. This was made a lot easier by having a `Move` class and letting that handle how an object of the `Move` class exposes and displays its values. 

## Don't include class name in method names
With OOP, we have to think about the legibility of the code. Think of the _interface_ of the code. If we preface method names with the name of the class we could end up with something like this:
```ruby 
player1 = Player.new
player2 = Player.new

puts player1.player_info
puts player2.player_info
```
The code below reads a whole lot better:
```ruby
puts player1.info
puts player2.info
```

## Avoid Long Chains of Methods
Having something like:
`human.move.display.size` can be really difficult to debug when a middle link in the chain returns `nil`. Develop an eye for anticipating the breaking points of the code. 

## Avoid writing clever code
At this point, don't get clever just make it work and make it clean.
> "premature optimization is the root of all evil

## AbcSize
Rubocop calculate the complexity of a method like this:

```ruby
abc_size = Math.sqrt(a**2 + b**2 + c**2)
```

Where a refers to the number of assignments in the method, b refers to the branches, and c refers to the conditions. Anything above the Rubocop default of 18 will be flagged as too complex.

> Hint: focus on the component with the greatest count - reducing the occurrences of the most frequent type has the most effect on the computed AbcSize. In the example above, we chose to focus on reducing branches since we have more branches than either assignments or conditions.

Counting assignment and conditions is fairly simple. Take the code below:

```ruby 
if move1 == "rock" && (move2 == "scissors" || move2 == "lizard")...
```

It can be simplified by extracting to an outer method. This way where we were checking three condition before, we are now only checking one and one branch. 
```ruby 
def rock_wins?(move1, move2)
  move1 == "rock" && (move2 == "scissors" || move2 == "lizard")
end

if rock_wins?(move1, move2)...

```

Method calls are hidden in plain sight in ruby. For example, `+` is a method call that would contribute to `AbcSize`, so is `puts`, so is a `loop`. 

>In OOP, every reference to a getter or setter is a method call. 