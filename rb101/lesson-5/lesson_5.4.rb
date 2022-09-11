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

# E4 No need to make a table now, but take apart this code:
[{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
  hash.all? do |key, value|
    value[0] == key.to_s
  end
end
# => [{ :c => "cat" }]

# SOLUTION
# The elements in the outter collection are 
# { a: 'ant', b: 'elephant' }
# { c: 'cat' }
# A call to select iterates through these and yields the use to the method call to `all?`
# `all?` returns true if all elements in the collection meet the criteria specified by the subsequent block, false if any of them fail to pass.
# Inside the block that all? is using, in the first iteration the object passed is { a: 'ant', b: 'elephant' } and the block asks if its 
# value[0] which is 'a' in the first element, and 'e' in the second are equal to its corresponding string representation of symnbol-- 'a' and 'b' respectively. 
# One meets the criteria the other does not. That's enough for the whole run to fail to meet the criteria so the first iteration returns false. The second element 
# passed to `all?` is {c: "cat"} in this case the block does meet the criteria and therefore the method call to all? returns true. Going back up to the select level
# of the code snippet, select will "select" the elements for which its block returned true. In this case, the only one that passed was {c: "cat"}.

# E5 Take a moment to break down this code:
[[[1], [2], [3], [4]], [['a'], ['b'], ['c']]].map do |element1|
  element1.each do |element2|
    element2.partition do |element3|
      element3.size > 0
    end
  end
end
# => [[[1], [2], [3], [4]], [["a"], ["b"], ["c"]]]

# This code has three method calls. There are six return values to consider in a snippet like this:
# - the return of `.map`
# - the return of the block used by `.map`
# - the return of `.each`
# - the return of the block used by `.each`
# - the return of `.partition`
# - the return of the block used by `.partition`
# We know that `.map` uses the return of its block to populate its resulting array. So we move on to the next line to see what its block returns.
# We see that the next method call inside `map`s block is a method call to `each`, and since we know each returns its calling object we can actually determine what the overall return value of `map` will be
# each returns its callinf objects and so that is the return value that gets used by `map`


# E6 Let's say we have the following data structure of nested arrays and we want to increment every number by 1 without changing the data structure.
[[[1, 2], [3, 4]], [5, 6]].map do |arr|
  arr.map do |el|
    if el.to_s.size == 1    # it's an integer
      el + 1
    else                    # it's an array
      el.map do |n|
        n + 1
      end
    end
  end
end

# The return value is: [[[2,3],[4,5]], [6,7]]
# the tricky part to pay attention to is the array has different levels of nesting. 
# the breakdown of the different levels is as follows:
# Outter Iterations:
# [[1,2],[3,4]]
# [5,6]
# As we can see, the first element is a nested array, while the second one is a one-dimentional array,
# this means that by the time we hit the inner iteration the breakdown is as follows:
# [1,2]
# [3,4]
# 5
# 6
# We can then see that we can only begin incrementing the elements that we now have access to in their integer form, but the first two are still in an array,
# so we have to get one level deeper in the iteration to be ablet to access those, thus the if statement checks for that and if they are still an array, it goes one level deeper.
# The incrementation happens for the integers 5 and 5 in the second map, which the elements [[1,2],[3,4]] have to go into the deeper level iteration.