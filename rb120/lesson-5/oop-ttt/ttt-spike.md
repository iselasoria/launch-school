## Tic-Tac-Toe
---

Tic Tac Toe is a 2-player board game played on a 3x3 grid.
Player take turns marking a square. The first player to mark
3 squares in a row wins.

---

Nouns: board, player, square, grid
Verbs: play, mark

Board
Square
Player:
  - mark
  - play

```ruby
class Board
  def initialize
    # needs to model the 3x3 grid
    # what data structure makes sense? (squares)
      # array/hash of Squares objects?
      # array/hash of strings or integers?
  end
end

class Square
  def initialize
    # maybe a "status" to keep track of this square's mark?
  end
end

class Player
  def initialize
  # maybe a "marker" to keep track of this player's symbol (X or O)
  end

  def mark
  end

  def play
  end
end
```

The above classes are potential-- we might not need them but this is part of the exploratory phase of the OOP design. Below is a class that we _do_ need:

```ruby
class TTTGame
  def play

  end
end

# we'll kick off the game like this
game = TTTGame.new
game.play
```

Since we have a `play` method in the orchestration engine class, we'll need to remove it from player. Below are the methods we wish to have:

```ruby
class TTTGame
  def play
    display_welcome_message
    loop do
      display_board
      first_player_moves
      break if someone_won? || board_full?

      second_player_moves
      break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end
```