=begin 
* DONE 25m
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene--> All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

I: three integers 
O: symbol 

Rules:
- equilateral--> all sides are the same 
- isosceles--> 2 sides of equal length, the third is different 
-scaleen --> all sides are different 

***valid triangles:
  - all sides greater than 0 
  - when added, two shortest sides are greater than the legth of the longest 

Goal: determine what type of triangle is formed by the three sides given 


Examples:
triangle(3, 3, 3) ---> all the same, equilateral 
triangle(3, 3, 1.5) -->2 sides the same, isosceles
triangle(3, 4, 5)  --> all sides different scalene
triangle(0, 3, 3) ---> any zero rules a trigle out 
triangle(3, 1, 1) --> 2 sides the same, but they don't add up to more than 3rd side, invalid ***

DS: 
integers 
arrays 

Algorithm:
- intake the three inputs and craete an array 

-check:
  - if the length of the uniuque elements in the array is the same, equilateral
  - if there are any zeros, invalid
  - if unique size is array size, scalene 
  - check if unique size is 2---> isosceles
  - invalid
    - iterate over Array sorted 
      - if current number is the same as next, add them up 
        - check if sum is greater than the one not in the sum 
=end


def triangle(*sides)
  sides

  sum = sides.sort[0,2].sum
  return :invalid if sum <= sides.sort[-1]

  return :invalid if sides.any?(0)
  return :equilateral if sides.uniq.size == 1 
  return :scalene if sides.size == sides.uniq.size
  return :isosceles if sides.uniq.size == 2

  # invalid check sums 

  
end
# test cases 


p triangle(3, 1, 1) == :invalid
p triangle(0, 3, 3) == :invalid
p triangle(3, 3, 3) == :equilateral
p triangle(3, 4, 5) == :scalene
p triangle(3, 3, 1.5) == :isosceles