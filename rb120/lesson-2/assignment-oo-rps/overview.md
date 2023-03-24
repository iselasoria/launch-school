# OOP- Rock, Paper, Scissors
---

## Game Description:
1. Write textual description

2. Extract major nouns and verbs from description

3. Organize and associate verbs and nouns

4. The nouns become classes and the verbs become behaviors 


### Step 1
Rock paper scissors is a two-player game where each player choose between the possible options: rock, paper, or scissors. Then the choices are compared to see who wins:
  - rock beats scissors
  - scissors beats paper 
  - paper beats rock 

If the two players choose the same, there is a tie.
### Step 2 
`nouns`
- player
- move 
- rule 

`verbs`
- choose 
- compare 

### Step 3
Player
- does the choosing 
Move 
Rule 

- where is compare supposed to go?

### Step 4

```ruby
class Player

  def initialize
  # initialize names or moves?
  end

  def choose
  end

end

class Move 
  def initialize 
    # we need to track the choices that get made
  end
end

class Rule
  def initialize
    # not sure what the 'state of a rule object should be
  end 
end
# no sure where to put compare yet
def compare(move1, move2)

end

```

### Engine
We need something to kick things off-- so maybe we can instantiate an object and call ` .play` on it:
```ruby
RPSGame.new.play
```

This is where the procedural program flow will be. 

The class definition might look something like this:

```ruby
class RPSGame
  def initialize

  end

  def play

  end
end
```

And now we can start to think about the objects that are required in the `.play` method:
```ruby
def play
  display_welcome_message
  human_choose_move
  computer_choose_move
  display_winner
  display_goodbye_message
end
```

You will notice that both the computer and the user have to choose a move. This is redundant and not DRY code. We cant extract the choose method and make it part of a parent class that both a user and the computer belong to-- `Player`.
```ruby
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new
  end

  def play
    display_welcome_message
    human.choose
    computer.choose
    display_winner
    display_goodbye_message
  end
end
```