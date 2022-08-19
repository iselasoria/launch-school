`multiple assignment` is when you assig more than one value on the same line. When an array is assigned to two variables on the same line, each element of that array gets assigned to one of the variables. #TODO get better example


## Array#slice 

`arr = [1, 'two', :three, '4']`

`arr.slice(3, 1) # => ["4"]` <-- returns "4" inside an array object because we passed in a start index and a range

`arr.slice(3..3) # => ["4"]` <-- returns "4" inside an array object because we passed in a starting index and a range

`arr.slice(3)    # => "4"` <-- when we dont pass in a range, the `Array#slice` method will return just the element itself, in this case the string `"4"`