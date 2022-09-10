# E1 Try taking appart the code bellow, paying attention to Side effects, outputs and return.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

=begin
| **Line**  | **Action**           |**Object**                            |**Side Effect**                          |**Return Value**                           |**Is Return Value used?**              |
| :-------: |:--------------------:|--------------------------------------|-----------------------------------------|-------------------------------------------|---------------------------------------|
|     1     | method call `map`    |Outer Array                           |      None                               |New array`[1,3]`                           | No                                    |
|    1-4    | block execution      |Each sub-array                        |      None                               |1 & 3, integer at index 0 at each sub-array| Used by map to populate new arr       |
|     2     | method call `first`  |Each sub-array                        |      None                               |Element at index 0 of each sub-array       | Yes, used by puts method              |
|     2     | method call `puts`   |Element at index 0 of each subarray   |outputs string representation of integers|        `nil`                              | No                                    |                                       |
|     3     | method call `first`  |Each sub-array                        |      None                               |  The value at index 0 of each sub-array   | Used to deterine return value of block|
=end