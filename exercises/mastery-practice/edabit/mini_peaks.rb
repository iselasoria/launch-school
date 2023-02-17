=begin 
Mini Peaks

Write a function that returns all the elements in an array that are strictly greater than their adjacent left and right neighbors.
Examples

mini_peaks([4, 5, 2, 1, 4, 9, 7, 2]) ➞ [5, 9]
# 5 has neighbours 4 and 2, both are less than 5.
mini_peaks([1, 2, 1, 1, 3, 2, 5, 4, 4]) ➞ [2, 3, 5]
mini_peaks([1, 2, 3, 4, 5, 6]) ➞ []

Notes

    Do not count boundary numbers, since they only have one left/right neighbor.
    If no such numbers exist, return an empty array.

I: array 
O: array, can be empty 

Rules:
- ignore first and last items in the array 
- subarray is only three items long, just the immediate neighbors 
- a subarray is formed from moving index up to a size of three 

Examples:
[4, 5, 2, 1, 4, 9, 7, 2]
[4, 5, 2]---> 5 
   [5, 2, 1]
      [2, 1, 4]
         [1, 4, 9]
            [4, 9, 7]---> 9 
               [9, 7, 2] ***** stops at index 5 

Data Structures:
I: array 
Interim: array 
O: array 

Algorithm:
Helper Method: tri_chunks(arr)
  - return nested array of chunks 
Main Method: mini_peaks(arr)
- init peaks_arr
- make a call to tri_chunks(arr) and store as `tri`
  - for each chunk of three
    - if the chunk at position 1 is largest in the chunk
      - push chunk to peaks_arr 

=end 

def tri_chunks(arr)
  subs = []

  (0..arr.size - 3).each do |starting|
    subs << arr[starting, 3]
  end
  subs
end
def mini_peaks(arr)
  tri = tri_chunks(arr)

  peaks_arr = []

  tri.each do |chunk|
    peaks_arr << chunk[1] if chunk[1] == chunk.max
  end
  peaks_arr
end

# test cases 
p mini_peaks([4, 5, 2, 1, 4, 9, 7, 2]) == [5, 9]
p mini_peaks([1, 2, 1, 1, 3, 2, 5, 4, 4]) == [2, 3, 5]
p mini_peaks([1, 2, 3, 4, 5, 6]) == []
p mini_peaks([1, 1, 2, 1])
