=begin 
* DONE 07m04s
You've just recently been hired to calculate scores for a Dart Board game!

Scoring specifications:

0 points - radius above 10
5 points - radius between 5 and 10 inclusive
10 points - radius less than 5
If all radii are less than 5, award 100 BONUS POINTS!

Write a function that accepts an array of radii (can be integers and/or floats), and returns a total score using the above specification.

An empty array should return 0.

I: array 
O: integer 

Rules:
  - if all radii are less than 5, award 100 
  - if radius is over 10, award 0
  - if a radius is between 5 and 10, award 5

  - valid input is numeric (both intger and float)

Examples:
[1, 2, 3, 4]
score = 100 + 10 +10+10+10 = 140

[1, 5, 11]
score = 10 + 5 + 0 = 15

DS:
arrays 

Algorithm:
init score 
if all are under 5, add 100 to score 

- iterate over array 
    -if num is greater than 10, next 
    - if number is between 5 and 10 inclusive, add 5 to score 
    - if number is less than 5, add 10 to score
-return score 
=end 


def scoreThrows(arr)
  score = 0
  score += 100 if arr.all? {|num| num < 5}
  
  arr.each do |sc|
    case 
    when sc > 10
      next 
    when sc >= 5 && sc < 11 
      score +=5 
    when sc < 5
      score += 10
    end
  end
  score
end

# test cases 

p scoreThrows( [1, 5, 11] )    ==  15
p scoreThrows( [15, 20, 30] )  ==  0
p scoreThrows( [1, 2, 3, 4] )  ==  140