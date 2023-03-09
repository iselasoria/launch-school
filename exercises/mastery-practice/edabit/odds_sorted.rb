# https://www.codewars.com/kata/578aa45ee9fd15ff4600090d/train/ruby
=begin
You will be given an array of numbers. You have to sort the odd numbers in ascending order while leaving the even numbers at their original positions.

Examples
[7, 1]  =>  [1, 7]
[5, 8, 6, 3, 4]  =>  [3, 8, 6, 5, 4]
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]  =>  [1, 8, 3, 6, 5, 4, 7, 2, 9, 0]



I: array of integers 
O: array 

Rules:
- even numbers are left alone in the same place 
- odd numbers are to be sorted in ascening order 
- empty arrays return empty arrays 
- single element arrays return the input array 



Examples:
input:    [5, 3, 2, 8, 1, 4, 11]
odds:       [5,3,1,11]--> [1,3,5,11]
replace:  [ 1, 3 , 2, 8, 5 , 4, 11  ]
return:   [1, 3, 2, 8, 5, 4, 11]

DS: 
i: array 
interim: array
o: array 

Algorithm:
- separate odds from evens # [[5,3,1,11],[2,8,4]]
- sort in descending order (so we can pop later)

- iterate over the original array and its index 
  - with each iteration
    - if the number at the current iteration was odd in the original array 
      - replace the current item with the first item from the odds sorted list ** changing arr (pop off from the reverse sorted list of odds)


=end 

def sort_array(arr)
  return arr if arr.empty? || arr.size == 1

  odds, evens = arr.partition {|item| item.odd?}
  odds = odds.sort!.reverse!
  #odds = odds.reverse!
  p odds


  arr.each_with_index do |num, idx|
    if num.odd?
      arr[idx] = odds.pop
    end
  end
  arr
end


p sort_array([5, 3, 2, 8, 1, 4, 11]) == [1, 3, 2, 8, 5, 4, 11]
p sort_array([2, 22, 37, 11, 4, 1, 5, 0]) == [2, 22, 1, 5, 4, 11, 37, 0]
p sort_array([1, 111, 11, 11, 2, 1, 5, 0]) == [1, 1, 5, 11, 2, 11, 111, 0]
p sort_array([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
p sort_array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]) == [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
p sort_array([0, 1, 2, 3, 4, 9, 8, 7, 6, 5]) == [0, 1, 2, 3, 4, 5, 8, 7, 6, 9]
p sort_array([]) == []
p sort_array([19]) == [19]
p sort_array([2]) == [2]
p sort_array([7,5]) == [5,7]