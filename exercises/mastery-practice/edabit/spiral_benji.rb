# * DONE 1558s
# An array of integers is a SPIRAL if the integers increase to a max value,
# and then decrease down from there. Write a method that returns true if an
# array is a spiral, else return false.

=begin 

I: array 
O: boolean

Rules:
- spiral:
  - integers increase up to a max, and then decrease again 
  - retrun true if spiral, else false 

Examples:
p spiral([1,2,3,2,1]) == true # constant increase to max and then drop
p spiral([1,2,4,6,4,2,1]) == true # constant increase to max and then drop
p spiral([0,3,5,4,3,2,1]) == true # constant increase to max and then drop
p spiral([0,3,5,5,4,3,2,1]) == false ## plateau --> false 
p spiral([1,2,4,6,4,2,4]) == false # the chain breaks when after 2 we find 4 again 
p spiral([1,5,4,6,4,2,4]) == false # the chain breaks when we see a drop before reaching the max 

Model Solution: 
spiral([0,3,5,4,3,2,1]) == true
  max: 5 
  only see increases up to 5 
  only see decreases down to the end of array 

spiral([0,3,5,5,4,3,2,1]) == false
  max: 5 
  5 is followed by 5 

DS: 
I: array 
Interm: arrays 
O: boolean 

Algorithm:

- identify the array max and its index 

- count the occurences of the max, if more than one, return false 

- init `asc` to a slice of the array from 0 up to and not including max 
- init `desc` to a slice of the array max position plus one, and up to the end

* asc should be sorted and desc should be the same as sorted in reverse ---> spiral 

=end

def spiral(arr)
  max_num = arr.max 
  max_idx = arr.index(max_num)

  return false if arr.count(max_num) > 1

  asc = arr[0...max_idx]
  desc = arr[max_idx + 1..-1]

  (asc == asc.sort) && (desc == desc.sort.reverse)
end

p "-------sprial tests"
p spiral([1,2,3,2,1]) == true
p spiral([1,2,4,6,4,2,1]) == true
p spiral([0,3,5,4,3,2,1]) == true
p spiral([1,2,4,6,4,2,4]) == false
p spiral([1,5,4,6,4,2,4]) == false

p spiral([0,3,5,5,4,3,2,1]) == false



