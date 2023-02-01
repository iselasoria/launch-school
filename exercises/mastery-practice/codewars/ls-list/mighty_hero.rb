=begin 
Alyosha Popovich (Russian folk hero) stroke his sharp sword and cut the head of Zmey Gorynych (big Serpent with several heads)! He looked - and lo! - in its place immediately new heads appeared, exactly n. He stroke again, and where the second head was, 2*n heads appeared! The third time it was 2*3*n new heads, and after fourth swing it was 2*3*4*n heads, and so forth. And thus Alyosha decided to call it a day, and instead called a fellow Mage for help. While the Mage agreed, he needs to know the exact number of heads that Zmey Gorynych now has.


formula: initial_heads - 1 + multiplier ---> new starting heads 
         new starting heads + 2 * n 

The task
Given the initial number of heads, the heads-count multiplier, and the number of sword-swings, calculate how many heads Zmey Gorynych has in the end.

Examples:
initial = 2
multiplier = 1
swings = 1

result:
  1 head appearead after the swing: 2 - 1 + 1 = 2
  Zmey has 2 heads in the end

initial = 5
multiplier = 10
swings = 3


result:
  10 heads appearead after the first swing: 5 - 1 + (1 * 10) = 14
  20 heads appearead after the second swing: 14 - 1 + (1 * 2 * 10) = 33
  60 heads appearead after the third swing: 33 - 1 + (1 * 2 * 3 * 10) = 92
  Zmey has 92 heads in the end


I: initial_heads, multiplier, swings
O: integer 

Rules:
- for every swing, there is n heads --> multiplier


Examples: 
initial = 2 heads 
multiplier = 1 
swings = 1
2 heads to start - 1 which was cut off + the head multiplier = heads in the end ---> 2 - 1 + 1 = 2

initial = 5
multiplier = 10
swings = 3

starting heads - swing + multiplier = new starting heads 
new starting heads - 1 with this swing + (number of the swing) * multiplier = new starting heads 
new starting heads - 1 with this swing + all the swings so far * multiplier = new srarting heads 

Data Structures:
I: intgers 
Interim: Array 
O: integer 

Algorithm:
- get an array that goes from 1 to swings ---> independent variable 
- iterate over swings 
  - subtract 1 from initial_heads
  - add a tiny array of 1..swings 
  - multiply * 10
  - previous steps become the new initial_heads --> reasign 
- return the last initia heads 
=end

def count_of_heads(initial_heads, multiplier, swings)
  swings_arr = (1..swings).to_a
  # p swings_arr


  (1..swings).each do |current_swing|
    # puts "#{swings_arr[0...current_swing]} is the tiny array"
    # puts "#{swings_arr[0...current_swing].inject(&:*)} is the multiplied array"
    temp_heads = initial_heads - 1 + swings_arr[0...current_swing].inject(&:*) * multiplier
    initial_heads = temp_heads
    # puts "#{temp_heads} is temp heads" 
    # break
  end
  initial_heads
end


p count_of_heads(2, 1, 1) == 2
p count_of_heads(5, 10, 3) == 92
p count_of_heads(5, 10, 2) == 33
p count_of_heads(51, 6, 31) == 50983496835888389711611599965641898
p count_of_heads(30, 12, 31) == 101966993671776779423223199931283755
p count_of_heads(10, 8, 3) == 79
p count_of_heads(1, 1, 3) == 7
p count_of_heads(100, 143, 8) == 6611411