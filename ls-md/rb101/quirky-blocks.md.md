`if` statements do not create a block, for this reason if we initialize a variable inside an `if` statement we can access it outside. Keep in mind in the below example, there were additional variables that got assigned before this.

```
if operator == '1'
	result = num1 + num2
end
```

This loop construct creates a block. This means local variables initialized in the block will not be available outside it.
```
loop do 
end
``` 

### Precedence
Blocks have the lowest precedence of all opperators! But the way you pass them matters: `{}` has a slightly higher precedence than `do...end`


### _Not_ blocks [[variable-scope#Blocks]]
`do...end` in a `for` or a `while` loop _does not_ create a block!!!

### Variable Shadowing
Variable shadowing happens when the same variable name is used as a block parameter and a variable in the outer scope. For example;
```
n = 10

[1, 2, 3].each do |n|
  puts n
end
```

We know that the block that is being passed to method `each` has access to the outer scope, local variable `n`. But then we went and named the block parameter `n` too. This will cause the outer scope to not be available. So the `n` in this example will refer to the `n` in the block-- each teration of `Array#each`