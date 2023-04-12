# Footbal Spike

# X There is a football team that has 11 players

# There is a goalkeeper, defense, midfilder, and fowards

# All players kick and run, only the goalkeeper can use his hands

# The score starts at 0

# teams have different uniforms

# there is a refferee who can call fouls and whistle

# game is split in two halves of 45 mins

# a goal increments the score

# team with highest score wins the match

=begin
NOUNS:
proper nouns:
- team, player (all types), match

common nouns:
- score, uniforms

VERBS:
- run, kick, catch/block, blow whistle call foul, incremet score, win the match, score_goal?

# Match/OrchestrationEngine
  # forward shoots--> forward_obj.shoot
  # other goalkeeper blocks


# Team
  # 11 player
  # score starts at 0
  # score increases when there is a goal
  # team score must be greater than the other team score to win

# Player
  # jersey has a number
  # uniniform
  # run
  # kick

# Goalkeeper
  # check to see if a goal was scored
  # can use hands
  # can block/catch ball


# Defense
  # defends the goal

# Forward
  # plays offense toward other goal

# Midfielder
  # makes passes between defense and offense

# Refferee
  # calls foul
  # blows whistle

=end
module Scorable
  def goal
    "Goaaaaalll!"
  end
end

### colab obj is a has a relationship as in is amde up of
class Match
include Scorable

  def initialize(chicagofire, lafc)
    @chicagofire = Team.new("Chicago Fire",[Goalkeeper.new(1), Midfielder.new(6), Defense.new(2), Forward.new(10)])
    @lafc = Team.new("lafc", [Goalkeeper.new(1), Midfielder.new(6), Defense.new(2), Forward.new(10)])
  end

  def start
    # chicagofire = Team.new('Chicagofire', [Goalkeeper.new(1), Midfielder.new(6), Defense.new(2), Forward.new(10)])
    chicagofire.team_roster[-1].kick
    chicagofire.team_roster[2].run
    goal
  end

  def finish
    # can you access chicago fire down here???? Why?
  end
end

class Team
  attr_reader :team_roster
  @@number_of_players = 11

  def initialize(name, team_roster)
    @name = name
    @score = 0
    @team_roster = team_roster
  end

  # def increment_score
  # end

  # def to_s
  #   ""
  # end
end

class Player
  # jersey has a number
  def initialize(jsy_num)
    @jsy_num = jsy_num
  end

  # uniniform
  # run
  def run
    puts "I'm running"
  end
  # kick

  def kick
    puts "kick!"
  end


end

class Goalkeeper < Player
  # check to see if a goal was scored
  # can use hands
  # def block

  # end
  # can block/catch ball

end

class Defense < Player

  def defend
    puts "Defending the goal"
  end
end

class Midfielder < Player
  def run_a_lot
    "I'm a midfilder and I run a lot"
  end
end

class Forward < Player
  def offense
    puts "I'm always trying to score a goal"
  end
end

class Referee
    # calls foul
  def foul
    puts "Foul!"
  end
  # blows whistle

  def blow_whistle
    puts "Pfffttt!!"
  end
end

# chicagofire = Team.new("Chicago Fire", [Goalkeeper.new(1), Midfielder.new(6), Defense.new(2), Forward.new(10)])

# p chicagofire

# oliver = Goalkeeper.new(1)
# oliver.kick

# chris = Defense.new(2)
# chris.kick

# p chicagofire.team_roster[-1]   # can you access forward(10) object????

new_match = Match.new
p new_match.start