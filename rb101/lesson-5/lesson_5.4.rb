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
|     2     | method call `puts`   |Element at index 0 of each subarray   |outputs string representation of integers|        `nil`                              | No                                    |
|     3     | method call `first`  |Each sub-array                        |      None                               |  The value at index 0 of each sub-array   | Used to deterine return value of block|
=end

# E2 Take apart the following block, noting the side effects, outputs and return values at each step.

my_arr = [[18, 7], [3, 12]].each do |arr|
  arr.each do |num|
    if num > 5
      puts num
    end
  end
end


=begin
| **Line**  | **Action**                                       |**Object**                            |**Side Effect**                          |**Return Value**                           |**Is Return Value used?**                                     |
| :-------: |:------------------------------------------------:|--------------------------------------|-----------------------------------------|-------------------------------------------|--------------------------------------------------------------|
|     1     | initialization and assignment of variable my_arr | [[18,7],[3,12]]                      |      None                               |[[18,7],[3,12]]                            | No                                                           |
|     1     | method call `each`                               | [[18,7],[3,12]]                      |      None                               |The calling object [[18,7],[3,12]]         | Yes, used in variable assignemtn to my_arr                   |
|    1-7    | outter block execution                           |Each sub-array                        |      None                               |its calling object, each sub-array         | No                                                           |
|    2-6    | inner block execution                            |Elements inside the sub-array         |      None                               |nil                                        | No                                                           |
|     3     | comparison  `(>) `                               |Elemet in the sub-array at iteration  |      None                               |boolean                                    | Yes, used by `if`                                            |
|    3-5    | if statement                                     |The return value of the comparison (<)|      None                               |nil                                        | Yes, used to determine value of inner block                  |
|     4     | method call `puts`                               |Element of the subarray at iteration  |Outputs string representation of integer |nil                                        | Yes, used to determine return value of conditional statement |
=end


# E3 Take apart the following code:
[[1, 2], [3, 4]].map do |arr|
  arr.map do |num|
    num * 2
  end
end

=begin
| **Line**  | **Action**                  |**Object**                            |**Side Effect**                          |**Return Value**                           |**Is Return Value used?**                         |
| :-------: |:---------------------------:|--------------------------------------|-----------------------------------------|-------------------------------------------|--------------------------------------------------|
|     1     | method call `map`           |Original Array [[1,2],[3,4]]          |      None                               |New array                                  | No                                               |
|    1-5    | outter block execution      |Each sub-array                        |      None                               |New transformed array                      | Used by first map for transformation             |
|     2     | method call `map`           |Each sub-array                        |      None                               |New transformed array                      | Yes, used to determine outer blocks return       |
|    2-4    | inner block execution       |Element within each subarray          |      None                               |An integer                                 | Yes, used by inner map for new array             |
|     3     | method call * with 2 as arg |Element within each sub-array         |      None                               |An integer                                 | Used to deterine return value of inner block     |
=end

