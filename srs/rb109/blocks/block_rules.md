### Block precedence
Blocks have the lowest precedence of all operators.
But `{}` has a slightly higher precedence than `do..end`. #flashcard

### `do..end` that does not create a block
- `for` loops 
- `while` loops do not create blocks
- `if` statements
#flashcard

### Block Scope
You cannot reach into blocks to grab variables, but variables created outside
the block are available inside it. #flashcard

### Explain Variable Shadowing
Variable shadowing occurs when the variable name used as the block parameter is the same as 
the variable name initialized outside the block. Doing this prevents the block from being
able to access the variable outside the block.

```
n = 10

[1, 2, 3].each do |n|
  puts n
end

```
#flashcard
