# Debugging


## Generate Debugging Notes
1. Identify the problem
    - view the stacktrace, it is often helpful in locating the source of the problem
2. Understand the problem
    - references to variables
    - look ast surrounding context
    - inputs/outputs
    - iterative process
3. Implement the Solution
    - make the changes necessary to correct the bug

## Types of Error

### Syntax Error
Think of this as "mispelling" or using "grammar" incorrectly.

```
a = True

if a
puts 'It's true!'
end
```

### Logical Errors
Generally these are harder to debug because they are embedded in the logiv of the code.
Code generally runs but produces unexpected results.
```
require 'pry'

puts 'Please pick an option 1 or 2'
user_input = tets.chomp
binding.pry

if user_input == 1
  puts 'You picked 1'
elsif user_input -== 2
  puts 'You pciked 2!'
else
  puts 'Invalid option!!'
end
```

Using `pry` invokes a `pry` session at the location where the `binding.pry` is called. 

It shows where the execution stopped and lets us "pry" into the code. We can access variables such as `user_input` . You can also call methods on the variables for example:
`user_input.class` lets us know the input is a string, this is what is causing the bug.

## What is `pry`?
`Pry` is a ruby gem, which means it has to be installed.
Pry is a REPL
- Read
- Evaluate
- Returns result
- Loops back the start

You can start a `pry` session the same way you'd start an `irb` session from the terminal.

### `cd` in `pry`
You can use this command to move in and out of objects
```
pry(main) > arr = [1, 2, 3]
[1, 2, 3]
pry(#Array):1> ls
### This will list methods available to the array object. From here, since we are in the object we can just call the method ###
pry(#Array):1> first
=> 1
pry(#Array):1> reverse
[3,2,1]

pry(#Array):1> show-doc map
### This brings up documentation###
```
You can use common linux terminal commands to navigate scope within `pry`

`cd ..` ## this will move us back to the main scope
`cd -` ## this switches back to the last two contexts
`cd /` ## this brings us back to the top-level scope at any point/location
