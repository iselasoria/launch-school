## Bonus Features
---
1. Keeping Score

   Make this game more interesting by keeping track of a score-- the player
   that reaches the score of 10 wins the game.

   Considerations:
   - `SCORE`
      - `score as state of an existing class`
        - pros
          - easier to set up initially
          - if this is all the score is meant to do, it might be simpler to not extract out into a class of its own
        - cons
          - we can't easily implement methods that build on this particular piece of data
            ex: printing method might produce a long chain and might be potentially bad for debugging
                might be problematic when deciding
          - comparison might be difficult to do in a clean way ex) display_winner method
      - `score as class`
        - we can write methods that will give us access to how we view the data and how we interact with it from outside the class
        - objects in this custom class become collaborator objects to the `Player` class
---
2. Add Lizard and Spock

|     Move      |     Wins Over     |
| ------------- |:-----------------:|
| Rock          | scissors, lizard  |
| Paper         | rock, spock       |
| Scissors      | lizard, paper     |
| Lizard        | paper, spock      |
| Spock         | rock, scissors    |
---

3. Add a class for each move
Adding the following classes:
  - `rock`
  - `paper`
  - `scissors`
  - `lizard`
  - `spock`

  *Pros of splitting moves into classes*

  - the winning moves might be handled here as behaviors

    - `Spock` class responds (behaves) with a win, when the opposing move is `Rock` or `Scissors` class

  *Cons of splitting moves into classes*

  - having so many classes might be confusing to read
  - might seem repetitive

---
4. Keep track of a history of moves
5. Computer Personalities
