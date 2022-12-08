=begin 
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.



Problem:
______
Input: three numbers
Output: symbol

Rules:
  explicit:
    - equilateral --> all three sides are the same
    - isosceles --> 2 side are the same 
    - scalene --> all three sides are different
    - valid:
      - sum of two sides is greater than the third 
      - all sides must be greater than 0
  implicit:
    - can have floats
GOAL: determine the type of triangle the three sides make 

Examples / Model Solution:
- 0, 3, 3 ---> :invalid 
- 3, 3, 1.5 ---> two sides the same --> :isosceles
- 3, 3, 3 --> all the same --> :equilateral


Data:
Data Points to Capture:
- index of the iteration
Data Structures in Use:
- in: three numbers 
- interim: array
- out: symbol

Algorithm:
Helper Method: method_name(params)
  - 
Main Method: method_name(params)
- generate an `mother_arr` of the three unputs and sort 
- get unique values of mother_arr
  - return :invalid if any elemenets are a 0
  - return :equilateral if unique is length 1
  - return :isosceles if unique is two elements 

=end 

def invalid?(arr)
  arr.each_with_index do |item, idx|
    return item + arr[idx] < arr[-1] ? true : false

  end
end
# p invalid?([3,1,1])

def triangle(side1, side2, side3)
  mother_arr = [side1, side2, side3]
  unique_mother_arr = mother_arr.uniq

  return :invalid if mother_arr.any?(0) 
  return :invalid if (mother_arr.sort[0..1].sum < mother_arr.sort[-1])


  if unique_mother_arr.size == 1 
    return :equilateral
  elsif unique_mother_arr.size == 2
    return :isosceles
  elsif unique_mother_arr.size == 3 
    return :scalene
  end
end

# test cases 
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid