=begin 
TODO needs work 

Write a function that transforms an array into an array of its differences repeatedly until there exists only one element left. A difference is A[n+1] - A[n].

To illustrate:

[5, 1, 9, 3, 4, 0]

[-4, 8, -6, 1, -4]
# 1 - 5 = -4; 9 - 1 = 8; 3 - 9 = -6; etc.

[12, -14, 7, -5]

[-26, 21, -12]

[47, -33]

-80
Examples
n_differences([5, 1, 9, 3, 4, 0]) ➞ -80
n_differences([1, 1, 1, 1]) ➞ 0
n_differences([5, 8, 8]) ➞ -3
Notes
Each array will have at least two elements.


I: array of numbers 
O: integer 

Rules:
- can have negatives
- assume each array to be at least two elements long 
- calculate differences repeatedly until there is only a single number left 
- diff is calculated as next element in the array - current element 
- arrays that have many of the same number repeated, return 0 

Examples:
      [5, 9, 7, 3]                                    == 4
 ** stops at the penultimate element in the array  
      5 -> (9-5) ->  4 -> (-2-4)  -> -6 -> (-6--2) --> -4
      9 -> (7-9) -> -2 -> (-4--2) -> -2
      7 -> (3-7) -> -4
      3 

      [5, 8, 8]                                       == -3
      5 -> (8-5)->  3 -> (0-3)--> -3  =)
      8 -> (8-8) -> 0
      8

DS:
I: arrays 
Interm: array 
O: integer 

Algorithm:
- return 0 if item unique size is 1 
- make a copy of origina Array `arr_dupe`

- init running_diff_arr to empty arr 

- enter a looping mechanism 
  - iterate from 0 up to and not including the last index 
    - calculate `diff` as next item - current item 
    - store diff in `array_to_be`
    - when the iteration eaches the penultimate value, reaassign array to be to the running_diff_arr
    - break out of the loop when the running_diff_arr is only one element long 

- retiurn running_diff_arr's first element 
=end 


def n_differences(arr)
  return 0 if arr.uniq.size == 1
  arr_dupe = arr.dup 

  running_diff_arr = arr_dupe

  # loop
  while running_diff_arr.size > 1
    array_to_be = []
    running_diff_arr.each_with_index do |item, idx|
      break if idx == running_diff_arr.size - 1 # skip last index
      diff = running_diff_arr[idx + 1] - item
      array_to_be << diff 
      # array_to_be # [3, 0]

    end
    running_diff_arr = array_to_be
  end
  running_diff_arr.first
end
# test cases 
p n_differences([5, 1, 9, 3, 4, 0]) == -80
p n_differences([8, 9, 2, 5, 4, 3, 3, 1, 6]) == -94
p n_differences([5, 1, 9, 6, 1, 7, 3, 4]) == 118
p n_differences([5, 8, 8]) == -3
p n_differences([5, 9, 7, 3]) == 4
p n_differences([1, 5, 3, 9, 7]) == -30
p n_differences([4, 0, 0, 0, 1]) == 5
p n_differences([3, 5]) == 2
p n_differences([1, 1, 1, 1]) == 0