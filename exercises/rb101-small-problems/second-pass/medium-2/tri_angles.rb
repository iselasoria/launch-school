=begin 
A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. You may also assume that the arguments are specified in degrees.

Input: three integers 
Output: symbol 

Rules:
- valid triangles: 
  - right--> one angle is 90•
  - acute--> all three angles are less than 90•
  - obtuse --> one angle is greater than 90•
- invalid triangles:
  - sum does not amount to 180
  - any of three angles are zeros 

Goal: to determine the type of triangle based on the three angles given 

Examples / Model Solution:
30, 90, 60 --> one angle is 90 ---> right
0, 90, 90 --> angle is 0 --> invalid 
120, 50, 10 --> one angle is larger than 90 --> obtuse 
60, 70, 50 --> all three angles are less than 90 --> acute 

Data:
- Points to Capture:
  - iteration 

- Data Structures:
  - in: integer 
  - interim: array 
  - out: symbol

Algorithm: 
- make an array of the three angles 
- iterate over angles_arr, sorted largest to smallest 
  - if any element in the array is zero or if the sum of the angles is not 180, return :invalid 
  - if any element is greater than 90, return :obtuse 
  - if all elements are under 90, return :acute 
  - if there is a single 90 degree angle, return :right 

=end 

def triangle(ang1, ang2, ang3)
  angles_arr = [ang1, ang2, ang3]

  return :invalid if angles_arr.any? { |angle| angle == 0 } || angles_arr.sum != 180

  if angles_arr.all? { |angle| angle < 90 }
    return :acute
  elsif angles_arr.any? { |angle| angle > 90 }
    return :obtuse 
  elsif angles_arr.count(90) == 1
    return :right
  end

end



p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid