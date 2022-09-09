# E1 Try taking appart the code bellow, paying attention to Side effects, outputs and return.

[[1, 2], [3, 4]].map do |arr|
  puts arr.first
  arr.first
end

=begin
| **Line**  | **Action**           |**Object**                            |**Side Effect**                          |**Return Value**                           |**Is Return Value used?**              |
| :-------: |:--------------------:|--------------------------------------|-----------------------------------------|-------------------------------------------|---------------------------------------|
|     1     | method call `map`    |Outer Array                           |      None                               |New array`[1,3]`                           | No                                    |
|    1-4    | block execution      |Each sub-array                        |      None                               |1 & 3 in each iteration                    |Used by map to populate new arr        |
|     2     |method call `puts`    |Each sub-array                        |outputs string representation of integers|   `nil`                                   |  No                                   |
|     3     |  method call `first` |Element at index 0 of each subarray   |      None                               |  The value at indez 0 of each sub-array   | Used to deterine return value of block|
=end