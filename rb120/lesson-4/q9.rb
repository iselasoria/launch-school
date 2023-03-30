# if we have:

class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

# What would happen if we added a play method to the Bingo class?
# keeping in mind that there is already a method of this name 
# in the Game class that the Bingo class inherits from.

# S:
# if we were to add a method `play` to the Bingo class we'd be overriding the 
# method it inherits from the Game superclass. Ruby will search the calling object's class
# to resolve a method, and then it will go look in ancestor classes if nothign is found