=begin 
* 29m00s
Mubashir and his friend Matt found some gold piles. They decided to follow simple rules to distribute the gold among them.

    Gold will be divided into n piles.
    Each person will choose bigger gold pile either from far left or far right.
    If the weight of both piles is equal then the person will choose left pile.

Help them by creating a function that takes an array of gold piles gold and returns a two-element array with [Mubashir's Gold, Matt's Gold].
Examples

goldDistribution([4, 2, 9, 5, 2, 7]) ➞ [14, 15]
// Mubashir will choose 7, Remaining piles = [4, 2, 9, 5, 2]
// Matt will choose 4, Remaining piles = [2, 9, 5, 2] --> choose left if the same 
// Mubashir will choose 2, Remaining piles = [9, 5, 2]
// Matt will choose 9, Remaining piles = [5, 2]
// Mubashir will choose 5, Remaining piles = [2]
// Matt will choose 2
// Mubashir = 7+2+5 = 14, Matt = 4+9+2 = 15

goldDistribution([10, 1000, 2, 1]) ➞ [12, 1001]

goldDistribution([10, 9, 1, 2, 8, 4]) ➞ [16, 18]

Notes

Mubashir gets to pick his gold first!

=begin 

I: array 
O: array 

Rules:
- array numbers are piles of gold 
- Mubba goes first
- they choose only from the outtermost piles in the array 
- preference to the bigger pile 
  - when piles are the same, choose form left 
- track how much gold each person has gotten 

Examples:
          [4, 2, 9, 5, 2, 7]

Mubba: 7 + 2 + 5 14
Matt: 4 + 9 + 2 = 15

DS:
array 
array 

Algorithm:
- init `mubbas_turn` to true 
- init a variable `mubba` and `matt` to track their gold 

- while we have gold --> 
- if the last item in the array is larger than first, 
  - pop from array into someone's earnings--> if mubbas_turn is true, then add to his, otherwise add to matts
  - switch turns 
- otherwise, when first is larger, 
  - shift into someone's earnings --> if mubbas_turn is true, then add to his, otherwise add to matts
  - switch turns 

return [mubba, matt]
=end 

def gold_distribution(gold)
  mubbas_turn = true 

  mubba = 0
  matt = 0 

  # for the changing elgnth of gold, this must happen
  while gold.size >= 1
    case 
    when gold.first > gold.last 
      # take first 
      if mubbas_turn
        mubba += gold.shift
      else
        matt += gold.shift
      end 
      mubbas_turn = !mubbas_turn
    when gold.last > gold.first
      # take last 
      if mubbas_turn 
        mubba += gold.pop
      else
        matt += gold.pop
      end 
      mubbas_turn = !mubbas_turn
    when gold.last == gold.first
      if mubbas_turn 
        mubba += gold.shift
      else
        matt += gold.shift
      end 
      mubbas_turn = !mubbas_turn
    end 
  end 
  [mubba, matt]
end

p gold_distribution([4, 2, 9, 5, 2, 7]) == [14, 15]
p gold_distribution([4, 7, 2, 9, 5, 2]) == [11, 18]
p gold_distribution([10, 1000, 2, 1]) == [12, 1001]
p gold_distribution([10, 9, 1, 2, 8, 4]) == [16, 18]
p gold_distribution([9, 32, 12, 43, 1, 55]) == [130, 22]
p gold_distribution([19, 22, 1, 5, 7, 31]) == [58, 27]
p gold_distribution([2, 2, 2, 2, 2, 2]) == [6, 6]
# # Mubashir

