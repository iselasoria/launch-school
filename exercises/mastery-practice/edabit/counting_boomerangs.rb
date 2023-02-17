=begin 
# DONE 18m19s
https://edabit.com/challenge/b7iHQDw72zzkmgCun

A boomerang is a V-shaped sequence that is either upright or upside down. Specifically, a boomerang can be defined as: sub-array of length 3, with the first and last digits being the same and the middle digit being different.

Some boomerang examples:

[3, 7, 3], [1, -1, 1], [5, 6, 5]

Create a function that returns the total number of boomerangs in an array.

To illustrate:

[3, 7, 3, 2, 1, 5, 1, 2, 2, -2, 2]
// 3 boomerangs in this sequence:  [3, 7, 3], [1, 5, 1], [2, -2, 2]

Be aware that boomerangs can overlap, like so:
[1, 7, 1, 7, 1, 7, 1]
// 5 boomerangs (from left to right): [1, 7, 1], [7, 1, 7], [1, 7, 1], [7, 1, 7], and [1, 7, 1]

Examples
countBoomerangs([9, 5, 9, 5, 1, 1, 1]) ➞ 2
countBoomerangs([5, 6, 6, 7, 6, 3, 9]) ➞ 1
countBoomerangs([4, 4, 4, 9, 9, 9, 9]) ➞ 0

Notes
[5, 5, 5] (triple identical digits) is NOT considered a boomerang because the middle digit is identical to the first and last.

I: array of integers
O: integer

Rules:
- a boomerang can have its starting point at any index in the array 
  - not chunks of three!!
- a boomerang must have first and last numbers the same, and middle must be different 
- count the number of times the input array contains boomerangs 
- array can have negative values 

Examples:
[9, 5, 9, 5, 1, 1, 1] ➞ 2
[9, 5, 9]---> boomerang! 
   [5, 9, 5] ---> boomerang!
      [9, 5, 1]
          [5, 1, 1]
              [1, 1, 1] --> stops because chunks of three are no longer possible 
returns 2 

[5, 6, 6, 7, 6, 3, 9] ➞ 1
[5, 6, 6]
   [6, 7, 6] --> boomerang!
      [7, 6, 3]
          [6, 3, 9]
returns 1

Data Structures:
I: array 
Interim: arrays/nested arrays 
O: integer 

Algorithm:
Helper Method: is_boomerang?(sub_array)
  - check that first and last elements are the same and unique size is 2 
  - return true if sub_array is boomerang
Main Method: countBoomerangs(arr)
- init boomerangs_arr = []
  - starting from position 0 and up to arr.size - 3 --> gives access to an index 
  - define chunk as array at moving_position up to 3 items 
    - check chunk with is_boomerang? and if it's true, push to boomerangs_arr 
    - return boomerangs_arr size 

=end 

def is_boomerang?(sub_array)
  sub_array.last == sub_array.first && sub_array.uniq.size == 2
end


def countBoomerangs(arr)
  boomerangs_arr = []

  (0..arr.size - 3).each do |moving_position|
    chunk = arr[moving_position, 3]
    boomerangs_arr << chunk if is_boomerang?(chunk)
  end
  boomerangs_arr.size
end

# test cases 

p countBoomerangs([9, 5, 9, 5, 1, 1, 1]) == 2

p countBoomerangs([5, 6, 6, 7, 6, 3, 9]) == 1

p countBoomerangs([4, 4, 4, 9, 9, 9, 9]) == 0