=begin 

There are two players, Alice and Bob, each with a 3-by-3 grid. A referee tells Alice to fill out one particular row in the grid (say the second row) by putting either a 1 or a 0 in each box, such that the sum of the numbers in that row is odd. The referee tells Bob to fill out one column in the grid (say the first column) by putting either a 1 or a 0 in each box, such that the sum of the numbers in that column is even.

Alice and Bob win the game if Alice’s numbers give an odd sum, Bob’s give an even sum, and (most important) they’ve each written down the same number in the one square where their row and column intersect.


# Two arrays, Alice [row, "her choice"], Bob [column, "his choice"]
Notes
Look at the article in the resources tab to see the first two examples in action.
The row of Alice is always odd, the column of Bob is always even.

I: array 
O: boolean 

Rules:
- alice fills out one row in the grid, with  either 1 or 0--> sum should be odd
- bob fills out one col with 1 or 0 --> sum should be even 


Examples:
[2, "100"], [1, "101"]) == false
    1 0 0 ---> Alice's sum is even --> false 
    1 0 1 ---> Bob's sum is odd

[2, "001"], [1, "101"]) == true
    0 0 1 --> odd sum  --> \__ intersect with the same number and odd and evens apply so true
    1 0 1 --> even sum --> /

[3, "111"], [2, "011"]) == true
    0 1 1 --> even --> false 
    1 1 1


[1, "010"], [3, "101"]) == false
    0 1 0 --> odd --> ---> no intersection false 
    1 0 1 --> even -->

DS: 
I: two array 
Interm: array 
O: boolean 

Algorithmn:
- iterate over the `chart` with a transformation 
- init chosen_nums to empty arr 
  - access the second element in each person's char. # ["100", "101"]

- match up index to index of the two items in the chart # [["1,"1"],[0,0],[0,1]] store in `matched_grid`
- itearte ver matched grid and check if any pair is the same --> intersection 
- check that the first person's numbers amount to an odd sum and the second person's amount to an even sum 
  - store in different arays to take sum 

- for this to return true, the intersection must happen and the sums checks must comply with the rules 

_ _ _   1 _ _ //  _ _ _   _ _ 1  //
1 0 0   0 _ _ //  1 0 0   _ _ 0  //
_ _ _   1 _ _ //  _ _ _   _ _ 1  // 

1 
0
1


[2, "100"] [1, "101"]
[*, *, *]  [1, *, * ]
[1, 0, 0]  [0, *, * ] --> is her row dictating his column? her row tells you which row of his, and his col tells you which col of hers
[*, *, *]  [1, *, * ]
=end 

# something that takes index 0 from each array, and finds which Index
# in the string to compare for a match

def intersection?(arr_1, arr_2)

end

# https://edabit.com/challenge/EYnxbDFuSkP7qbqd3

def magic_square_game(alice, bob)
  chosen_nums = []
  [alice, bob].each do |person|
   chosen_nums << person[1].chars # chosen nums 
  end
  matched_grid = chosen_nums[0].zip(chosen_nums[1])
  intersection = matched_grid.any?{ |pair| pair.uniq.size == 1}
  alice_sum, bob_sum = chosen_nums.map do |item|
    item.map(&:to_i).sum
  end 
 
  alice_sum.odd? && bob_sum.even? && intersection
end

p magic_square_game([2, "100"], [1, "101"]) == false
p magic_square_game([2, "001"], [1, "101"]) == true
p magic_square_game([3, "111"], [2, "011"]) == true
p magic_square_game([1, "010"], [3, "101"]) == false
## think of mines 
