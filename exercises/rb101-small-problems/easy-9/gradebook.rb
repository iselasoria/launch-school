=begin
-----------------------INSTRUCTIONS--------------------------------------
Write a method that determines the mean (average) of the three scores
passed to it, and returns the letter value associated with that grade. 
Test values are between 0 and 100. There os no need to check for negative
values or values greater than 100.

Numerical Score Letter	Grade
90 <= score <= 100	     'A'
80 <= score < 90	       'B'
70 <= score < 80	       'C'
60 <= score < 70	       'D'
0 <= score < 60	         'F'
--------------------------PROBLEM----------------------------------------
Questions:
Input: three separate integers
Output: string
---------------------------RULES-----------------------------------------
Explicit: 
- all numbers input are between 0 and 100
Implicit: 
--------------------------EXAMPLES---------------------------------------
(95 + 90 + 93) / 3 --> average

----------------------------ALGO----------------------------------------
- read numbers and put them into an array
- sum all the numbers in the array
  - divide by the array length
- check if avg is >= 90, then A
  - if avg >= 80, then B, etc

=end

def avg(first, second, third)
  all_grades = [first, second, third]
  all_grades.map! do |score| 
    score.to_f
  end

  average = all_grades.inject {|sum, num| sum + num}/ all_grades.size
  average.round(1)
end

def get_grade(first, second, third)
  case avg(first, second, third)
  when 0..60
    'F'
  when 61..70
    'D'
  when 71..80
    'C'
  when 81..90
    'B'
  when 90..100
    'A'
  end

end

p get_grade(95, 90, 93)

# test cases
p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"

# * DONE