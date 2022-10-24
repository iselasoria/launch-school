=begin
-------P
Bubble sort iterates through an array and swaps elements if the first is greater than the second.

input: Array
output : array (sorted)
Rules:
  - you can use sort

Goal: to sort an array in ascending order

-------E
array = [5, 3] ---> [3,5]
array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie) --> %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

-------D/M
Model Solution:
 - 6  2  7  1  4  Start: compare 6 > 2? Yes
 - 2  6  7  1  4  Exchange
 - 2  6  7  1  4  6 > 7? No (no exchange)
 - 2  6  7  1  4  7 > 1? Yes
 - 2  6  1  7  4  Exchange
 - 2  6  1  7  4  7 > 4? Yes
 - 2  6  1  4  7  Exchange
-------A
- read the input array
- set a deltas variable to track changes to arr
- iterate through array
- while deltas is true/ while there are changes
  - loop to execute
    - if current element is greater than element at index + 1
      - swap elements using index reasignment
        - first accessing elements to swap and then setting them to their new values
          - example: array[0], array[3] = array[3], array[0]
    - reset delta 
    - break if delta is False
    - return arr
  

    
=end


def bubble_sort!(arr)
  rounds = 0

  loop do
    arr.each_with_index do |item, idx|
      if idx <= (arr.length - 2) # up to the second to last element
        if item > arr[idx + 1] # if fist item is greater than second
          arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx] # swap
        end
      end
    end
    rounds += 1
    break if rounds == arr.size - 1
  end

  arr
end



# test cases 
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

