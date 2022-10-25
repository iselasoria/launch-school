=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater
than the length of the longest side, and all sides must have lengths greater than 0: 
if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid 
depending on whether the triangle is equilateral, isosceles, scalene, or invalid.


---------------------P
Rules:
- invalid
  - sum of the two shortest is less than the third
  - all three sides must be larger than 0

- valid:
  - equilaterial ---> all three sides are equal in length
  - isosceles ---> 2 sides are equal, one is different
  - scalene --> all sides are different in length
---------------------E
3, 3, 3 all ----> three sides are the same :equilateral
3, 3, 1.5 ----> two sides are equal, one different :isosceles
3, 4, 5 ----> all sides are different :scalene
0, 3, 3 == :invalid

---------------------D
Model solution:
arr = [3,4,5]
arr.min(2)---> gives the two shortest,this must be greater than arr.max
---------------------A
- initialize an array of the sides
  - check for invalids
    - if two shortes sides are less than third side, or if any_zeros
      - invalid
    - otherwise, check type
      - if all sides are the same
        - :equilateral
      - if 2 sides are equal
        - iscosceles
      - none of the sides are the same
        - scalene

=end

def triangle(side1, side2, side3)
  arr = [side1, side2, side3]

  two_shortest_sum = arr.min(2).reduce(:+)
  longest = arr.max
  any_zeros = arr.any? {|item| item == 0}
  all_equal = arr.uniq.size == 1
  two_sides_equal = arr.uniq.size == 2


  if (two_shortest_sum < longest) || any_zeros # if the two small sides are not larger than the third
    :invalid
  else
    if all_equal
      :equilateral
    elsif (arr[0] != arr[1]) && (arr[1] != arr[2]) && (arr[0] != arr[2]) # none are equal
      :scalene
    elsif two_sides_equal
      :isosceles
    end

  end
end

# test cases
p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid

# DONE