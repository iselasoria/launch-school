### Exercises

##### E1 Where can you find the most recent Ruby documentation? 
https://ruby-doc.org/ or most recently https://docs.ruby-lang.org/en/


##### E2 Locate the description of the `while` loop in the Ruby documentation

https://ruby-doc.org/core-3.1.2/doc/syntax/control_expressions_rdoc.html#label-while+Loop

##### E3 Using the docs, determine what value `while` returns. 
The result of a `while` loop is `nil` unless `break` and then the value passed to `break` is used

##### E4 Locate the documetation for `break` and determine what value `break` sets the return value for the `while` loop

`break` returns `nil` when no argument is passed to it. It returns the value of the argument when one is provided.

You can check this in irb:

```
result = while true
  break
end
p result
```
##### E5 Using the ruby docs determine how you can write large numbers in a way that makes them easier to read
https://ruby-doc.org/core-3.1.2/doc/syntax/literals_rdoc.html#label-Integer+Literals

A number like `1234567` could be written as `1_234_567` to improve readability. This is the same as `1,234,567`

##### E6 Using the docs, termine how you should write symbol that represents your name.
https://ruby-doc.org/core-3.1.2/doc/syntax/literals_rdoc.html#label-Symbol+Literals
`:Rosa`

##### E7 Locate the string class
https://ruby-doc.org/core-3.1.2/String.html

##### E8 Find a method in the docs to right-justify a string

https://ruby-doc.org/core-3.1.2/String.html#method-i-rjust

```
irb(main):006:0> "hello".rjust(20)
=> "               hello"
```