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

After trying this out I chose to revert back to the version before implementing the various classes. The way I saw it, having five classes, one for each move, was making the game cluttered and not all that better.
Upon user intake, the new objects of their corresponding class was getting instantiated and then evaluated for `win`. However, since the `win?` method evaluates all the types of objects in one single line method, it didn't make much sense to then override it in each of the move classes to check for a win. In fact, it would have required some hard coding like:
- "Paper covers Rock and disproves Spock"
- "Rock crushes lizard and scissors"

So all of a sudden, a method that can check for wins in one line would have turned into five little hard-coded methods that check for that move type's win.
I started coding it and halfway through as I saw the code getting longer and with no benefit, I reverted to a previous commit.
As the remaining features get implemented this might make sense, in which case I'll come back and amend. As of now, I won't implement this feature.

---
4. Keep track of a history of moves

---
5. Computer Personalities
Give each robot a personality, a tendency toward or against choosing certain moves.
How would you approach a feature like this?

- Might be able to be implemented with collaborator objects.
  upon instantiation, conditional determines which personality each robot is getting.
  At selection time, each move (from `Move` class) behaves a certain way (tendencies).
  Polymorphism?!
- Makes use of the `Score` and `Move`s history in order to determine what to choose next.

|     Robot          |                       Qualities                           |
| ------------------ |:---------------------------------------------------------:|
| Terminator         | chooses rock most of the time, second favorite is spock   |
| Chappie            | never chooses lizard                                      |
| Rosie Jetson       | tends to choose paper, and never chooses spock            |
| Andy Roid          | chooses only rock, paper, or scissors                     |
| Rusty              | tends to choose scissors, and never chooses lizard        |
| Mr. Roboto         | chooses only moves he has not chosen in the current round |