## Variable Scope

### Methods
Methods can only access variables that initialized within the method's body or were passed in explicitly as arguments, and they cannot be accessed outside of the method definition, unless it is the `return` value.

### Blocks
Blocks can access variables initialized outside them, but the variables initialized inside blocks cannot be used outside them. Blocks can reach outside the block and access variables, but nothing can reach inside them to grab theirs.

> #### Blocks get created in a `do..end` if and only _IF_ the `do...end` follows a method invocation such as `.times` or `each`. In a `while` or a `for` loop there is no block because these arent method's just ruby language keywords.


#### Scope
`inner scope` is the scope created by a block following a method invocation.

Nested blocks will create nested scope
> Variables initialized in an outer scope can be accessed in an inner scope, but not vice versa.

