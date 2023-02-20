=begin 

Examples:
starting [0,0]
moves =  [20, 30, 10, 40]
[0, 0]
[0, 20]
[30, 20]
[30, 10]
[-10, 10]


[20, 30, 10, 40]
 y1  x1  y2   x2

 (30-40) , (20 - 10)
  -10         10 


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

[-10, 20, 10]
 y1   x1   y2 
 
 (20), (-10-10)
  20      20 

Scratchspace:
- the first number determines if we start south or notht 
  - if we went south, next move is east
    - if we are east, next move is south, if we are south, next move is east ---> only east and south!
  - if we went north, next move is east 
    - if we are east, next move it south
      - if we are south, next move is 

Algorithm:
- initi start_pos to [0,0]

# moves =  [20, 30, 10, 40]

- iterate over moves_arr
  - if item is positive
    - add arr[0] to the y of starting position --> [0, 20]-->
  - if item is positive and last one is previous was north, we go east
    - add item to x --> [30, 20]
  - item item is positive and previous east, we go south 
    - subtract from the y --> [30, 10]
  - item is positive and previous was south, we go east 
  - subtract from x --> [-10, 10]

* If previous was vertical, we can only go east --> add to x 
* If previous was north, we can only go 

=end



def track_robot(*moves)
  return [0,0] if moves.empty?

  y_move, x_move = moves.partition.each_with_index {|item, idx| idx.even?}

  p x_move
  p y_move

  if y_move.size == 1 
    [(x_move[0] - x_move[1]), y_move[0]]
  elsif x_move.size == 1
    [x_move[0], y_move[0] - y_move[1]]
  else
    [(x_move[0] - x_move[1]), y_move[0] - y_move[1]]
  end

end 

# p track_robot(20, 30, 10, 40) == [-10, 10]
# p track_robot() == [0, 0]
# # # # No movement means the robot stays at (0, 0).
# p track_robot(-10, 20, 10) == [20, -20]

p track_robot(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) #== [6,5]


def solve(str)
  subs = []
  moving_idx = 0
  sizer = 0 #instead of 1, so you can start with the first character

    loop do 
      loop do 
        slice = str[moving_idx..sizer]
        if sizer == str.size #can get rid of: - moving_idx 
          sizer = 1 
          break 
        end
        sizer += 1
        subs << slice # add slices to your array
      end
# break
      break if moving_idx >= str.size
      moving_idx += 1
    end 
    p subs # remove empty strings and even numbers
end
p solve("1341")