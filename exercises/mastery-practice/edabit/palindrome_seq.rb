=begin 
A palindrome is a number that is the same when reversed, 2770772 for example. A palindrome can often be formed by adding a number to it's reverse: 641 + 146 = 787 (a palindrome). Using 78 as the seed, it takes 4 steps to produce a palindrome:

78 + 87 = 165
165 + 561 = 726
726 + 627 = 1353
1353 + 3531 = 4884 (a palindrome)

About 97% of integers less than 10,000 produce palindromes in less than 25 steps. A few, like 196 and 879, may never form palindromes.

Make a function that takes a palindrome as it's an argument and returns the smallest seed integer that will produce that palindrome, along with the number of steps required:

pal_seq(palindrome) = [seed, steps]
pal_seq(4884) ➞ [69, 4]
pal_seq(1) ➞ [1, 0]
pal_seq(11) ➞ [10, 1]
# 10 + 01 = 11
pal_seq(3113) ➞ [199, 3]
pal_seq(8836886388) ➞ [177, 15]

Notes

The sequence always terminates when the first palindrome is produced. If the seed is a palindrome, the sequence has 0 steps.

I: integer 
O: array --> [seed, steps]

Examples:
p pal_seq(229922) == [1079, 6]
p pal_seq(7777) == [709, 2]

DS:
- integers
- arrays 

Algorithm:
Helper Method:
- check for palindrome 


- init steps # the runner 

- starting from seed 

  - enter a loop 
  - check for palindrome --> if this breaks, return [palindrome, steps]
  - seed + seed reverse becomes the new seed 
  - increment steps 
  - check for palindrome, if its true then return seed, steps 
  - seed gets reassigned to the sum above 
=end 
def palindrome?(num)
  num.digits == num.digits.reverse 
end 



def pal_seq(seed)
  steps = 0

  return [seed, steps] if palindrome?(seed) 

  loop do 
    return [seed, steps] if palindrome?(seed) 
    seed = seed + seed.digits.join.to_i
    steps += 1
  end 
end

def pal_seq(n)
  1.upto(n) do |seed|
    p seed
    current = seed
    steps = 0
    while current < n && current != current.to_s.reverse.to_i
      current += current.to_s.reverse.to_i
      steps += 1
    end
    return [seed, steps] if current == n
  end
end

# p pal_seq(1) == [1, 0]
# p pal_seq(11) == [10, 1]
# p pal_seq(229922) == [1079, 6]
# p pal_seq(7777) #== [709, 2]
# p pal_seq(233332) == [188, 7]
# p pal_seq(52788725) == [1894, 13]
p pal_seq(8813200023188) #== [89, 24]
# p pal_seq(88555588) == [167, 11]
# p pal_seq(252) == [252, 0]
# p pal_seq(987789) == [100788, 1]
# p pal_seq(123321) == [10119, 2]
# p pal_seq(10001) == [10000, 1]

# p pal_seq(1079) == [229922, 6]
# p pal_seq(709) == [7777, 2]
# p pal_seq(252) == [252, 0]
# p pal_seq(10) == [11, 1]
# p pal_seq(1894) == [52788725, 13]
# p pal_seq(10119) == [123321, 2]