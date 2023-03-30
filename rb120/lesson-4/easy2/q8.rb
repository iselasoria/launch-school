# if we have this class:

class Game
  def play
    "Start the game!"
  end
end

# and another:
class Bingo < Game # we add the `<` which reads as "inherits from"
  def rules_of_play
    #rules of play
  end
end

# What can we add to the Bingo
# class to allow it to inherit the play method from the Game class?