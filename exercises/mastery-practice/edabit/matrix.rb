=begin 
https://edabit.com/challenge/MXbibjS95Y8X4wDZx


Write a function that returns true if there exists a row that is identical to a column in a 2-D matrix, otherwise false.

To illustrate:

[
  [1, 2, 3, 4],
  [2, 4, 9, 8],
  [5, 9, 7, 7],
  [6, 8, 1, 0]
]

// 2nd row + 2nd column are identical: [2, 4, 9, 8]

hasIdentical([
  [4, 4, 4, 4],
  [2, 4, 9, 8],
  [5, 4, 7, 7],
  [6, 4, 1, 0]
]) ➞ true

hasIdentical([
  [4, 4, 9, 4],
  [2, 1, 9, 8],
  [5, 4, 7, 7],
  [6, 4, 1, 0]
]) ➞ false

hasIdentical([
  [4, 4]
  [2, 1]
]) ➞ false

hasIdentical([
  [4, 2]
  [2, 1]
]) ➞ true

# Non-square matrices should return false.

I: nested array 
O: boolean 

Rules:
- to be true (identical) a maxtrix must:
  - NOT distinct columns / rows 
  - order of a row must be the same as order of a column 
- non-squared maxtrices return false 

Examples:
  [4, 4, 4, 4], 
  [2, 4, 9, 8], 
  [5, 4, 7, 7], 
  [6, 4, 1, 0]

* row 1 and column 2 are identical 

Data Structure:
I: nested array 
Interim: array 
O: boolean 

Notes: 
- the index of a subarray is its row number 
    0  1  2  3
0  [4, 4, 4, 4], 
1  [2, 4, 9, 8], 
2  [5, 4, 7, 7], 
3  [6, 4, 1, 0]

# index at each item in nested input array is a row number 
# index at each item in the sub array is a column number 

Algorithm:
- cols_ = {} -> needs to default to empty arrays as values Hash.new { |h, k| h[k] = [] }
- iterate over input array and its index # 0 -> [4, 4, 4, 4], 1->[2, 4, 9, 8], 2-> [5, 4, 7, 7],3-> [6, 4, 1, 0]
  - iterate over each subarray and its index # [4, 4, 4, 4]
    - set in cols_hash[current index] = [item] in the array {0 => 4, 2,5,6}

zip input array (rows) and columns (as array) and if any have first and second item as the same, return true
=end 

def hasIdentical(matrix)
  return false if matrix.any? { |arr| arr != matrix.map(&:size).max }
  col_hash = {}

  matrix.each_with_index do |row, row_idx| # 0
    row.each_with_index do |num, col_idx|  # 0 1 2 3
      if col_hash.has_key?(col_idx)
        col_hash[col_idx] << num # push mroe keys
      else
        col_hash[col_idx] = [num]
      end
    end
  end
  # cols = col_hash.map {|pair| pair[1]}

  col_hash.values.any? {|col| matrix.include?(col)}
end

p hasIdentical([
  [4, 4, 4, 4], 
  [2, 4, 9, 8], 
  [5, 4, 7, 7], 
  [6, 4, 1, 0]
]) #== true

p hasIdentical([
  [4, 2, 4, 6, 1], 
  [2, 4, 9, 4, 5], 
  [5, 1, 7, 1, 9], 
  [6, 4, 1, 0, 33], 
  [5, 5, 5, 33, 5]
]) == true

p hasIdentical([
  [4, 2],
  [2, 1]
]) == true

p hasIdentical([
  [4, 4, 9, 4], 
  [2, 1, 9, 8], 
  [5, 4, 7, 7], 
  [6, 4, 1, 0]
]) == false

p hasIdentical([
  [4, 4],
  [2, 1]
]) == false

p hasIdentical([
  [4, 4, 3],
  [2, 1, 9], 
  [3, 8, 1]
]) == false

p hasIdentical([
  [4, 4, 4],
  [2, 1, 4]
]) == false

p hasIdentical([
  [4, 4, 4],
  [4, 2]
]) == false