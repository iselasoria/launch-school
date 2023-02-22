=begin 
# given an array of numbers, check if the array is a "sprial"
if the numbers increase to a single max, then decrease, it is a spiral. return false if not a spiral.


I: array of integers 
O: boolean 

Rules:
- a spiral:
  - there is a singel max 
  - numbers ascend up to the max
  - numbers descend down to the same min 

Examples:
input: [1,2,3,2,1]
middle_idx: arr.size / 2
l_side: 0...middle_idx--> [1,2]
r_side: middle_idx + 1 up to the end --> [2,1]
For this to be a spiral:
  - l_side must be sorted
  - the middle must be larger than l_side.last 
  - r_side must be sorted in descending order 


input: [1,2,4,6,4,2,1]
middle_idx : 3 --> 6 
l_side: 1,2,4
r_side: 4,2,1


input: [0,3,5,5,4,3,2,1] --> max number repeats

input: [1,2,4,6,4,1,2]

Notes:
- a spiral must have an odd number of items 
- rule out as false all those that have an even numbers of items 
- join a number array with join into stirng, cast into integer and get digits to reverse 
- check if max repeats, if it does not a spiral 

Data Structures:
I: array 
Interim: array 
O: boolean

Algorithm:
- find the max of the array 
- iterate over the array 
- with every iteration  
  - the current number should be greater than the next 
  - if that is not true, the next number must be the max and if its not, return false 
  

=end 

def spiral(arr)
  max_idx = arr.index(arr.max)

  return false if arr.count(arr.max) > 1

  l_side = arr[0...max_idx]
  r_side = arr[max_idx + 1..-1]
  
  
  r_side_check = r_side.sort_by {|i| -i}

  if l_side.last < arr[max_idx] && l_side == l_side.sort && r_side == r_side_check
    return true
  else
    return false
  end
end

p spiral([1,2,3,2,1]) == true
p spiral([1,2,4,6,4,2,1]) == true
p spiral([0,3,5,4,3,2,1]) == true # max is not in the middle 
p spiral([1,2,4,6,4,2,4]) == false
p spiral([1,2,4,6,4,1,2]) == false 
p spiral([1,2,4,6,4,2,1,3]) == false 
p spiral([1, 5, 4, 3, 2, 1, 0]) == true
p spiral([0,3,5,5,4,3,2,1]) == false




# def spiral(arr)
#   return false if arr.size.even?
#   middle_idx = arr.size / 2
#   l_side = arr[0...middle_idx]
#   r_side = arr[middle_idx + 1..-1]
  
#   return false if arr[middle_idx] != arr.max
  
#   r_side_check = r_side.sort_by {|i| -i}

#   if l_side.last < arr[middle_idx] && l_side == l_side.sort && r_side == r_side_check
#     return true
#   else
#     return false
#   end
# end