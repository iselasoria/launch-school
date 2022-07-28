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
