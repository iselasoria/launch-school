=begin 
https://www.codewars.com/kata/5544c7a5cb454edb3c000047


A child is playing with a ball on the nth floor of a tall building. The height of this floor above ground level, h, is known.

He drops the ball out of the window. The ball bounces (for example), to two-thirds of its height (a bounce of 0.66).

His mother looks out of a window 1.5 meters from the ground.

How many times will the mother see the ball pass in front of her window (including when it's falling and bouncing?

Three conditions must be met for a valid experiment:
Float parameter "h" in meters must be greater than 0
Float parameter "bounce" must be greater than 0 and less than 1
Float parameter "window" must be less than h.
If all three conditions above are fulfilled, return a positive integer, otherwise return -1.

Note:
The ball can only be seen if the height of the rebounding ball is strictly greater than the window parameter.

Examples:
- h = 3, bounce = 0.66, window = 1.5, result is 3

- h = 3, bounce = 1, window = 1.5, result is -1 

(Condition 2) not fulfilled).

I: three integers--> building height, bounce rate, window height 
O: integer --> the number of times the mother sees the ball from the window 


Rules:
- a valid experiment must have:
  - h (in meters) must be greater than 0 --> can't drop things from height of 0
  - bounce must be greater than 0 AND less than 1 --> a ball can't bouce to start position and must bounce 
  - window must be less than h --> if the mother is floors above she wont see the ball at all 
    - return of a valid experiment is the number of times the mother sees the ball 
- invalid experiments return -1 

Examples:
building_height = 3 meters 
bounce_rate = 0.66
window_height = 1.5 meters 

h = 3 ---> 1.98 --> 1.3 
b = 0.66 --> 0.66
w = 1.5 --> 1.5

tally = 1 1 1
first drop , bounce back up, second drop 

bouncingBall(30, 0.4, 10) 
building_height = 30
bounce_rate = 0.4
window_height = 10

h = 30 --> 12 ---> 4.88
b = 0.4 --> 0.4
w = 10 --> 10 

tally: 1 
first drop, on the way up, second drop 

Data Structures:
I: integers 
Interim: integers 
O: integer 

Algorithm:
return -1 if starting_pos is less than 0  OR if bounce rate is not between 0 and 1 || window must be greater than starting_pos

- initialize a sightings variable and set to 0 
- initialize a `height` variable to hold the value from starting_pos 

- while height is greater than window_height
  - increase sightings by 1 
  - multiply height * bounce_rate --> this will be the new height reasinged 
  - increase sightings by 1 

- return sightings 

=end 

def bouncingBall(starting_pos, bounce_rate, window_height)
  # 5 < x > 10
  return -1 if !((0...1).include?(bounce_rate))|| (starting_pos < 1 || starting_pos < window_height)
  

  sightings = 0 
  height = starting_pos

  while height > window_height
    # puts "On the way down: #{sightings += 1}"
    sightings += 1
    height = height * bounce_rate
    break if height < window_height
    # puts "#{sightings += 1} on the way up"
    sightings += 1
  end
  sightings
end


# test cases 

p bouncingBall(3, 0.66, 1.5) == 3

p bouncingBall(30, 0.66, 1.5) == 15
p bouncingBall(30, 0.75, 1.5) == 21
p bouncingBall(30, 0.4, 10) == 3

p bouncingBall(40, 1, 10) == -1
p bouncingBall(-5, 0.66, 1.5) == -1