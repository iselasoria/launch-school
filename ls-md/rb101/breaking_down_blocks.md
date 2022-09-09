# Working with Blocks: Side Effects and Return Values

## Example 1
```
[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
# 1
# 3
# => [[1, 2], [3, 4]]
```
### Breakdown:
The method `.each` is called on the nested array object `[[1,2],[3,4]]`. With each iteration, the current element in the array is passed to the block as argument `arr`. Since we have a nested array, every iteration `arr` is referencing a sub array inside the original collection. Inside the block, the method `.first` is called on that current element in the iteration, retrieving the first element in that current array. `puts` is called on the return value of calling `first` on the current sub array that is passed to the block. So the output of this code is:
```
1
3
```
Meanwhile, the return of the block is `nil`, due to that call to `puts` being the last evaluated expression in the block. Finally, since `each` does not take into account the return value of the block, it will just return the original object it was called on: `[1,2][3,4]`.

---

## Checklist to Keep in Mind
- What is the type of action being performed? (method call, block, conditional, etc)?
- What is the object that action is being performed on?
- What is the effect of that action? (ie) destructive action, output)
- What is the return value of the action?
- Is the return value used by whatever triggered the action?


Going back to [[breaking_down_blocks#Example 1]], we can organize that checklist in a table:


| **Line**  | **Action**           |**Object**           |**Side Effect** |**Return Value** |**Is Return Value used?** |
| :-----: |:----------------:|-----------------|------------|-------------|---|
| 1     | method call `each` | The outer array |   None     |   The calling object          |No, but shown on line 6|
| 1-3   | block execution  | Each sub-array  |   None     |      `nil`       | No|
| 2     | method call `first` | Each sub-array |    None     |       Element at index `0` of sub-array  | Yes, used by `puts`
| 2     | method call `puts`  | Element at index `0` of sub-array |  Outputs string representation of an Integer | `nil` | Yes, used to determine the return value of the block |       |




