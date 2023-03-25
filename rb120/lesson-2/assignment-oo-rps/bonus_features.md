## Bonus Features
---
1. Keeping Score 

   Make this game more interesting by keeping track of a score-- the player
   that reaches the score of 10 wins the game. 

   Considerations:
   - `SCORE` 
      - `score as state of an existing class`
        - we can't easily implement methods that build on this particular piece of data 
          ex: printing method might produce a long chain and might be potentially bad for debugging 
              might be problematic when deciding 
        - comparison might be difficult to do in a clean way ex) display_winner method 
      - `score as class`
        - we can write methods that will give us access to how we view the data and how we interact with it from outside the class 
        - objects in this custom class become collaborator objects to the `Player` class 
---
2. Add Lizard and Spock 
3. Add a class for each move 
4. Keep track of a history of moves
5. Computer Personalities
