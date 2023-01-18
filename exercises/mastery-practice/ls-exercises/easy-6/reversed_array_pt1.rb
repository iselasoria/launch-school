=begin 
# TODO 
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
  arr.each_index do |idx|
    if idx == 0
      arr[0] = arr[arr.size * -1]
    else
      p arr
      p arr[idx], arr[arr.size * -1] = arr[arr.size - idx]
      # arr[idx] = arr[arr.size - idx * -1]
    end
  end
  arr
end

list = [1,2,3,4]
p result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

# list = %w(a b e d c)
# reverse!(list) == ["c", "d", "e", "b", "a"] # true
# list == ["c", "d", "e", "b", "a"] # true

# list = ['abc']
# reverse!(list) == ["abc"] # true
# list == ["abc"] # true

# list = []
# reverse!(list) == [] # true
# list == [] # true