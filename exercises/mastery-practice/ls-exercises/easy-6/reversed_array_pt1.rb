=begin 
# TODO Interview Practice
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into 
this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Algorithm:
- iterate over the array 
    arr[0] ---> arr[-4] arr[arr.size * -1] 
    arr[1] ---> arr[-3] arr[arr.size - idx * -1]
    arr[2] ---> arr[-2] arr[arr.size - idx * -1]
    arr[3] ---> arr[-1] arr[arr.size - idx * -1]
=end


def reverse!(arr)
  left = 0
  right = -1

  while left < arr.size / 2 # until we reach the middle
    arr[left], arr[right] = arr[right], arr[left]
    left += 1
    right -=1
  end
  arr
end

list = [1,2,3,4]
p result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true