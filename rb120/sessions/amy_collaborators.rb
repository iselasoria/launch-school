
# Design a Sports Team (Author Unknown...thank you!)

# - Include 4 players (attacker, midfielder, defender, goalkeeper)
# - All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
# - All players can run and shoot the ball.
# - Attacker should be able to lob the ball
# - Midfielder should be able to pass the ball
# - Defender should be able to block the ball
# - The referee has a whistle. He wears black and is able to run and whistle.

Nouns:

Verbs:


class Ball
  attr_writer :speed
  
  def initialize(speed=0)
    @speed = speed
  end
end

ball = Ball.new

module Runnable 
  def run 
    "Running!"
  end
end

class Player
  include Runnable

  attr_accessor :name, :has_ball

  def initialize(name, ball=nil, color="blue")
    @name = name
    @has_ball = ball
    @color = color
  end

  def receive(ball)
    self.has_ball = true
  end

  def shoot
    self.has_ball = false 
  end
end

class Attacker < Player

  def lob
    "I love to lob."
  end
end 

class Midfielder < Player
  def pass
    "Paasing!!!!!"
  end
end

class Defender < Player
  def block
    "Ninja block!!!"
  end
end

class Goalkeeper < Player
  def initialize(name, ball=nil, color="white and blue")
    super
  end

  def stop_goal
    self.has_ball = true 
  end
end

class Referee
  include Runnable
  
  def initialize(name, color = "black")
    @name = name 
    @color = color 
  end

  def whistle 
    "pfftttttt!!!!!"
  end 
end 


ball = Ball.new
rosa = Player.new("Rosa", ball)
p rosa
rosa.receive(ball)
rosa.shoot 
p rosa
tina = Goalkeeper.new('Tina')
p tina
# Originally by Natalie Thompson, this version by James Wilson
# class Wizard
#   attr_reader :name, :hitpoints
  
#   def initialize(name, hitpoints)
#     @name = name
#     @hitpoints = hitpoints
#   end  
  
#   def fireball
#     "casts Fireball for 500 damage!"
#   end
  
# end

# class Summoner < Wizard
#   attr_reader :souls
  
#   def initialize(name, hitpoints)
#     # only add one line here
#     @souls = []
#   end
  
#   def soul_steal(character)
#     @souls << character
#   end
# end

# gandolf = Summoner.new("Gandolf", 100)
# p gandolf.name # => "Gandolf"

# valdimar = Wizard.new("Valdimar", 200)
# p valdimar.fireball #=> "casts fireball for 500 damage!"

# p gandolf.hitpoints #=> 100

# p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

# p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"