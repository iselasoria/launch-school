`if` statements do not create a block, for this reason if we initialize a variable inside an `if` statement we can access it outside. Keep in mind in the below example, there were additional variables that got assigned before this.

```
if operator == '1'
	result = num1 + num2
end
```

