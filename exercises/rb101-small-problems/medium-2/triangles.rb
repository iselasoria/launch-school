=begin
A triangle is classified as follows:

right---> One angle of the triangle is a right angle (90 degrees)
acute ---> All 3 angles of the triangle are less than 90 degrees
obtuse ---> One angle is greater than 90 degrees.
To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
and all angles must be greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and 
returns a symbol :right, :acute, :obtuse, or :invalid depending on whether 
the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors. 
You may also assume that the arguments are specified in degrees.



------------------P
Rules: 
- invalid:
  - all angles add up to 180•
  - you can't have any zero angles
- valid classified:
  - acute: All three angles are < 90•
  - right: one angle is 90•
  - obstuse: one angle > 90•

------------------E
triangle(120, 50, 10) Here we have one angle that is grater than 90• so this returns :obtuse
triangle(30, 90, 60) One angle is 90• so it returns :right
triangle(0, 90, 90) Zeros are not valid :invalid

------------------D

------------------A
- initialize an array of the three angles
- get a sum of the elements in the array
- handle invalids with zeros or that don't add up to 180•
  - if there is one 90•
    :right
  - if there is > 90•
    : obstuse
  - if any are < 90• 
    :acute

- return :invalid

=end


def triangle(angle1, angle2, angle3)
  sum = [angle1, angle2, angle3].inject {|sum, num| sum + num}
  any_zeros = [angle1, angle2, angle3].any?(0)

  if any_zeros == true || sum < 180
    :invalid
  else
    if [angle1, angle2, angle3].all? {|ang| ang < 90}
    :acute
    elsif [angle1, angle2, angle3].any? {|ang| ang > 90}
      :obtuse
    elsif  [angle1, angle2, angle3].any?(90)
      :right
    end
  end

end


# test cases
p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid

# DONE