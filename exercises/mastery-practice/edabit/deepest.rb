=begin 
https://edabit.com/challenge/8yGWf7kLZycTxjRQd

You are given an array which may contain subarrays. Your task is to find the depth of the deepest subarray.

[a] = 1 depth
[[a]] = 2 depth
[[[a]]] = 3 depth, etc
Examples
deepest([1, [2, 3], 4, [5, 6]]) ➞ 2

deepest([[[[[[[[[[1]]]]]]]]]]) ➞ 10

deepest([1, 4, [1, 4, [1, 4, [1, 4, [5]]]]]) ➞ 5
Notes
N/A

I: array of integers 
O: Integer 

Rules:
- we are looking for the depth of the deepest subarray 

Examples:
  - [a] -> 1
  -[[1]] -> 

deepest([1, [2, 3], 4, [5, 6]]) ➞ 2
* the second and fourth elements in the array are arrays themselves 


deepest([[[[[[[[[[1]]]]]]]]]]) ➞ 10
* keep iterating until we find an integer 


deepest([1, 4, [1, 4, [1, 4, [1, 4, [5]]]]]) ➞ 5
* original array is first depth -> [1, 4, [1, 4, [1, 4, [1, 4, [5]]]]]
  * Third item in og array is an array --> [1, 4, [1, 4, [1, 4, [5]]]]]
    * its third item is an array --> [1, 4, [1, 4, [5]]]]]
     * its third item is an array --> [1, 4, [5]]]]]
       * third item in the aray is an array --> [5]
levels = 5 

DS:
I: array 
Interm: array 
O: integer 

Algorithm:
- init a `levels` variable and set to 0 
- init a `new_struc` variable to hold the new array --> input # [1, 4, [1, 4, [1, 4, [1, 4, [5]]]]]
- init a variable `arr_copy` to hold a copy of the original array 


- enter a loop  # [1, 4, [1, 4, [1, 4, [1, 4, [5]]]]]
  - with every item in the new_struc
    - if the item is an array
      - reassign new_struc to that item 
      - increment the levels by 1 
-break when I find an integer 
=end 

def deepest(arr)
  levels = 0
  new_struc = arr 
  arr_copy = arr.dup 


  while new_struc.kind_of? Array 
    arr.each do |item|
      if item.kind_of? Array 
        puts "Item is array: #{item}" 
        new_struc = item 
        levels += 1
        puts "Levels #{levels} and New Structure: #{new_struc}"
      else
        puts "Item is integer: #{item}; deleting from copy" 
        arr_copy.delete(arr_copy.index(item))
      end
      p item
    end  
    # puts "OG: #{arr.last.last.last.last.last}"
    break if arr_copy.size == 1
  end 
  levels 
end
# test cases 
# p deepest([1, 4, 5]) ==  1
# p deepest([[2, 3], 4, [6, 7, [8]]]) ==  3
# p deepest([5, [[[[[[[[[[2]]]]]]]]]], [[[[[[[[[[[[4]]]]]]]]]]]]]) ==  13
# p deepest([[[3, 2, [[4]], 8], [[2, 4], 5]], 3, 5, [9, 1]]) ==  5
# p deepest([[6, 9, 6], [[[1, 4], 0, 8], [8, 0, [4, 1]]], [[5, 3, 4], [4, 3, 5]]]) ==  4
p deepest([1, 4, [1, 4, [1, 4, [1, 4, [5]]]]]) #== 5


