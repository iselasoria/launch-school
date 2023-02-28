=begin 
* DONE 19m17s
https://launchschool.com/exercises/2a5d5a4e


Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

We can stop iterating the first time we make a pass through the array without making any swaps; at that point, the entire Array is sorted.

For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.


I: array 
O: same array (mutated)

Rules:
- runs for the length of the array 
- with each iteration of the array 
  - checking current item to next to see if the first is greater than the second arg 
    - if they are, swap 
comparison:
  returns of <=>
  * -1 when the first item is smaller than the second 
  * 0 when they are the same 
  * 1 when the first is greater than the second 

EXAMPLES:
- runs through the legnht of the array 
- compares current to next item 
  - swaps if current is greater than next 
    [4,2,8]
    [2,4,8]
  - stops running when there are no swaps in the array 

Data Structures:
arrays 

Algorithm:
- iterate over the length of the array---> x number of times 
- iterate over the array and its index 
  - next when you reach last index 
    - with each iteration 
      - if current element is greater than next 
        - parallel assign current to next, and next to current 
=end 

def bubble_sort!(arr)
  (0...arr.size).each do |item|
    arr.each_with_index do |num, idx|
      # skip last 
      next if idx == arr.size - 1
      # p [num , arr[idx + 1]]
      if num > arr[idx+1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
      end
    end
  end
  arr
end

array = [5, 3]
p bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
p bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)