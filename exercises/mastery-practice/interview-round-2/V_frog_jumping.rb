=begin
Help the frog to find a way to freedom
You have an array of integers and have a frog at the first position

[Frog, int, int, int, ..., int]

The integer itself may tell you the length and the direction of the jump

For instance:
 2 = jump two indices to the right
-3 = jump three indices to the left
 0 = stay at the same position
Your objective is to find how many jumps are needed to jump out of the array.

Return -1 if Frog can't jump out of the array

Example:
array = [1, 2, 1, 5]; 
jumps = 3  (1 -> 2 -> 5 -> <jump out>)

I: array 
O: integer 

Rules:
  - positive numbers mean move forwaard(higher) along the index 
  - negative means move backward(lower) along in the index 
  - 0 means stay put ---> return -1 
- must use up all the steps 



Examples:
solution([1, 2, 2, -1]) --> tally = 2 + 2 --> 4 out of the array 
          f  _  _

solution([1, 2, 1, 5]) --> tally = 1 + 2 --> 3 
          f  

solution([1, -1]) --> tally = 1 - 1 --> idx 0 --> can't leave - 1
          f 

DS:
- I: array 
- Interm: array
- O: integer 

Algorithm:
- return -1 if Array includes any zeros 

- index --> position along the array 
- jumps --> the times the frog moves backward/forward (regardless of displacement)

- init an index to 0  # 1 3 2 4
- init jumps to 0 

- enter a loop 
  - identify the number in the array at the current index # arr[0] --> 1 add/minus this many to index 
  - increment jumps by 1 

  - break if index is greater than arr.size - 1
  - return jumps 
=end

def solution(arr)
  return -1 if arr.any? {|item| item.zero?}
  return -1 if arr.first == - arr.last && arr.size == 2

  index = 0
  jumps = 0

  loop do 
    simon_says = arr[index]
    # puts "Frog is at the number: #{simon_says}"
    # return -1 if I even land on 0
    if simon_says > 0 
      index += simon_says
    elsif simon_says < 0 
      # p index 
      # p simon_says
      index -= (-simon_says)
      # p index 
    end
    jumps += 1
    break if index > arr.size - 1
  end
  jumps
end

p solution([1, 2, 2, -1]) == 4
p solution([1, 2, 1, 5]) == 3
p solution([1, -1]) == -1

# break condition 
# a runner 
# something to hold a current value