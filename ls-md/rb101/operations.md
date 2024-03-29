## Precedence

The meaning of an expression is determined by the `presendence` of the operators used. 
When the operation has two `operands`, each with the same presedence then the expression
gets evaluated from left-to-right, _Note:_ In such cases it can lead to unexpected
results when using the `||` and `&&` or ternary operator `a ? b : c`

> [Ruby treats] ?:, &&, and || differently from other operators and doesn't evaluate subexpressions unless it needs them.
---

When an operator has higher precedence than another it is said that it binds more tightly
to its operands. 
`3 + 5 * 7` <-- in this example `*` binds more tightly to its operands `5` and `7` than does `+`. 


```
def value(n)
  puts n
  n
end

puts value(3) + value(5) * value(7)
```
The code above outputs:
```
3
5
7
38
```

The fact that the program outputs the first three numbers in that order might make you think it's evaluating left to right. 
But operators need values and we have method calls. So it first must evaluate those methods calls before it can even think of precedence.
This is the reason we see the output `3 5 7` first. Only after those return values are obtained can Ruby consider precedence.

[[quirky-blocks.md#Precedence]]]
Blocks have the lowest precedence of all operators! But the way you pass them matters: `{}` has a slightly higher precedence than `do...end`




# Squigly regexp
Operator to find index number in a string by search term 