# https://www.codewars.com/kata/51ba717bb08c1cd60f00002f/train/ruby
=begin
A format for expressing an ordered list of integers is to use a comma separated list of either

individual integers
or a range of integers denoted by the starting integer separated from the end integer in the range by a dash, '-'. The range includes all integers in the interval including both endpoints. It is not considered a range unless it spans at least 3 numbers. For example "12,13,15-17"
Complete the solution so that it takes a list of integers in increasing order and returns a correctly formatted string in the range format.

I: array of integers
O: string 

Rules:
- array has starting integer and is separated from the ending integer by a dash
  - range includes all integers in the interval 
    ex: 3-8
  - a valid range must be three numbers at least 
- a dash still has to be placed between explicity negative numbers (--)
Examples:
[-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]

[-10--8, -6, -3-1,3-5,7-11,14,15,17-20] -> joined by a comma 
"-10--8,-6,-3-1,3-5,7-11,14,15,17-20"

DS:
array 
strings 

Algorithm:
- slice the original array when the next number is not a direct successor of the current and store in `tiny_ranges`

- iterate over tiny_ranges 
  - for each item in the tiny_range 
    - if tiny_range has 3 or more items 
      - join first element (with a dash) to last element # -10, -9, -8 -> -10--8
      - push to new collection 
    - otherwise, 
      - push tiny range to new collection 

    - return new collection ** might have to join with commas 
=end

def solution(arr)
  tiny_ranges = arr.slice_when {|a,b| b != a.succ}.to_a

  new_col = []
  tiny_ranges.each do |tr|
    if tr.size >= 3
      tiny = tr.first.to_s + '-' + tr.last.to_s
      new_col << tiny
    else
      new_col << tr.join(',')
    end
  end
  new_col.join(',')
end

p solution([-10, -9, -8, -6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-10--8,-6,-3-1,3-5,7-11,14,15,17-20"

p solution([-6, -3, -2, -1, 0, 1, 3, 4, 5, 7, 8, 9, 10, 11, 14, 15, 17, 18, 19, 20]) == "-6,-3-1,3-5,7-11,14,15,17-20"