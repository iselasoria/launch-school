=begin 
https://edabit.com/challenge/jfpfpH6w42tZeRo2T


This robot roams around a 2D grid. It starts at (0, 0) facing North. After each time it moves, the robot rotates 90 degrees clockwise. Given the amount the robot has moved each time, you have to calculate the robot's final position.

To illustrate, if the robot is given the movements 20, 30, 10, 40 then it will move:

20 steps North, now at (0, 20)
30 steps East, now at (30, 20)
10 steps South. now at (30, 10)
40 steps West, now at (-10, 10)
...and will end up at coordinates (-10, 10).

Examples
track_robot(20, 30, 10, 40) ➞ [-10, 10]

track_robot() ➞ [0, 0]
# No movement means the robot stays at (0, 0).

track_robot(-10, 20, 10) ➞ [20, -20]
# The amount to move can be negative.
Notes
Each movement is an integer (whole number).

I: a varying list of integers 
O: array containing final (x,y) position of the robot 

Goal: determine where the robot ends up 

Rules:
- robot starts at (0,0) every time 
- after every move, it rotates 90˚clockwise and goes to the next move 
- input is variable, and can be empty
  - if input is empty the robot hasnt moved and returns [0,0]
- return final position of the robot 
-implicit rule:
  - first move is determined by the sign of the first number in the moves sequence 

Examples:
starting [0,0]
moves =  [20, 30, 10, 40]
[0, 0]
[0, 20]
[30, 20]
[30, 10]
[-10, 10]

      30
    +-----+
 20 |     | 10
 <--|-----+
    |
  (0,0)

moves = [-10, 20, 10]
[0,0]
[0, -10]
[20, -10]
[20, -20]


Data Structures:
I: array of variable size 
Interim: arrays / nested?
O: array containing final x,y coordinate 

Notes: 
track direction at each move 

Algorithm:
- init starting_pos [0,0]
- init vertical set to true 
- iterate over the moves_arr
  - if vertical is true
    - add current move to y --> sign matters! 
  - otherwise 
    - add current move to x 
  - toggle vertical 

=end 

def track_robot(*moves_arr)
  starting = [0,0]
  vertical = true 

  moves_arr.each do |move|
    if vertical
      starting[1] += move
    elsif vertical && #facing south 
      # subrtact from y
    elsif !vertical
      starting[0] += move

    elsif !vertical && #facing east
      # subtract from x 
    end 
    vertical = !vertical
  end
  starting
end
# test cases 
p track_robot(20, 30, 10, 40) #== [-10, 10]

# p track_robot() #== [0, 0]
# # # No movement means the robot stays at (0, 0).

# p track_robot(-10, 20, 10) #== [20, -20]

#  if current move is horizontal and last was vertical, next is south 
#  an even index is a vertical move 
  # if index if even and greater than 0, it's south 
  # every other even index is south-facing 
  # [0,1,2,3,4,5,6]
# if the first item in moves_arr is positive,robot starts north odds start at positive
# if the first item in moves_arr is negative, robot starts south odds start at negatives