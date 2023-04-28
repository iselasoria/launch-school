# What are the use cases for `self` in Ruby, and how does `self`
# change based on the scope it is used in? Provide examples.

`self` is a keyword in ruby that gets used to reference the calling object.
It is most notably used:
1. prepended to a class methodd name
2. prepended to a setter method

`self` refers to differrent things depending on the scope, but it will always
refernce the calling object whether that may be a class, a module or an instance.