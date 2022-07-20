#### Reading Documentation

##### E1 How would you use the `String#upcase` to craete an uppercase verison of the string `xyz`?
"xyz".upcase

##### E2 Asssume you have this array:
`a = %w(a b c d e)` 
How would you use `Array#insert` to inser the numbers 5,6, and 7 between the elements `c` and `d`?

`a.insert(3, 5, 6, 7)`

##### E3 Assume you have the following code, what will each of the `puts` statements print?
```
s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect
puts s.split(',').inspect
puts s.split(',', 2).inspect
```

 1. `["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]` _split without an argument uses white space as its delimiter so it return an array where each character in the string which is separated by a space turns into an element. After that, calling `inspect` returns a string, it is an allias for `Array#to_s`_

 2. `["abc def ghi", "jkl mno pqr", "stu vwx yz"]`
 _split with a comma as an argument splits the original string up into elements in an array and splits them at the comma separator. Calling `inspect` on that array returns a string of that array._

 3. ` ["abc def ghi", "jkl mno pqr,stu vwx yz"] `_split used with the comma as an argument performs the same as above, but the difference now is that we are giving it an optional `limit` parameter. This limit is the number of elements we want ruby to return. All the elements in the array at the limit are grouped into the last element_