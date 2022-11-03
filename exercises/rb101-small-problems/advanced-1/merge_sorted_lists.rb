=begin
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.
You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.
Your solution should not mutate the input arrays.

Input: 2 arrays
Output: 1 new array

Goal: iterate and dump into a new array the elements from both lists but in an ordered fashion.

--------------E
Model Solution:
arr1 --> [1, 5, 9] -> smallest 1 \
                                  1 is smaller so it gets pushed to the new array first, then the element from second array
arr2 --> [2, 6, 8] -> smallest 2/

arr1 --> [1, 5, 9] -> smallest 5 \
                                  5 is smaller so it gets pushed to the new array, the 6
arr2 --> [2, 6, 8] -> smallest 5/

arr1 --> [1, 5, 9] -> smallest 9 \
                                  8 is smaller so it gets pushed to the new array, then 9
arr2 --> [2, 6, 8] -> smallest 8/
--------------D
Interim: arrays
- want to track index

--------------A
- initialize empty array object to hold the sorted array
- if either input arr is empty, push a copy of every element in the non-empty array into the results arr
  - force return
- iterate over arr1
  - iterate over arr2
    - if arr1 at current index is larger than arr2 at current index, push arr 1, arr2, else arr2, arr1
    - if 
- return the new array
=end


def merge(arr1, arr2)
  new_sorted = []
  
  if arr1.empty?
    arr2.each {|item| new_sorted << item}
    return new_sorted
  elsif arr2.empty?
    arr1.each {|item| new_sorted << item}
    return new_sorted
  end

  arr1.each_with_index do |num, idx|
   
    if  arr1[idx] == arr1[idx + 1]
      puts "current from first #{arr1[idx]}"
      puts "next from first #{arr1[idx + 1]}"
      new_sorted << arr1[idx] << arr1[idx + 1]
    elsif arr2[idx] == arr2[idx]
      new_sorted << arr2[idx] << arr2[idx + 1]
      puts "current from second #{arr2[idx]}"
      puts "next from second #{arr2[idx + 1]}"
    elsif arr1[idx] < arr2[idx]
      new_sorted << arr1[idx] << arr2[idx]
    elsif arr2[idx] < arr1[idx]
      new_sorted << arr2[idx] << arr1[idx]
    elsif arr1[idx] == arr2[idx]
      new_sorted << arr2[idx] << arr1[idx]
    elsif arr1[idx] == arr1[idx + 1]
    #   puts "From the first array #{arr1[idx]}"
    #   puts "From the second array #{arr2[idx]}"
    #   new_sorted << arr1[idx] << arr1[idx + 1]
    # elsif arr2[idx] == arr2[idx]
    #   new_sorted << arr2[idx] << arr2[idx + 1]
    #   puts "From the first array #{arr1[idx]}"
    #   puts "From the second array #{arr2[idx]}"
    end
    
  end
  new_sorted
end


# todo how to handle when there are elements that are the same in the current iteration 

# test caes
# p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) #== [1, 1, 2, 2, 3]
# p merge([], [1, 4, 5]) == [1, 4, 5]
# p merge([1, 4, 5], []) == [1, 4, 5]