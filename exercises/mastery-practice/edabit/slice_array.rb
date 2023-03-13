=begin 
=begin
* DONE 07m26s
You are given an array that contains only integers (positive and negative). Your job is to sum only the numbers that are the same and consecutive. The result should be one array.

You can assume there is never an empty array and there will always be an integer.

I: array 
O: array 

Rules:
- sum only consetive and identical elements 
- elements that dont have consecutive identicals stay on their own 

Exmaples:
[1,4,4,4,0,4,3,3,1,1]
1 --> 1
4 4 4--> 12
0. --> 0
4 --> 4
3 3  --> 6
1 1 --> 2
[1,12,0,4,6,2]

DS:
arrays 

Algorithm:
- iterate over the input array and slice it when the next number is no longer the same as the current store as `groups`

- iterte over groups to transform it 
  - sum each element 
  - return transformation 

=end

def sum_consecutives(arr)
  groups = arr.slice_when {|a, b| a != b}.to_a

  groups.map {|g| g.sum}
end

p sum_consecutives([1,4,4,4,0,4,3,3,1,1]) == [1,12,0,4,6,2]
p sum_consecutives([1,1,7,7,3]) == [2,14,3]
p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]
