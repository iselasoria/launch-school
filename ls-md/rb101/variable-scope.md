## Variable Scope

### Methods
Methods can only access variables that initialized within the method's body, and they cannot be accessed outside of the method definition, unless it is the `return` value.

### Blocks
Blocks can access variables initialized outside them, but the variables initialized inside blocks cannot be used outside them. Blocks can reach outside the block and access variables, but nothing can reach inside them to grab theirs.