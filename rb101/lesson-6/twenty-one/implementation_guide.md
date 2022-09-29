## Implementation Steps
1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or stay
4. If player busts, dealer wins
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer busts, player wins.
7. Compare cards, declare a winner.


Tips:
1. The data structure we're going to use
2. Calculating Aces:
   Remember the `ace` value can depend on the context of the hand.
   Make the program calculate the value of the ace automatically
3. Player turn:
   Think about the loop that keeps asking the player to hit or stay. Now think of the breaking condition of that loop, when do we stop asking the question of the user?

   > 1. ask `hit` or `stay`
   > 2. if user inputs `stay`, stop asking
   > 3. otherwise, got to the top of the loop
   
   Now in code:

   ```
   loop do
    puts "hit or stay?"
    answer = gets.chomp
    break if answer == 'stay' || busted?
   end
   ```

   The break condition is at the bottom because the question needs to be asked at least once. `do/while` style.
   
   And after the loop we can check the condition that broke it and handle the game accordingly:

   ```
   answer = nil
    loop do
      puts "hit or stay?"
      answer = gets.chomp
      break if answer == 'stay' || busted?   # the busted? method is not shown
    end

    if busted?
      # probably end the game? or ask the user to play again?
    else
      puts "You chose to stay!"  # if player didn't bust, must have stayed to get here
    end

    # ... continue on to Dealer turn
   ```

   4. Dealer turn:
      The dealer's turn is similar except the break condition will happen at the top. Do you know why?

   5. When you display the results, you also need to perform the calculation of who won. Make sure you have two separate methods one for determining the winner and one for displaying it.