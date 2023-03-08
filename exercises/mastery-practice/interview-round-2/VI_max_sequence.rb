=begin
* DONE 02m21s
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence of an array of integers.
Easy case is when input array is all positive, then return total sum of array. 
If total array is made up of only negative numbers, return 0 instead. 
Empty array assumed to have 0 greatest sum. Note the empty array is also a valid subarray. 


I: arrauy 
O: integer 

Rules:
- return 0 if the inut is empty or if there are only negatives 
- sum the subsequences in the array 
- find and return the highest summing subsequence

Examples:
[-2, 1, -3, 4, -1, 2, 1, -5, 4]
            [4, -1, 2, 1]
                  6
DS:
nested arrays 

Algorithm:
- init subs_sums = []
- from 0 to end of arr size set a moving index 
  - from moving index to end of arr set another moving index 
    - define a slice as arr[starting..ending]
    - push slices sums to subs 

    - return max sum 

=end 

def max_sequence(arr)
  return 0 if arr.empty? || arr.all? {|i| i < 1}
  subs_sums = []

  (0...arr.size).each do |st|
    (st...arr.size).each do |nd|
      slice = arr[st..nd]
      subs_sums << slice.sum
    end
  end
  subs_sums.max
end


p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([]) == 0 
p max_sequence([11]) == 11
p max_sequence([-32])== 0 
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12