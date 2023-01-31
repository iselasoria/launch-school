=begin 
* DONE 20m17s
https://www.codewars.com/kata/57f625992f4d53c24200070e/train/ruby
Time to win the lottery!

Given a lottery ticket (ticket), represented by an array of 2-value arrays, you must find out if you've won the jackpot.

Example ticket:

[ [ 'ABC', 65 ], [ 'HGR', 74 ], [ 'BYHT', 74 ] ]

To do this, you must first count the 'mini-wins' on your ticket. Each subarray has both a string and a number within it. If the character code of any of the characters in the string matches the number, you get a mini win. Note you can only have one mini win per sub array.

Once you have counted all of your mini wins, compare that number to the other input provided (win). If your total is more than or equal to (win), return 'Winner!'. Else return 'Loser!'.

All inputs will be in the correct format. Strings on tickets are not always the same length.


I: nested array, and an integer 
   array is a list of mini wins 
   integer is the jackpot
O: string 

Rules:
- each subarray has a string and a number 
- character code --> ascci position 
- if any character in the string has a ascci value that matches the second element, then it's a mini win ---> implies second level of iteration 
- keep track of the mini wins to compare to second argument 
- case matters!!!! 


Examples:
mini_win_tally = 1
[['ABC', 65], ['HGR', 74], ['BYHT', 74]]
['ABC', 65]
call .ord on each character 
65, 66, 67 one match at 65, so mini win 

['HGR', 74]
72, 73, 82 ---> none match, no mini win 


['BYHT', 74]]
66, 89, 72, 84 ---> no matches, no mini win 

compare mini_win_tally  to second arg --> mini_win_tally is smaller, return 'Loser!'


Data Structures:
I: nested array 
Interim: arrays 
O: string 

Algorithm:
- initialize `mini_win_tally` set to 0 
- iterate over `ticket` 
- for each pair `scratcher` --> pair
  - itearte over its characters
    - check ascci position 
    - if any match, increment mini_win_tally

compare mini_win_tally to `winning_number` 
  if win is larger return loser
  otherwise return winner

=end 


def bingo(ticket, winning_number)
  
  tally = ticket.map do |scratcher|
    scratcher[0].chars.any? do |letter|
      letter.ord == scratcher[1]
    end
  end

  mini_win_tally = tally.count(true)

  winning_number > mini_win_tally ? "Loser!" : "Winner!"
end




def bingo(ticket, target_mini_wins)
  mini_wins = ticket.map do |str, int|
    str.bytes.include?(int) ? 1 : 0 
  end.sum
  
  mini_wins >= target_mini_wins ? "Winner!" : "Loser!"
end
p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) == 'Loser!'
p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) == 'Winner!'
p bingo([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) == 'Loser!'