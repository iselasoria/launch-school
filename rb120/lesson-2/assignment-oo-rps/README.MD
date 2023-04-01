# Design Decisions #
---

### Classes
[Move :repeat:](#### Move :repeat:)

Player :bust_in_silhouette:

Human :woman:

Computer :desktop_computer:

Score :abacus:

RPSGame :joystick:
### Modules
---

#### Move :repeat:
- noun 
- no interface exposure
- behaviors:
  - checks if input is:
    - rock 
    - paper
    - scissors
  - overrides `>`
    
    If any of the conditions in the body of the instance method return true, the calling object(move) is considered a winner over the second object
  - overrides `<`
    If any of the conditions in the body of the instance method return true, teh calling object (move) is considered a loser to the second object
  - overrides `to_s` to output the value that was passed in (move)

#### Player :bust_in_silhouette:
- noun 
- exposes the move and player name to the public interface
- behaviors:
  - instantiates an object with a call to `set_name` which is handled differently by Human and Computer
  
#### Human :woman:
- noun
- inherits from Player 
- behaviors:
  - asks user for name until they give one
  - asks user for a move until they give one that matches the valid moved predetermined in the `Move` class 


#### Computer :desktop_computer:
- noun 
- inherits from Player 
- behaviors:
  - chooses a computer name at random 
  - chooses a computer move at random 

#### Score :abacus:
- noun
- no exposure to the public interface 
- behaviors:
  - checks current move from Human/Computer object 
    - the `Move` as entered by the user or chosen by the computer will be what gets checked 
  - determines a winner
    - adds to the state of a player by incrementing its running score with each win


#### RPSGame :joystick:
- noun 
- exposes :human and :computer ivars to the public interface so we can display moves
- behaviors:
  - hello 
  - goodbye 
  - displays the moves in the current round
  - displays the winner of the current round
  - play functionality
    - hello 
    - game cycle 
      - human's turn 
      - computer's turn 
      - display move 
      - display winner 
      - breaks if the user doesn't want to play again 
    - goodbye


