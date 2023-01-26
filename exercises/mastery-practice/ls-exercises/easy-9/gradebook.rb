=begin 
* DONE 4m26
Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.


Numerical Score Letter	Grade
90 <= score <= 100	'A'
80 <= score < 90	'B'
70 <= score < 80	'C'
60 <= score < 70	'D'
0 <= score < 60	'F'


Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

Algorithm:
- determine the average
- if the average falls in the brackets above, assign corresponding letter grade 
=end

def get_grade(g1, g2, g3)
  grades = [g1, g2, g3]

  avg = grades.sum / grades.size

  case avg 
  when 90..100
    then "A"
  when 80...90
    then "B"
  when 70...80
    then "C"
  when 60...70
    then "D"
  when 0...60
    then "F"
  end
end 

# test cases
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D" 